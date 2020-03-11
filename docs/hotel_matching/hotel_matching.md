# Hotel Matching
## Architecture
![architecture](/hotel_matching/high_level_architecture.png "high level architecture")

![architecture](/hotel_matching/hotel_services_matching_details.png "matching details")

GCS: https://console.cloud.google.com/storage/browser/wego-services-logs/production/stg_hotel_services_hotel_matches?project=wego-cloud&pli=1

BQ: 
https://bigquery.cloud.google.com/table/wego-cloud:services_hotel_staging.hotel_matches20190814?pli=1


## Broad Matching

In elasticsearch

## Narrow Matching

List of wego hotels from elasticsearch passed into a custom algorithm to produce a score and sorted by highest score.

Each attributes has its own algorithm / scoring system and it will return a score object with its score and confidence.

The attributes and algorithm are as follow:
_note that if there are no relevate attributes passed, it will return a score object with 0 score and 0 confidence._

1. location name

   <p style="color: red">QUESTION: how did we match provider location to wego location?</p>

   [using ngram distance. click here to understand](#Ngram-Distance)

2. hotel name
   Takes in provider hotel name, wego hotel name and wego city name.

   1. get the score of the raw names using [ngram distance](#Ngram-Distance).
   2. remove the first occurence of " city_name " in wego hotel name and "city_name" in provider hotel name. Note the spacing.
      Example:

   ```
   provider_hotel_name = "Marina Bay Sands Singapore in Singapore"
   => "Marina Bay Sands in Singapore"

   wego_hotel_name = "Marina Bay Sands Singapore"
   => "Marina Bay Sands Singapore" (Singapore not removed because it is
   trying to find " Singapore ")
   ```

   3. remove all [keywords](#Keyword-Definition) from the hotel names.
   4. get the score of both names that are changed using [ngram distance](#Ngram-Distance).
   5. Compare both scores

   ```
   if raw name score is >= to
   treated name(i.e. name with removed words) score and treated name confidence
   is less than 0.5, use the raw name score, else, use treat name score.
   ```

3. keywords
   takes in 2 provider hotel name and wego hotel name. [keywords definition](#Keyword-Definition)
   ```
   keyword found in str1, not found in str2 AND
   keyword found in str2 and not found in str1 return 1
   else return 0
   ```
   Example:
   ```
   getKeywords('a has hotel', 'b has suite too')
   => 0
   getKeywords('a has nothing', 'b has suite')
   => 1
   getKeywords('a has hotel villa', 'b has suite too')
   => 1
   ```
4. address
   takes in wego address and provider address.

   1. finds the numbers in the addresses
      example:

   ```
   wego_address = "123 east west 456"
   num_in_wego_address = [123, 456]

   provider_address = "123 Tanglin Road St 21 Singapore 98765"
   num_in_provider_address = [123, 21, 98765]
   ```

   2. get the min group size and max, for the example above, min = 2, max = 3.
   3. Calculate the [number of intersections](#Number-Of-Intersections) based on the num in wego address and num in provider address.
   4. Calculate the number coefficient based on this:
      `num_coeff = 1 / (1+(min_group_size - num_intersection).to_f/(min_group_size+1))`
   5. get the score of address using [ngram distance](#Ngram-Distance).
   6. Final score would be
      `address ngram score * num coefficient`
   7. Final confidence = address ngram confidence

5. lat long

   1. switch provider lon lat if wrong based on:
      `(wego_lon - provider_lon).abs + (wego_lat - provider_lat).abs > (wego_lon - provider_lat).abs + (wego_lat - provider_lon).abs`
   2. get haversine distance between provider lat lon and wego lat lon
   3. if distance < 2500 and distance > 0,2, assign `score = 0.15/distance`
   4. else if distance < 2500 and distance < 0.2, assign `score = 1 - 4 * distance * distance`
   5. if distance > 2500, score = 0
   6. this scoring system is a little special, it includes a num_coeff which if distance is < 2500, num_coeff = 1. else num_coeff = 0.
      Example:

   ```
   if distance = 0.1, score = 1 - 4 * distance * distance  = 0.96.
   Therefore, final scoring object:
   num_coeff = 1, score = 0.96, confidence = distance = 0.1

   if distance = 2600
   final scoring object:
   num_coeff = 0, score = 0, confidence = 2600
   ```

6. postal code
   [using match distance. click here to understand](#Match-Distance)
7. email
   [using match distance. click here to understand](#Match-Distance)
8. phone numbers
   accepts up to 3 phone numbers
   [using match distance. click here to understand](#Match-Distance)

Based on all these individual calculated components, there is a final evaluating address based on address, postal code and latlon. formula as follow:
`(address_lat_lon_max * W_ADDRESS_LONLAT_MAX + (W_ADDRESS_AVG * @address.score * @address.confidence + W_LONLAT_AVG * @lonlat.score * @lonlat.num_coeff)/ (W_ADDRESS_AVG+ W_LONLAT_AVG) * W_ADDRESS_LONLAT_AVG + @location_name.score * W_LOCATION + @postal.score * W_POSTAL)/(W_ADDRESS_LONLAT_MAX + W_ADDRESS_LONLAT_AVG + W_LOCATION + @postal.score * W_POSTAL)`
where the constants are:

```
W_ADDRESS_LONLAT_MAX = 15
W_ADDRESS_LONLAT_AVG = 15
W_LONLAT_AVG = 10
W_ADDRESS_AVG = 30
W_LOCATION = 5
W_POSTAL = 1
W_NAME = 15
W_ADDRESS = 10
W_EMAIL = 3
W_PHONE = 3
```

**Finally**, the final match score with the weights are:

```
score = ((W_NAME * name.confidence * name.score) +
(W_ADDRESS * address_score) +
(W_EMAIL * email.score) +
(W_PHONE * phone.score)) /
(W_NAME* name.confidence +
W_ADDRESS +
W_EMAIL * email.score +
W_PHONE * phone.score )

if keyword score is 1 and final score is more than 0.7, return 0.7.
else, return final score.
```

## Algorithm Appendix

#### Keyword Definition

`['hotel', 'villa', 'residence', 'suite', 'apartment']`

### Number of Intersections

```
arr_1 = ["aab", "abc", "bcd", "cde", "dec", "ecd", "cde"]
arr_ 2 = ["aab", "abc", "bcd", "cde", "dec", "ecd", "cde", "def", "efg"]

by comparing arr1 and arr2, you will notice 7 elements are the
same (it will include duplicates. note that "cde" appeared twice.)

num_of_duplicates = 7
```

#### Match Distance

as long as both list have 1 same return 1
but the same string is not empty string
Example:

```
arr1 = [1,2,3]
arr2 = [1,4,5]
=> 1

arr1 = ["", 2]
arr2 = ["", 3]
=> 0
```

#### Ngram Distance

Takes in two strings, str1, str2 and n.

1. Calculate the total number of ngrams each string has.  
   Formula:

```
shorter_num_of_ngram = length_of_shorter_str - (n-1)
longer_num_of_ngram = length_of_longer_str - (n-1)
```

2. Set all strings to lowercase and get the ngram tokens:
   For example:

```
str1 = "The Brown"
n = 3

ngram tokens will be:
["the", "he ", "e b", " br", "bro", "row", "own"]
```

3. Calculate the [number of intersections](#Number-Of-Intersections) between str1 and str2 ngram tokens.

4. Lastly, calculating the score (using old bayes implemntation) and confidence:

```
score = num_of_intersections /
(0.9 * shorter_num_of_ngram + 0.1 * longer_num_of_ngram + 0.07 )
```

I can't understand how the confidence is computed _hence the x, y variable naming_.

```
x = [(shorter_num_of_ngram.to_f/10), 1].min
y = [(shorter_num_of_ngram.to_f/longer_num_of_ngram.to_f), 1].min
confidence = (10 + 10*x + 10*y)/30
```

This method will return a score object of score and confidence.

## Logging Schema

Each provider hotel will log top 10 Wego Hotel

```
provider :RECORD
wego :RECORD

location_name :RECORD
location_name.score :FLOAT
location_name.confidence :FLOAT
location_name.weight :INTEGER

name :RECORD
name.score :FLOAT
name.confidence :FLOAT
name.weight :INTEGER

keyword :RECORD
keyword.score :FLOAT

address :RECORD
address.score :FLOAT
address.confidence :FLOAT
address.weight :INTEGER

lonlat :RECORD
lonlat.score :FLOAT
lonlat.confidence :FLOAT
lonlat.weight :INTEGER

postal :RECORD
postal.score :FLOAT
postal.weight :FLOAT

email :RECORD
email.score :FLOAT
email.weight :FLOAT

phone :RECORD
phone.score :FLOAT
phone.weight :FLOAT

address_score :FLOAT
final_match_score :FLOAT
```
