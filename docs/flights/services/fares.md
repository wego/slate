# Fares

Please follow [this document](https://github.com/wego/wego-docs/wiki/Flights:-Fares) to understand Flexs concepts and usages

## Fares Api

| Type | Endpoint                                                    | Description        |
| ---- | ----------------------------------------------------------- | ------------------ |
| GET  | [/flights/v1/fares/aggs/routes-dates](#get-weekend-routes ) | Get weekend routes |
| GET  | [/flights/v1/fares](#flex-fares )                           | Flexible Fares     |

## Get Weekend Routes

`GET /flights/v1/fares/aggs/routes-dates`

### Logic

1. if departure_city_code or departure_city_name exist, gets popular destination which will be the arrival codes
2. site code is gotten either passed in by the ip or latitude, longitude. It then query the `search` api.
3. it will return the popular search fares.

### Parameters

| Property            | Required? | Data Type | Description        |
| ------------------- | --------- | --------- | ------------------ |
| departure_city_code | No        | String    |                    |
| dates_limit         | No        | String    |                    |
| trip_purpose        | No        | String    |                    |
| source              | No        | String    |                    |
| limit               | No        | String    |                    |
| locale              | No        | String    |                    |
| latitude            | No        | String    |                    |
| longitude           | No        | String    |                    |
| site_code           | No        | String    |                    |
| currency_code       | No        | String    |                    |
| ip                  | No        | String    | ip address of user |
| departure_city_name | No        | String    |                    |

### Example Request Body without params. It will take lat long based on browser

`GET /flights/v1/fares/aggs/routes-dates`

> Request

```http
GET /flights/v1/fares/aggs/routes-dates
```

returns route dates object, status 200 OK

> Response

```http
HTTP 200
```

```json
{  
   "site_code":"SG",
   "locale":"en",
   "routes":[  
      {  
         "departure_city_code":"SIN",
         "departure_city_name":"Singapore",
         "departure_country_name":"Singapore",
         "arrival_city_code":"DPS",
         "arrival_city_name":"Bali",
         "arrival_country_name":"Indonesia",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"224.47",
                  "amount_usd":168.11,
                  "currency_code":"SGD"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/DPS.jpg"
      },
      {  
         "departure_city_code":"SIN",
         "departure_city_name":"Singapore",
         "departure_country_name":"Singapore",
         "arrival_city_code":"BKK",
         "arrival_city_name":"Bangkok",
         "arrival_country_name":"Thailand",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"142.58",
                  "amount_usd":106.78,
                  "currency_code":"SGD"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/BKK.jpg"
      },
      ...
   ]
}
```

### Example Request Body with params.

`GET flights/v1/fares/aggs/routes-dates?departure_city_code=BKK`

> Request

```http
GET flights/v1/fares/aggs/routes-dates?departure_city_code=BKK
```

returns route dates object, status 200 OK

> Response

```http
HTTP 200
```

``` json
{  
   "site_code":"SG",
   "locale":"en",
   "routes":[  
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"HKG",
         "arrival_city_name":"Hong Kong",
         "arrival_country_name":"China",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"6293.64",
                  "amount_usd":196.87,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/HKG.jpg"
      },
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"CNX",
         "arrival_city_name":"Chiang Mai",
         "arrival_country_name":"Thailand",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"1158.22",
                  "amount_usd":36.230000000000004,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/CNX.jpg"
      },
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"SIN",
         "arrival_city_name":"Singapore",
         "arrival_country_name":"Singapore",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"3466.66",
                  "amount_usd":108.44,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/SIN.jpg"
      }
   ]
}
```

## Flex Fares

`GET /flights/v1/fares`

*Flexs APIs implicit 2 default parameters: `fare_age_friction=1` and `max_fare_age=60`. The 2 parameters are used to detemine if data is not outdated by this formula:*

```ruby
fare_age = today - fare.departure_date
lead_time = fare.departure - today
is_valid_fare = fare_age <= lead_time * fare_age_friction & fare_age <= max_fare_age
```

## Purpose

Everyday our metasearch backend system imports millions and millions flight fares from different providers to serve the searches coming from users. While this amount of data is huge and accumulated day by day, there has always been a need to get a semantic insight into it. For example, if you are into budget travelling, you must have wandered, between two given cities, which airline to choose, or which day of the week to go, or even what period of time in a day to depart to get the most attractive price. Or you want to travel but not sure yet where to go and want to compare fare prices to different destinations from where you are. The information from our daily fares might answer all these questions.

As its name suggested, flexible fares API is meant to query our metasearch fares (downloaded from BQ and cached on Elasticsearch), flexibly aggregate them accordingly to different contexts. It can accept query params (either by exact match, by range match or even by excluding) to filter fares and allow grouping by different attributes to aggregate them before returning. Following is the list of query params that can be past in to filter fares.

## Parameters

**Note:** The API support passing params in both type of camelCase and snake_key, meaining passing `airline_code=SG` would be the same as passing `airlineCode=SG`. However, same is not applied for params values, they should always be in snake_key. For example, `groupBy=airline_code` will work but `groupBy=airlineCode` will not.

### Params for exact filters

| No  | Property               | Required | Type            | Description                             |
| --- | ---------------------- | -------- | --------------- | --------------------------------------- |
| 1   | departure_date         | No       | String          | Date of deparure (format: YYYY-MM-DD)   |
| 2   | return_date            | No       | String          | Date of return (format: YYYY-MM-DD)     |
| 3   | departure_airport_code | No       | Array of String | Departure Airport Code                  |
| 4   | arrival_airport_code   | No       | Array of String | Arrival Airport Code                    |
| 5   | departure_city_code    | No       | Array of String | Departure City Code                     |
| 6   | arrival_city_code      | No       | Array of String | Arrival City Code                       |
| 7   | departure_country_code | No       | Array of String | Departure Country Code                  |
| 8   | arrival_country_code   | No       | Array of String | Arrival Country Code                    |
| 9   | departure_continent*   | No       | Array of String | Departure continent                     |
| 10  | arrival_continent*     | No       | Array of String | Arrival Continent                       |
| 11  | departure_city_theme** | No       | Array of String | Departure city theme                    |
| 12  | arrival_city_theme**   | No       | Array of String | Arrival city theme                      |
| 13  | airline_code           | No       | Array of String | Markerting Airline Code                 |
| 14  | airline_alliance***    | No       | Array of String | Allience of Markerting Airline Code     |
| 15  | airline_codes          | No       | Array of String | List of Operating Airline Codes         |
| 16  | adults_count           | No       | Integer         | Number of Adults                        |
| 17  | children_count         | No       | Integer         | Number of Children                      |
| 18  | infants_count          | No       | Integer         | Number of Infants                       |
| 19  | cabin_class            | No       | Array of String | Cabin Class                             |
| 20  | stops_count            | No       | Array of Integer| Number of Stops                         |
| 21  | price_usd              | No       | Float           | Price in USD                            |
| 22  | trip_duration          | No       | Integer         | Number of Days of The Whole Trip        |
| 23  | flight_duration        | No       | Float           | Number of Minutes of the Whole flight   |
| 24  | trip_type              | No       | Array of String | oneway or roundtrip                     |
| 25  | departure_day_of_week  | No       | Array of String | Day of departure data (Monday...Sunday) |
| 26  | site_code              | No       | String          | site_code in which fares are found      |
| 27  | fare_age_friction      | No       | Float           | Default as 1.0                          |
| 28  | max_fare_age           | No       | Float           | Default as 60                           |

*Possible continents: africa, asia, australia-and-pacific, europe, north-america, south-america, islands-of-the-southern-ocean, antarctica, middle-east

**Possible themes: active, adventure, beach, budget, culture, entertainment, family, food, lgbt-friendly, luxury, nature, relaxation, romantic, senior, shopping, street-markets, historical

***Possible airline alliances: star_alliance, sky_team, oneworld, icc

### Params for range filters

| No  | Property            | Required | Type    | Description                                             |
| --- | ------------------- | -------- | ------- | ------------------------------------------------------- |
| 1   | departure_date_from | No       | String  | Deparure after this date                                |
| 2   | departure_date_to   | No       | String  | Deparure after before this date                         |
| 3   | created_at_from     | No       | String  | Fare created after this date                            |
| 4   | created_at_to       | No       | String  | Fare created before this date                           |
| 5   | price_usd_min       | No       | Float   | Price in USD greater than or equal to this price        |
| 6   | price_usd_max       | No       | Float   | Price in USD less than or equal to this price           |
| 7   | trip_duration_min   | No       | Integer | Travel more than this number of days                    |
| 8   | trip_duration_max   | No       | Integer | Travel less than this number of days                    |
| 9   | flight_duration_min | No       | Float   | Total flight time more than this number of hours        |
| 10  | flight_duration_max | No       | Float   | Total flight time less than this number of hours        |
| 11  | departure_time_min  | No       | String  | Departure after this point of time (format: '17:00:00') |
| 12  | departure_time_max  | No       | String  | Departure before this point of time                     |
| 13  | arrival_time_min    | No       | String  | Arrival after this point of time                        |
| 14  | arrival_time_max    | No       | String  | Arrival before this point of time                       |

### Params for exclude filters

| No  | Property                 | Required | Type            | Description                                                 |
| --- | ------------------------ | -------- | --------------- | ----------------------------------------------------------- |
| 1   | exclude_airline_code     | No       | Array of String | Exclude fares from these certain airlines                   |
| 2   | exclude_airline_alliance | No       | Array of String | Exclude fares from airlines that belongs to these alliences |

### Configuration params

| No  | Property      | Required | Type            | Description                                            | Default         |
| --- | ------------- | -------- | --------------- | ------------------------------------------------------ | --------------- |
| 1   | group_by      | No       | Array of String | Group fares based on these params                      |                 |
| 2   | agg_on        | No       | String          | Pick out the one fare with min/max value on this field | price_usd       |
| 3   | agg_metric    | No       | min/max         | To pick out min or max value of the agg_on field       | min             |
| 4   | sort_by       | No       | Boolean         | Sort final fares based on this attributes              | Number of fares |
| 5   | order         | No       | desc/asc        | Order for the sort made from sort_by                   | asc             |
| 6   | per_page      | No       | Integer         | Number of fares to be returned in the response         | 10              |
| 7   | currency_code | No       | String          | To be past to get price in the a given currency code   |                 |  |
| 8   | locale        | No       | String          | Language applied to the response                       | en              |
| 9   | language      | No       | String          | Language applied to the response                       | en              |
| 10  | key_transform | No       | String          | Response keys to be in underscore or camelCase form    | camelCase       |

## List of some typical aggregations

| No  | Usecase description                                               | Description                                                 |
| --- | ----------------------------------------------------------------- | ----------------------------------------------------------- |
| 1   | [No aggregation](#no-aggregation)                                 | Just return filtered fares without any aggregations         |
| 2   | [Aggregated by destinations](#aggregated-by-destinations)         | Filter fares and aggregated by departure and arrival cities |
| 3   | [Aggregated by departure cities](#aggregated-by-departure-cities) | Filter fares and aggregated by departure cities             |
| 4   | [Aggregated by airlines](#aggregated-by-airlines)                 | Filter fares and aggregated by airlines                     |
| 5   | [Aggregated by months](#aggregated-by-months)                     | Filter fares and aggregated by months (not months of year)  |
| 6   | [Aggregated by days of week](#aggregated-by-days-of-week)         | Filter fares and aggregated by days of week (Mon-Sun)       |
| 7   | [Aggregated by hours of day](#aggregated-by-days-of-week)         | Filter fares and aggregated by hours of day (0 - 23)        |

### No aggregation

Return a list of filtered fares without any aggregations. By default, fares are sorted by price in ascending order.

### Example

`GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currencyCode=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25`

> Request

```http
GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currencyCode=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25
```

return three cheapest fares from Hanoi to Singapore with departure date from 2018-05-20 to 2018-05-25.

> Response

```http
HTTP 200
```

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 136,
    "price": "3096212.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 143.21947,
    "price": "3260585.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 0,
    "airlineCode": "MI",
    "airlineName": "SilkAir",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 202.76624,
    "price": "4616316.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "18"
  }
]
```

To get fares in the descending order, just need to set `order` param to `desc`:

`GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currency_code=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25&order=desc`

> Request

```http
GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currency_code=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25&order=desc
```

return three most expensive fares from Hanoi to Singapore with departure date from 2018-05-20 to 2018-05-25

> Response

```http
HTTP 200
```

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1867,
    "price": "42504617.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 1,
    "airlineCode": "OZ",
    "airlineName": "Asiana Airlines",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1556.4697,
    "price": "35435009.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "23"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 1,
    "airlineCode": "JL",
    "airlineName": "Japan Airlines",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1432.9524,
    "price": "32622920.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "00"
  }
]
```

### Aggregated by destinations

Return a list of filtered fares aggregated by departure and arrival cities. By default it:

- picks the min price fare of all pairs of departure and arrival city and
- sorts all those min fare in descending order based on popularity (number of fares) between a pair of destinations

**Query:** *Return minimum price fares for three most popular destinations departing from Hanoi*

`GET /flights/fares?groupBy[]=departure_city_code&groupBy[]=arrival_city_code&departureCityCode[]=HAN&currencyCode=VND&perPage=3`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "BKK",
    "arrivalCityName": "Bangkok",
    "arrivalCityLat": 13.7563,
    "arrivalCityLong": 100.502,
    "arrivalCountryCode": "TH",
    "arrivalCountryName": "Thailand",
    "departureDate": "2018-09-20",
    "stopsCount": 0,
    "airlineCode": "FD",
    "airlineName": "Thai AirAsia",
    "createdAt": "2018-03-06",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 38.463352,
    "price": "875591.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  }
]
```

The default behaviors can be changed by:

- setting `metric` to `max` so that maximum (not minimum) fare between a given pair of destinations is picked
- setting `sortBy` to `price` so that fares are sorted by price for all pairs of departure and arrival cities, not by counts anymore. For when sorting is by price, order can be specified by setting `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three minimum price fares which departure city is Hanoi*

`GET /flights/fares?groupBy[]=arrival_city_code&departureCityCode[]=HAN&currencyCode=VND&perPage=3&sortBy=price`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "NHA",
    "arrivalCityName": "Nha Trang",
    "arrivalCityLat": 12.2388,
    "arrivalCityLong": 109.197,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-14",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 30.215538,
    "price": "687997.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  }
]
```

___

### Aggregated by departure cities

Return a list of filtered fares aggregated by departure cities. By default it:

- picks the min price fare for all departure cities and
- sorts all those min fare in descending order based on the number of fares for a departure city

**Query:** *Return min fares for three most popular departure cities in Vietnam*

`GET /flights/fares?groupBy[]=departure_city_code&departureCountryCode[]=VN&perPage=3&currencyCode=VND`

```json
[
  {
    "departureCityCode": "SGN",
    "departureCityName": "Ho Chi Minh City",
    "departureCityLat": 10.8231,
    "departureCityLong": 106.63,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-21",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 11.076746,
    "price": "252250.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "DAD",
    "departureCityName": "Da Nang",
    "departureCityLat": 16.0544,
    "departureCityLong": 108.202,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.720513,
    "price": "357886.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "22"
  }
]
```

The default behaviors can be changed by:

- setting `metric` to max so that maximum (not minimum) fare of a departure city is picked
- setting `sortBy` to `price` so that fares are sorted by price for all departure cities, not by counts. For when sorting is by price, order can be specified by set `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three minimum fares for departure cities in Vietnam*

`GET /flights/fares?groupBy[]=departure_city_code&departureCountryCode[]=VN&perPage=3&currency_code=VND&sortBy=price`

```json
[
  {
    "departureCityCode": "SGN",
    "departureCityName": "Ho Chi Minh City",
    "departureCityLat": 10.8231,
    "departureCityLong": 106.63,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-21",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 11.076746,
    "price": "252250.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "NHA",
    "departureCityName": "Nha Trang",
    "departureCityLat": 12.2388,
    "departureCityLong": 109.197,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-14",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 12.3230715,
    "price": "280480.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "23"
  },
  {
    "departureCityCode": "DLI",
    "departureCityName": "Dalat",
    "departureCityLat": 11.9404,
    "departureCityLong": 108.458,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-29",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-05",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.703173,
    "price": "357430.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "23"
  }
]
```

___

### Aggregated by airlines

Return a list of filtered fares aggregated by airlines. By default it:

- picks the min price fare for all airlines and
- sorts all those min fares in descending order based on the number of fares for each airline

**Query:** *Return min fares for three most popular airlines between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=airline_code&departureCityCode[]=HAN&arrivalCityCode[]=SGN&perPage=3&currencyCode=VND`

```json
[
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-03-31",
      "stopsCount": 0,
      "airlineCode": "VN",
      "airlineName": "Vietnam Airlines",
      "createdAt": "2018-03-08",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 57.38771,
      "price": "1306556.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Saturday",
      "departureHourOfDay": "06"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-09-11",
      "stopsCount": 0,
      "airlineCode": "VJ",
      "airlineName": "VietJet Air",
      "createdAt": "2018-03-11",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 31.999605,
      "price": "728520.0",
      "departureMonth": "2018-09",
      "departureDayOfWeek": "Tuesday",
      "departureHourOfDay": "07"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-05-16",
      "stopsCount": 0,
      "airlineCode": "BL",
      "airlineName": "Jetstar Pacific Airlines",
      "createdAt": "2018-03-01",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 41.148087,
      "price": "936832.0",
      "departureMonth": "2018-05",
      "departureDayOfWeek": "Wednesday",
      "departureHourOfDay": "15"
  }
]

```

The default behaviors can be changed by:

- setting `metric` to max so that maximum (not minimum) fare of an airline is picked
- setting `sortBy` to `price` so that fares are sorted by price for all airlines, not by counts. For when sorting is by price, order can be specified by set `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three airlines with cheapest fare between Hanoi and Ho Chi Minh city*

`GET /flights/fares?group_by[]=airline_code&departureCityCode[]=HAN&arrivalCityCode[]=SGN&perPage=3&currency_code=VND&sortBy=price`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-16",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-01",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 41.148087,
    "price": "936832.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-31",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-08",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 57.38771,
    "price": "1306556.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "06"
  }
]

```

___

### Aggregated by months

Return a list of filtered fares aggregated by months. Note that this is all the available months, not months of a year, so it will display something like `12-2017`, `01-2018` and all the way to `12-2018` (if available), not `January`, `February` or so. By default it picks the min price fare for a month.

**Query:** *Return min fare by months between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 97.33583,
    "price": "2216068.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 68.082695,
    "price": "1549927.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-06-18",
    "returnDate": "2018-06-23",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 364,
    "price": "8286921.0",
    "departureMonth": "2018-06",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "15"
  }
]
```

The `metric` param can be set to `max` to return maximum price of a month.

**Query:** *Return maximum fare by months between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24&priceMetric=max`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2261.2888,
    "price": "51481128.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 1,
    "airlineCode": "SQ",
    "airlineName": "Singapore Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2634.643,
    "price": "59980913.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "TG",
    "airlineName": "Thai Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 310,
    "price": "7057542.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1346.8707,
    "price": "30663200.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-06-18",
    "returnDate": "2018-06-23",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1257.1665,
    "price": "28621066.0",
    "departureMonth": "2018-06",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  }
]
```

___

### Aggregated by days of week

Return a list of filtered fares aggregated by day of week (Mon, Tue...Sun). By default, it picks the min price fare for a day.

**Query:** *Return min fare by days of week between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_day_of_week&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 85.08738,
    "price": "1937182.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 107.0756,
    "price": "2437812.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-16",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 64,
    "price": "1457041.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 83.69128,
    "price": "1905309.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-24",
    "returnDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 94.30112,
    "price": "2146859.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "05"
  }
]
```

The `metric` param can be set to `max` to return maximum price of a day.

**Query:** *Return maximum fare by by days of week between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_day_of_week&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND&priceMetric=max`

```json
[
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-24",
      "returnDate": "2018-03-26",
      "stopsCount": 1,
      "airlineCode": "TG",
      "airlineName": "Thai Airways",
      "createdAt": "2018-03-12",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 1400.8282,
      "price": "31891667.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Saturday",
      "departureHourOfDay": "10"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-04-09",
      "returnDate": "2018-04-13",
      "stopsCount": 1,
      "airlineCode": "CX",
      "airlineName": "Cathay Pacific",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2245.941,
      "price": "51131666.0",
      "departureMonth": "2018-04",
      "departureDayOfWeek": "Monday",
      "departureHourOfDay": "10"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-10-10",
      "returnDate": "2018-10-17",
      "stopsCount": 1,
      "airlineCode": "BR",
      "airlineName": "EVA Air",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 1346.8707,
      "price": "30663200.0",
      "departureMonth": "2018-10",
      "departureDayOfWeek": "Wednesday",
      "departureHourOfDay": "12"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-04-06",
      "returnDate": "2018-04-08",
      "stopsCount": 1,
      "airlineCode": "SQ",
      "airlineName": "Singapore Airlines",
      "createdAt": "2018-03-12",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2634.643,
      "price": "59980913.0",
      "departureMonth": "2018-04",
      "departureDayOfWeek": "Friday",
      "departureHourOfDay": "18"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-20",
      "stopsCount": 1,
      "airlineCode": "HX",
      "airlineName": "Hong Kong Airlines",
      "createdAt": "2018-03-12",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 1192,
      "price": "27137388.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Tuesday",
      "departureHourOfDay": "16"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-25",
      "returnDate": "2018-03-30",
      "stopsCount": 1,
      "airlineCode": "CX",
      "airlineName": "Cathay Pacific",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2261.2888,
      "price": "51481128.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Sunday",
      "departureHourOfDay": "19"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-05-24",
      "returnDate": "2018-05-30",
      "stopsCount": 0,
      "airlineCode": "VJ",
      "airlineName": "VietJet Air",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 94.30112,
      "price": "2146859.0",
      "departureMonth": "2018-05",
      "departureDayOfWeek": "Thursday",
      "departureHourOfDay": "05"
  }
]


```

___

### Aggregated by hours of day

Return a list of filtered fares aggregated by hour intervals of day (0..23). By default, it picks the min price fare for a hour interval.

**Query:** *Return min fare by hours of day between Hanoi and Ho Chi Minh city*

`GET /flights/fares?group_by[]=departure_hour_of_day&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND&perPage=24`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-19",
    "stopsCount": 2,
    "airlineCode": "QV",
    "airlineName": "Lao Airlines",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 703.4149,
    "price": "16014019.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 97.33583,
    "price": "2216068.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-16",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 64,
    "price": "1457041.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-17",
    "returnDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 101.06547,
    "price": "2300986.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "06"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 68.082695,
    "price": "1549927.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-28",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 268,
    "price": "6101359.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "08"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "MH",
    "airlineName": "Malaysia Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 180.19115,
    "price": "4102253.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "13"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-21",
    "returnDate": "2018-04-23",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 125,
    "price": "2845783.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-21",
    "returnDate": "2018-04-22",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 107.0756,
    "price": "2437812.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-13",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 294.63132,
    "price": "6707625.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 579.9688,
    "price": "13203751.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "11"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 1,
    "airlineCode": "HX",
    "airlineName": "Hong Kong Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 1192,
    "price": "27137388.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "16"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-27",
    "returnDate": "2018-05-01",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 135,
    "price": "3073446.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "22"
  }
]
```

The `metric` param can be set to `max` to return maximum price of an hour.

**Query:** *Return maximum fare by hours of day between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24&priceMetric=max`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1346.8707,
    "price": "30663200.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2245.941,
    "price": "51131666.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 1,
    "airlineCode": "SQ",
    "airlineName": "Singapore Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2634.643,
    "price": "59980913.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-17",
    "returnDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 113.23689,
    "price": "2578052.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-23",
    "returnDate": "2018-03-26",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "06"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 85.08738,
    "price": "1937182.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 1,
    "airlineCode": "CI",
    "airlineName": "China Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 427,
    "price": "9721195.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "08"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "13"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-12",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 598,
    "price": "13614227.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2261.2888,
    "price": "51481128.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 72.710106,
    "price": "1655335.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "TG",
    "airlineName": "Thai Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 310,
    "price": "7057542.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-12",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 121.24709,
    "price": "2760410.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-13",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 294.63132,
    "price": "6707625.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 579.9688,
    "price": "13203751.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "11"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 1,
    "airlineCode": "HX",
    "airlineName": "Hong Kong Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 1192,
    "price": "27137388.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "16"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-27",
    "returnDate": "2018-05-01",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 135,
    "price": "3073446.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "22"
  }
]

```

___
