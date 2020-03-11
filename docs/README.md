# Wego API

---

### Making API requests

#### Authentication

To use the Wego API you will need an access token
Getting access token is easy. Send a request to:

```
curl https://srv.wego.com/users/oauth/token \
  -H "Content-Type: application/json" \
  -H "X-Wego-Version: 1" \
  -d '{"grant_type": "password",
  "email": "your@email.com",
  "password": "y0ur-s3cr3t",
  "client_id": "client-id-provided-by-Wego",
  "client_secret": "client-secret-provided-by-Wego"}'
```

This will return a response in the form:

```
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "token_type": "bearer",
  "expires_in": 43199,
  "refresh_token": "ee908bd931c31856...",
  "scope": "users",
  "created_at": 1500000000
}
```

#### Call API

Extract the `access_token` from the previous call and send it with the API request as an authorization header:

```
curl -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGc...' \
  https://srv.wego.com/api_name/api_action/ -d '{..data..}
```

#### Pagination

Requests that return multiple items will be paginated to 10 items by default. You can specify further pages with the `page` parameter. You can also set a custom page with the `perPage` parameter. Note `page` and `perPage` parameters are supported by Services enpoints only, and not supported by Metasearch endpoints.

#### Metasearch API cookie

All requests (`GET`/`POST`) to metasearch apis (`metasearch/hotels` and `metasearch/flights`) requires AWSALB cookie. AWSALB cookie is the session cookie that server returns to client for each request. The client must send back to server the AWSALB cookie to keep the same session.

```
POST https://srv.wego.com/metasearch/hotels/searches?locale=en&currencyCode=SGD
Content-Type: application/json
Connection: keep-alive
Content-Encoding: gzip
Set-Cookie: AWSALB=zTr6w6oV2+8505VSjEHB1tw9dZyzgB10AKnhAlD7wTi0iFqJVAni91js4lMuty2bcwk3NOpkaGInNy6YIJcT5KZOxENIa1QzeGKMPTRwF4RGbuU+aXenT0u/6jcYSHRN+LtRwdvdAsHLKCjE5xYdtfFpX0b3eNeeRe/n4b7NG5E1LK+VEn8R2JK6gWyiOA==; Expires=Mon, 22 Apr 2019 03:48:14 GMT; Path=/
```

---

### [Wego Redis](redis/redis.md)

---

### Places

- [Places](places/places.md)
- [Autocomplete](places/autocomplete.md)

---

### Flights

- [Flights Metasearch API](flights/metasearch.md)
- [Flights Services API](flights/services.md)

---

### [Hotels](#hotels)

- [Create new Hotels Search](#create-new-hotels-search)
- [Fetch hotels search results](#fetch-hotels-search-results)
- [Create new Hotel Search](#create-new-hotel-search)
- [Get Hotel Rates](#get-hotel-rates)
- [Get Hotel Rates with similar hotels](#get-hotel-rates-with-similar-hotels)
- [Get Hotel Details](#get-hotel-details)
- [Get Rate](#get-rate)
- [Get hotels by citycode](#get-hotels-by-citycode)
- [Get popular brands by citycode](#get-popular-brands-by-citycode)
- [Get featured brands by sitecode](#get-featured-brands-by-sitecode)
- [Get rates by hotel ids](#get-rates-by-hotel-ids)
- [Get historical hotel rates](#get-historical-hotel-rates)
- [Get hotel images](#get-hotel-images)
- [Get hotel reviews](#get-hotel-reviews)
- [Get hotel description](#get-hotel-description)
- [Update hotel description](#update-hotel-description)
- [Preview hotel description](#preview-hotel-description)
- [Get hotels by ids](#get-hotels-by-ids)
- [Get metasearch hotel](#get-metasearch-hotel)
- [Create new hotel partner search](#create-new-hotel-partner-search)
- [Fetch hotel partner requests results](#fetch-hotel-partner-requests-results)
- [Get hotel deeplink](#get-hotel-deeplink)

- [Search for rental properties only](#search-for-rental-properties-only)
- [Get Hotel Logos](#get-hotel-logos)
- [Get recommended hotel collections](#get-recommended-hotel-collections)


---


- [Authentication](#authentication)
- [Get booking history](#get-booking-history)
- [Get user info](#get-user-info)
- [Get user tags](#get-user-tags)
- [Contact Us Api](#contact-us-api)
- [Sign Up](#sign-up)
- [Sign In](#sign-in)

---

### Stories

- [Stories Services API](stories/services.md)

---

### [Partners](partners/partners.md)

---

### [Compare Unit](#compare-unit)

- [Flight Search](#compare-unit-flight-search)
- [Flight Deeplink](#compare-unit-flight-deeplink)
- [Flight Airline](#compare-unit-flight-airline)
- [Flight Continue](#compare-unit-flight-continue)
- [Bulk Create Flight Compare Unit Routes](#bulk-create-compare-unit-flight-routes)

* [Hotel Search](#compare-unit-hotel-search)
* [Hotel Deeplink](#compare-unit-hotel-deeplink)

---

### [Reference](#reference)

- [App Types](#app-types)
- [Device Types](#device-types)
- [Locales](#locales)
- [Site Codes](#site-codes)
- [Amount Types](#amount-types)

For tracking purpose, all request should include the following query params:

| Property     | Required? | Data Type | Description                                                                                                             |
| ------------ | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| locale       | No        | String    | The language that the response will be in. <br /> en as default. For Tracking only                                      |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format. For Tracking only |
| deviceType   | No        | String    | The device type of the originating request. For Tracking only                                                           |
| appType      | No        | String    | The application type of the originating request. For Tracking only                                                      |

---

## Places

### Find nearest places

Returns the nearest places based on given latitude and longitude. Detects
latitude and longitude from headers if not given through query params.

```
GET /places/search/nearest
```

### Parameters

| Param         | Required? | Data Type | Description                                                    |
| ------------- | --------- | --------- | -------------------------------------------------------------- |
| latitude      | No        | Number    |
| longitude     | No        | Number    |
| radius        | No        | Number    | the radius from the the latlong to search. defaults to 20 (km) |
| language      | No        | String    | The language that the response will be in. `en` as default     |
| per_page      | No        | Number    | number of results to return. defaults to 20                    |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1    |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`              |

#### Examples

- `/places/search/nearest`
- `/places/search/nearest?latitude=1.28873&longitude=103.854`
- `/places/search/nearest?latitude=13.740192&longitude=100.520889&language=en&radius=50`

### Response

```
        [
          {
            "id": 354,
            "code": "SIN",
            "name": "Singapore Changi Airport",
            "permalink": "singapore-changi-airport",
            "cityId": 6667,
            "cityCode": "SIN",
            "cityName": "Singapore",
            "cityPermalink": "singapore",
            "countryId": 197,
            "countryCode": "SG",
            "countryName": "Singapore",
            "countryPermalink": "singapore",
            "worldRegionId": 2,
            "worldRegionCode": "i",
            "worldRegionName": "Asia",
            "worldRegionPermalink": "asia",
            "airportCount": 0,
            "type": "airport",
            "stationType": "airport",
            "distance": 16.93,
            "lat": 1.35917,
            "long": 103.989
          }
        ]
```

### Search places

Search for places based on a given search term.

```
GET /places/search
```

Parameters

| Param         | Required? | Data Type          | Description                                                                                                                         |
| ------------- | --------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| query         | Yes       | String             | the term to search                                                                                                                  |
| types         | No        | Array of String(s) | the type of place to search. Either `city`, `airport`, `country`, `state`, `district`, or `hotel`. default is `city` and `airport`. |
| min_airports  | No        | Number             | filter places based on minimum airports count. defaults to `1`. doesn't apply to type `hotel`                                       |
| min_hotels    | No        | Number             | filter places based on minimum hotels count. defaults to `1`. doesn't apply to types other than `hotel`                             |
| airline_code  | No        | String             | filter places that has route to the given IATA airline code.                                                                        |
| language      | No        | String             | The language that the response will be in. `en` as default                                                                          |
| per_page      | No        | Number             | number of results to return. defaults to 20                                                                                         |
| page          | No        | Number             | the page to return for multiple page results. defaults to 1                                                                         |
| key_transform | No        | String             | Format of json keys. `camelLower` or `underscore`                                                                                   |

#### Examples

- `/places/search?query=singa`
- `/places/search?query=singa&types[]=city&types[]=country`
- `/places/search?query=new&types[]=city&types[]=airport&min_airports=1`
- `/places/search?query=new&types[]=city&types[]=district&min_hotels=1`
- `/places/search?query=new&types[]=city&types[]=airport&min_airports=1&airline_code=AA`

### Response

```
        [
          {
            "id": 69,
            "code": "NL",
            "name": "Newfoundland and Labrador",
            "permalink": "newfoundland-and-labrador",
            "countryId": 39,
            "countryCode": "CA",
            "countryName": "Canada",
            "countryPermalink": "canada",
            "worldRegionId": 5,
            "worldRegionCode": "n",
            "worldRegionName": "North America",
            "worldRegionPermalink": "north-america",
            "airportCount": 17,
            "hotelCount": 12,
            "type": "state",
            "stationType": "state",
            "distance": 0.0
          },
          {
            "id": 65,
            "code": "NB",
            "name": "New Brunswick",
            "permalink": "new-brunswick",
            "countryId": 39,
            "countryCode": "CA",
            "countryName": "Canada",
            "countryPermalink": "canada",
            "worldRegionId": 5,
            "worldRegionCode": "n",
            "worldRegionName": "North America",
            "worldRegionPermalink": "north-america",
            "airportCount": 0,
            "hotelCount": 109,
            "type": "state",
            "stationType": "state",
            "distance": 0.0
          }
        ]
```

### Get Airport

```
GET path /places/airports/:id
```

#### Example

- `/places/airports/354`

### Response

```
        {
          "id": 354,
          "code": "SIN",
          "name": "Singapore Changi Airport",
          "permalink": "singapore-changi-airport",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionPermalink": "asia",
          "worldRegionCode": "i",
          "cityId": 6667,
          "cityCode": "SIN",
          "cityName": "Singapore",
          "cityPermalink": "singapore",
          "countryId": 197,
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryPermalink": "singapore",
          "lat": 1.35917,
          "long": 103.989,
          "type": "airport",
          "stationType": "airport"
        }
```

### List Airpots

`GET` path `/places/airports`

### Parameters

| Param         | Required? | Data Type | Description                                                 |
| ------------- | --------- | --------- | ----------------------------------------------------------- |
| codes         | No        | Array     | list of IATA airport code(s)                                |
| city_code     | No        | String    | IATA city code(s)                                           |
| country_code  | No        | String    | Coutry code                                                 |
| state_code    | No        | String    | State code                                                  |
| station_type  | No        | String    | must be any one of `airport`, 'bus_station`or`train_station |
| permalinks    | No        | Array     | list of permalinks                                          |
| language      | No        | String    | The language that the response will be in. `en` as default  |
| per_page      | No        | Number    | number of results to return. defaults to 20                 |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1 |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`           |

#### Examples

- `/places/airports?codes[]=SIN&codes[]=KUL`
- `/places/airports?city_code=SIN`
- `/places/airports?country_code=US&page=1&per_page=10`
- `/places/airports?state_code=NY&page=1&per_page=10`
- `/places/airports?country_code=UK&station_type=train_station`
- `/places/airports?permalinks[]=new-york`

### Response

```
        [
          {
            "id": 354,
            "code": "SIN",
            "name": "Singapore Changi Airport",
            "permalink": "singapore-changi-airport",
            "worldRegionId": 2,
            "worldRegionName": "Asia",
            "worldRegionPermalink": "asia",
            "worldRegionCode": "i",
            "cityId": 6667,
            "cityCode": "SIN",
            "cityName": "Singapore",
            "cityPermalink": "singapore",
            "countryId": 197,
            "countryCode": "SG",
            "countryName": "Singapore",
            "countryPermalink": "singapore",
            "lat": 1.35917,
            "long": 103.989,
            "type": "airport",
            "stationType": "airport"
          }
        ]
```

### Get District

```
GET path /places/districts/:id
```

#### Example

- `/places/districts/718`

### Response

```
        {
          "id": 718,
          "name": "Sentosa Island",
          "permalink": "sentosa-island",
          "locationId": 6667,
          "cityId": 6667,
          "cityCode": "SIN",
          "cityName": "Singapore",
          "cityPermalink": "singapore",
          "countryId": 197,
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryPermalink": "singapore",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionPermalink": "asia",
          "worldRegionCode": "i",
          "lat": 1.24977,
          "long": 103.828,
          "type": "district",
          "hotelCount": 18,
          "stationType": "district"
        }
```

### Get Districts

```
GET path /places/districts
```

### Parameters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| city_codes    | No        | Array     | list of IATA city code(s)                                         |
| country_code  | No        | String    |
| state_code    | No        | String    |
| station_type  | No        | String    | must be any one of `airport`, 'bus_station`or`train_station       |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

#### Examples

- `/places/districts?city_codes[]=SIN&page=1&per_page=10`
- `/places/districts?country_code=SG&page=1&per_page=10`
- `/places/districts?state_code=NSW&page=1&per_page=10`
- `/places/districts?permalinks[]=bugis`

### Response

```
      [
        {
          "id": 718,
          "name": "Sentosa Island",
          "permalink": "sentosa-island",
          "locationId": 6667,
          "cityId": 6667,
          "cityCode": "SIN",
          "cityName": "Singapore",
          "cityPermalink": "singapore",
          "countryId": 197,
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryPermalink": "singapore",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionPermalink": "asia",
          "worldRegionCode": "i",
          "lat": 1.24977,
          "long": 103.828,
          "type": "district",
          "hotelCount": 18,
          "stationType": "district"
        },
        {
          "id": 719,
          "name": "Orchard Road",
          "permalink": "orchard-road",
          "locationId": 6667,
          "cityId": 6667,
          "cityCode": "SIN",
          "cityName": "Singapore",
          "cityPermalink": "singapore",
          "countryId": 197,
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryPermalink": "singapore",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionPermalink": "asia",
          "worldRegionCode": "i",
          "lat": 1.30447,
          "long": 103.832,
          "type": "district",
          "hotelCount": 68,
          "stationType": "district"
        }
      ]
```

### Get City

```
GET path /places/cities/:id
```

#### Example

- `/places/cities/6667`

### Response

        {
          "id": 6667,
          "code": "SIN",
          "name": "Singapore",
          "permalink": "singapore",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionPermalink": "asia",
          "worldRegionCode": "i",
          "countryId": 197,
          "countryName": "Singapore",
          "countryPermalink": "singapore",
          "countryCode": "SG",
          "lat": 1.28873,
          "long": 103.854,
          "type": "city",
          "hotelCount": 648,
          "airportCount": 1,
          "timeZone": "+08:00",
          "stationType": "city"
        }

### List Cities

```
GET path /places/cities
```

### Parameters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| codes         | No        | Array     | list of IATA city code(s)                                         |
| country_code  | No        | String    | Coutry code                                                       |
| state_code    | No        | String    | State code                                                        |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

#### Examples

- `/places/cities?codes[]=SIN&codes[]=KUL`
- `/places/cities?country_code=AU&page=1&per_page=10&language=ar`
- `/places/cities?state_code=NY&page=1&per_page=10`
- `/places/cities?permalinks[]=singapore&permalinks[]=kuala-lumpur`

### Response

```
        [
          {
            "id": 6667,
            "code": "SIN",
            "name": "Singapore",
            "permalink": "singapore",
            "worldRegionId": 2,
            "worldRegionName": "Asia",
            "worldRegionPermalink": "asia",
            "worldRegionCode": "i",
            "countryId": 197,
            "countryName": "Singapore",
            "countryPermalink": "singapore",
            "countryCode": "SG",
            "lat": 1.28873,
            "long": 103.854,
            "type": "city",
            "hotelCount": 648,
            "airportCount": 1,
            "timeZone": "+08:00",
            "stationType": "city"
          }
        ]
```

## List Popular Cities for Flights

```
GET path /places/cities/popular/flights
```

### Parameters

| Param         | Required?                | Data Type | Description                                                                                                        |
| ------------- | ------------------------ | --------- | ------------------------------------------------------------------------------------------------------------------ |
| code          | Yes (if no country_code) | String    | IATA city code                                                                                                     |
| country_code  | Yes (if no code)         | String    | Coutry code                                                                                                        |
| language      | No                       | String    | The language that the response will be in. <br /> `en` as default                                                  |
| per_page      | No                       | Number    | number of results to return. defaults to 20                                                                        |
| page          | No                       | Number    | the page to return for multiple page results. defaults to 1                                                        |
| key_transform | No                       | String    | Format of json keys. `camelLower` or `underscore`                                                                  |
| domestic      | No                       | Boolean   | True would return only cities within the same country ( based from country_code or the country of the city `code`) |
| currencyCode  | No                       | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format               |

#### Examples

- `/places/cities/popular/flights?site_code=SG&per_page=10`
- `/places/cities/popular/flights?site_code=SA&domestic=true`

###

```
    [
        {
            "id": 3356,
            "code": "JED",
            "name": "Jeddah",
            "permalink": "jeddah",
            "cityId": 3356,
            "cityCode": "JED",
            "cityName": "Jeddah",
            "cityPermalink": "jeddah",
            "worldRegionId": 9,
            "worldRegionName": "Middle East",
            "worldRegionPermalink": "middle-east",
            "worldRegionCode": "m",
            "countryId": 192,
            "countryName": "Saudi Arabia",
            "countryPermalink": "saudi-arabia",
            "countryCode": "SA",
            "lat": 21.5169,
            "long": 39.2192,
            "type": "city",
            "hotelCount": 453,
            "airportCount": 1,
            "timeZone": "+03:00",
            "stationType": "city",
            "enName": "Jeddah",
            "enPermalink": "jeddah",
            "cityEnName": "Jeddah",
            "cityEnPermalink": "jeddah",
            "worldRegionEnName": "Middle East",
            "worldRegionEnPermalink": "middle-east",
            "countryEnName": "Saudi Arabia",
            "countryEnPermalink": "saudi-arabia",
            "price" {
              amountUsd: 38.6753,
              amount: 38.6753,
              currencyCode: 'USD'
            }
        },
        {
            "id": 6422,
            "code": "RUH",
            "name": "Riyadh",
            "permalink": "riyadh",
            "cityId": 6422,
            "cityCode": "RUH",
            "cityName": "Riyadh",
            "cityPermalink": "riyadh",
            "worldRegionId": 9,
            "worldRegionName": "Middle East",
            "worldRegionPermalink": "middle-east",
            "worldRegionCode": "m",
            "countryId": 192,
            "countryName": "Saudi Arabia",
            "countryPermalink": "saudi-arabia",
            "countryCode": "SA",
            "lat": 24.6408,
            "long": 46.7728,
            "type": "city",
            "hotelCount": 634,
            "airportCount": 1,
            "timeZone": "+03:00",
            "stationType": "city",
            "enName": "Riyadh",
            "enPermalink": "riyadh",
            "cityEnName": "Riyadh",
            "cityEnPermalink": "riyadh",
            "worldRegionEnName": "Middle East",
            "worldRegionEnPermalink": "middle-east",
            "countryEnName": "Saudi Arabia",
            "countryEnPermalink": "saudi-arabia",
            "price" {
              amountUsd: 38.6753,
              amount: 38.6753,
              currencyCode: 'USD'
            }
        }
    ]
```

## List Popular Cities for Hotels

```
GET path /places/cities/popular/hotels
```

### Parameters

| Param         | Required?                | Data Type | Description                                                                                                        |
| ------------- | ------------------------ | --------- | ------------------------------------------------------------------------------------------------------------------ |
| code          | Yes (if no country_code) | String    | IATA city code                                                                                                     |
| country_code  | Yes (if no code)         | String    | Coutry code                                                                                                        |
| language      | No                       | String    | The language that the response will be in. <br /> `en` as default                                                  |
| per_page      | No                       | Number    | number of results to return. defaults to 20                                                                        |
| page          | No                       | Number    | the page to return for multiple page results. defaults to 1                                                        |
| key_transform | No                       | String    | Format of json keys. `camelLower` or `underscore`                                                                  |
| domestic      | No                       | Boolean   | True would return only cities within the same country ( based from country_code or the country of the city `code`) |

#### Examples

- `/places/cities/popular/hotels?site_code=SG&per_page=10`
- `/places/cities/popular/hotels?site_code=SA&domestic=true`

###

```
    [
        {
            "id": 3356,
            "code": "JED",
            "name": "Jeddah",
            "permalink": "jeddah",
            "cityId": 3356,
            "cityCode": "JED",
            "cityName": "Jeddah",
            "cityPermalink": "jeddah",
            "worldRegionId": 9,
            "worldRegionName": "Middle East",
            "worldRegionPermalink": "middle-east",
            "worldRegionCode": "m",
            "countryId": 192,
            "countryName": "Saudi Arabia",
            "countryPermalink": "saudi-arabia",
            "countryCode": "SA",
            "lat": 21.5169,
            "long": 39.2192,
            "type": "city",
            "hotelCount": 453,
            "airportCount": 1,
            "timeZone": "+03:00",
            "stationType": "city",
            "enName": "Jeddah",
            "enPermalink": "jeddah",
            "cityEnName": "Jeddah",
            "cityEnPermalink": "jeddah",
            "worldRegionEnName": "Middle East",
            "worldRegionEnPermalink": "middle-east",
            "countryEnName": "Saudi Arabia",
            "countryEnPermalink": "saudi-arabia",
            "priceUsd":38.6753
        }
    ]
```

### Get State

```
GET path /places/states/:id
```

#### Example

- `/places/states/35`

### Response

```
        {
          "id": 35,
          "code": "NY",
          "name": "New York",
          "permalink": "new-york",
          "countryId": 231,
          "countryCode": "US",
          "countryName": "United States",
          "countryPermalink": "united-states",
          "worldRegionId": 5,
          "worldRegionName": "North America",
          "worldRegionCode": "n",
          "worldRegionPermalink": "north-america",
          "lat": 0,
          "long": 0,
          "type": "state",
          "airportCount": 20,
          "stationType": "state"
        }
```

### List States

```
GET path /places/states
```

### Parameters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| codes         | No        | Array     | list of state codes                                               |
| country_code  | No        | String    | Coutry code                                                       |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

#### Examples

- `/places/states?codes[]=NY&codes[]=OH`
- `/places/states?country_code=US&page=1&per_page=10`
- `/places/states?permalinks[]=new-york`

### Response

```
        [
          {
            "id": 35,
            "code": "NY",
            "name": "New York",
            "permalink": "new-york",
            "countryId": 231,
            "countryCode": "US",
            "countryName": "United States",
            "countryPermalink": "united-states",
            "worldRegionId": 5,
            "worldRegionName": "North America",
            "worldRegionCode": "n",
            "worldRegionPermalink": "north-america",
            "lat": 0,
            "long": 0,
            "type": "state",
            "airportCount": 20,
            "stationType": "state"
          }
        ]
```

### Get Country

```
GET path /places/countries/:id
```

#### Example

- `/places/countries/197`

### Response

        {
          "id": 197,
          "code": "SG",
          "name": "Singapore",
          "permalink": "singapore",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionCode": "i",
          "worldRegionPermalink": "asia",
          "lat": 1.35625,
          "long": 103.823,
          "type": "country",
          "airportCount": 1,
          "stationType": "country"
        }

### List Countries

```
GET path /places/countries
```

#### Paremeters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| codes         | No        | Array     | list of country codes                                             |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

#### Examples

- `/places/countries?codes[]=SG`
- `/places/countries?codes[]=SG&codes[]=MY`
- `/places/countries?permalinks[]=singapore`
- `/places/countries?codes[]=SG&language=ar`

#### Response 200

```
        [
          {
            "id": 197,
            "code": "SG",
            "name": "Singapore",
            "permalink": "singapore",
            "worldRegionId": 2,
            "worldRegionName": "Asia",
            "worldRegionCode": "i",
            "worldRegionPermalink": "asia",
            "lat": 1.35625,
            "long": 103.823,
            "type": "country",
            "airportCount": 1,
            "stationType": "country"
          }
        ]
```

## List Popular Countries for Flights

```
GET path /places/countries/popular/flights
```

| Param         | Required? | Data Type | Description                                                                                          |
| ------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| site_code     | No        | Array     | list of country codes                                                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default                                    |
| per_page      | No        | Number    | number of results to return. defaults to 20                                                          |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1                                          |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| currencyCode  | No        | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |

### Examples

- `/places/countries/popular/flights?site_code=SA&per_page=11language=ar`
- `/places/countries/popular/flights?site_code=VN`

### Response

```
    [
      {
          "id": 213,
          "code": "TW",
          "name": "Taiwan",
          "permalink": "taiwan",
          "countryId": 213,
          "countryCode": "TW",
          "countryName": "Taiwan",
          "countryPermalink": "taiwan",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionCode": "i",
          "worldRegionPermalink": "asia",
          "lat": 23.601,
          "long": 121.001,
          "type": "country",
          "airportCount": 13,
          "stationType": "country",
          "keyCityCode": "TPE",
          "enName": "Taiwan",
          "enPermalink": "taiwan",
          "worldRegionEnName": "Asia",
          "worldRegionEnPermalink": "asia",
          "countryEnName": "Taiwan",
          "countryEnPermalink": "taiwan",
          "price": {
            amount: 10,
            amountUsd: 10,
            currencyCode: 'USD'
          }
      }
    ]
```

## List Popular Countries for Hotels

```
GET path /places/countries/popular/hotels
```

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| site_code     | No        | Array     | list of country codes                                             |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

### Examples

- `/places/countries/popular/hotels?site_code=SA&per_page=11language=ar`
- `/places/countries/popular/hotels?site_code=VN`

### Response

```
    [
      {
          "id": 216,
          "code": "TH",
          "name": "Thailand",
          "permalink": "thailand",
          "countryId": 216,
          "countryCode": "TH",
          "countryName": "Thailand",
          "countryPermalink": "thailand",
          "worldRegionId": 2,
          "worldRegionName": "Asia",
          "worldRegionCode": "i",
          "worldRegionPermalink": "asia",
          "lat": 15.1138,
          "long": 101.012,
          "type": "country",
          "airportCount": 33,
          "stationType": "country",
          "keyCityCode": "BKK",
          "enName": "Thailand",
          "enPermalink": "thailand",
          "worldRegionEnName": "Asia",
          "worldRegionEnPermalink": "asia",
          "countryEnName": "Thailand",
          "countryEnPermalink": "thailand"
      }
    ]
```

## Query Holidays

```
GET path /places/holidays
```

### Parameters

| Param      | Required? | Data Type | Description                                                        |
| ---------- | --------- | --------- | ------------------------------------------------------------------ |
| site_code  | Yes       | String    | 2 letter code for the Point of Sale                                |
| start_date | No        | String    | Start date in YYYY-MM-DD format. Defaults to current date.         |
| end_date   | No        | String    | End date in YYYY-MM-DD format. Defaults to +1 year of `start_date` |
| language   | No        | String    | The language the respond will be translated into. eg 'ID','TH'..   |

#### Examples

- `/places/holidays?site_code=SG`
- `/places/holidays?site_code=SG&start_date=2017-03-01`
- `/places/holidays?site_code=SG&start_date=2017-03-01&end_date=2017-05-15`
- `/places/holidays?site_code=SG&end_date=2017-05-15`

### Response

```
        [
          {
            "name": "Good Friday",
            "key": "good_friday",
            "date": "2017-04-14"
          },
          {
            "name": "Labour Day",
            "key": "labour_day",
            "date": "2017-05-01"
          },
          {
            "name": "Vesak Day",
            "key": "vesak_day",
            "date": "2017-05-10"
          },
          {
            "name": "Hari Raya Puasa",
            "key": "hari_raya_puasa",
            "date": "2017-06-25"
          },
          {
            "name": "Hari Raya Puasa observed",
            "key": "hari_raya_puasa_observed",
            "date": "2017-06-26"
          },
          {
            "name": "National Day",
            "key": "national_day",
            "date": "2017-08-09"
          },
          {
            "name": "Hari Raya Haji",
            "key": "hari_raya_haji",
            "date": "2017-09-01"
          },
          {
            "name": "Diwali/Deepavali",
            "key": "diwali_deepavali",
            "date": "2017-10-18"
          },
          {
            "name": "Christmas Day",
            "key": "christmas_day",
            "date": "2017-12-25"
          }
        ]
```

### Search Spots

```
GET /spots
```

| Property   | Required? | Data Type | Description                                                     |
| ---------- | --------- | --------- | --------------------------------------------------------------- |
| locale     | No        | String    | The language that the response will be in. <br /> en as default |
| latitude   | Yes       | Number    | Latitude                                                        |
| longitude  | Yes       | Number    | Longitude                                                       |
| radius     | No        | Number    | Radius in KM. Default = 10. Max 25.                             |
| categories | No        | Array     | valid values: `attraction`, `food`, `entertainment`, `shop`     |

#### Response

```
[
  {
    "id": 1,
    "name": "So SPA by Sofitel",
    "latitude": 1.24855,
    "longitude": 103.827,
    "category": "attraction",
    "subcategory": "spa",
    "address": "2 Bukit Manis Rd.",
    "postal_code": "099891"
  },
  {
    "id": 3090,
    "location_id": 591,
    "name": "BenCab Museum",
    "latitude": 16.4106,
    "longitude": 120.55,
    "category": "attraction",
    "subcategory": "museum",
    "address": "Asin Rd.",
    "postal_code": "2603"
  }
]
```

---

## Hotels

### Create new Hotels Search

```
POST metasearch/hotels/searches
```

#### Note about currencyCode

When sending search requests, the currencyCode in POST request body is for sending to partner, but in order to display to user, you must send currencyCode as query params in each polling request. (By default currencyCode is USD, unless you do the currency converting on frontend from USD to user currencyCode)

**Query Params**

| Property     | Required? | Data Type | Description                                                                                                                                               |
| ------------ | --------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| locale       | Yes       | String    | The language that the response will be in. <br /> en as default                                                                                           |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format. [Note about currencyCode](#note-about-currencycode) |
| deviceType   | No        | String    | The device type of the originating request. For Tracking only                                                                                             |
| appType      | No        | String    | The application type of the originating request. For Tracking only                                                                                        |
| amountType   | No        | String    | The [amount Type](#amount-types) that will be returned in response (default: PER_NIGHT_PER_ROOM)                                                           |


**Request Body**

| Property    | Required? | Data Type | Description                             |
| ----------- | --------- | --------- | --------------------------------------- |
| search      | Yes       | Object    | Search object                           |
| reviewScale | No        | Number    | Hotel review score scale (default: 100) |

Search Object Body

| Property        | Required? | Data Type | Description                                                                                                                                                                                                                               |
| --------------- | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| cityCode        | No/Yes    | String    | The code of the searched city e.g. "SIN". If both `(latitude/longitude/radius)` and `regionId` are not present, the `cityCode` must be provided.                                                                                          |
| regionId        | No/Yes    | Number    | The id of the searched region. If both `cityCode` and `(latitude/longitude/radius)` are not present, the `regionId` must be provided.                                                                                                     |
| latitude        | No/Yes    | Number    | The latitude of searched location e.g. 10.7893518. If both `cityCode` and `regionId` are not present, the `(latitude/longitude/radius)` must be provided.                                                                                 |
| longitude       | No/Yes    | Number    | The longitude of searched location e.g. 106.6720184. If both `cityCode` and `regionId` are not present, the `(latitude/longitude/radius)` must be provided.                                                                               |
| radius          | No/Yes    | Number    | The radius (in KM) of the searched area e.g. 10.5. If both `cityCode` and `regionId` are not present, the `(latitude/longitude/radius)` must be provided.                                                                                 |
| expandable      | No        | Boolean   | Come along with `cityCode`. `true` if you want to expand the search (20 KM) from the center of searched city (by `cityCode`). The back-end only apply this flag for only small cities having less than 20 hotels and ignore it otherwise. |
| roomsCount      | No        | Number    | Legacy                                                                                                                                                                                                                                    |
| guestsCount     | No        | Number    | Legacy                                                                                                                                                                                                                                    |
| rooms           | Yes       | Object    | List of room breakdowns                                                                                                                                                                                                                   |
| checkIn         | Yes       | Date      |
| checkOut        | Yes       | Date      |
| siteCode        | No        | String    | Country Code of the user. Must be in ISO country code format. <br /> If you are not able to set this, XX will be used and certain content might be unavailable. [More details](#site-codes)                                               |
| locale          | No        | String    | The language that the response will be in. <br /> en as default. [More details](#locales)                                                                                                                                                 |
| currencyCode    | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format. [Note about currencyCode](#note-about-currencycode)                                                                                 |
| deviceType      | Yes       | String    | The device type of the originating request. [More details](#device-types)                                                                                                                                                                 |
| appType         | Yes       | String    | The application type of the originating request. [More details](#app-types)                                                                                                                                                               |
| userCountryCode | No        |
| searchType      | No        | String    | Value is one of "HOTEL", "DISTRICT", "CITY"                                                                                                                                                                                               |
| userLoggedIn    | No        | Boolean   | Set to true if a user logged in. If true, the API might return additional rates that available for logged in users only.                                                                                                                  |

**Room BreakDown**

Number of total guests in rooms must not greater than 60

| Property      | Required? | Data Type | Description                                   |
| ------------- | --------- | --------- | --------------------------------------------- |
| adultsCount   | Yes       | Number    | Number of Adults                              |
| childrenCount | No        | Number    | Number of Children                            |
| childrenAges  | No        | Array     | List of Children Ages (default: 12 years old) |

**Validations**

In addition to all the `Required` fields above, we also apply the following validation on user request:

- latitude value must be from -90 to 90 inclusively
- longitude value must be from -180 to 180 inclusively
- radius value must not be negative. If the given radius is greater than 200, we limit the radius to 200.
- Checkin/checkout dates can not be in the past, and can not be more than current date + 475 days
- It can not be more than 365 days between checkin and checkout
- Number of rooms can not be more than 10
- Number of guests can not be more than 60
- Number of rooms must less than number of guests.

When the validation fails, server will return response with status `422 Unprocessable Entity` and body:

```
{
    "errors": [
        "error message here"
    ]
}
```

#### Supported Amenities

```
id, Name
1, Highspeed Internet
2, Swimming Pool
3, Parking
4, Restaurant
5, Facilities for Disabled
6, Airconditioning
7, Non-smoking Rooms
8, Pet-friendly
9, Safe/Vault
10, Babysitting/Child Services
11, Meeting/Banquet Facilities
12, Business Centre
13, Car Rental
14, Casino
15, Breakfast Buffet
16, Airport Shuttle
17, Golfcourse
18, Spa \\u0026 Wellness Centre
19, Fitness Centre
20, Bar/Lounge
```

#### Currently Supported Themes

```
1, Airport Hotel
2, Lake Hotel
3, Water Park Hotel
4, Luxury Hotel
5, Family Hotel
6, Romantic Hotel
7, Wellness Hotel
8, City Hotel
9, Boutique Hotel
10, Business Hotel
13, Economy Hotel
16, Golf Hotel
18, Resort Hotel
20, Beach Hotel
24, Casino Hotel
```

Example

```
{
    "search": {
        "siteCode": "SG",
        "locale": "en",
        "currencyCode": "USD",
        "cityCode": "SIN",
        "rooms": [
            {
                "childrenAges": [
                    1
                ],
                "childrenCount": 5,
                "adultsCount": 5
            },
            {
                "childrenAges": [],
                "childrenCount": 0,
                "adultsCount": 5
            }
        ],
        "checkIn": "2019-04-24",
        "checkOut": "2019-04-29",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false,
        "userEmail": "test@wego.com"
    },
    "offset": 0,
    "reviewScale": 10
}
```

Response

```
{
  "search": {
    "id": "b3d71332-5581-449c-8e5e-5d389924fe2a",
    "searchType": "CITY",
    "city": {
      "code": "SIN",
      "name": "Singapore"
    },
    "worldRegion": {
      "code": "I",
      "name": "Asia"
    },
    "country": {
      "code": "SG",
      "name": "Singapore"
    },
    "roomsCount": 1,
    "guestsCount": 2,
    "checkIn": "2017-04-08",
    "checkOut": "2017-04-13",
    "createdAt": "2017-03-28T06:24:50.779Z",
    "locale": "en",
    "siteCode": "SG",
    "currencyCode": "USD",
    "deviceType": "DESKTOP",
    "appType": "IOS_APP",
    "userCountryCode": "SG",
    "key": "SIN~2017-04-08~2017-04-13~1~2~SG~en"
  },
  "propertyTypes": [
    {
      "id": 1,
      "name": "Hotel"
    },
    {
      "id": 20,
      "name": "Luxury Hotel"
    }
  ],
  "brands": [
    {
      "id": 240,
      "name": "Ritz-Carlton Hotels"
    },
    {
      "id": 97,
      "name": "Four Seasons"
    }
  ],
  "chains": [
    {
      "id": 597,
      "name": "Shangri-La Group"
    },
    {
      "id": 326,
      "name": "Starwood"
    }
  ],
  "districts": [
    {
      "id": 724,
      "name": "Chinatown"
    },
    {
      "id": 726,
      "name": "Marina Bay"
    }
  ],
  "amenities": [
    {
      "id": 1,
      "name": "Highspeed Internet"
    },
    {
      "id": 2,
      "name": "Swimming Pool"
    }
  ],
  "themes": [
    {
      "id": 1,
      "name": "Airport Hotel"
    },
    {
      "id": 2,
      "name": "Lake Hotel"
    }
  ]
  "hotels": [
    {
      "id": 607592,
      "name": "Crockfords Tower",
      "star": 5,
      "images": [
        {
          "url": "http://res.cloudinary.com/wego/image/upload/v1411844566/hotels/607592/2281836.jpg"
        }
      ],
      "propertyTypeId": 1,
      "brandId": 0,
      "chainId": 0,
      "districtId": 718,
      "imagesCount": 22,
      "amenityIds": [],
      "themeIds": [],
      "reviews": [
        {
          "count": 14,
          "score": 89,
          "percentage": 100,
          "reviewerGroup": "ALL"
        }
      ],
      "longitude": 103.83,
      "latitude": 1.25,
      "distanceToCityCentre": 5.06606,
      "distanceToNearestAirport": 21.4425
    },
    {
      "id": 257965,
      "name": "The Ritz-Carlton, Millenia Singapore",
      "star": 5,
      "images": [
        {
          "url": "http://res.cloudinary.com/wego/image/upload/v1428057081/hotels/257965/2370237.jpg"
        }
      ],
      "propertyTypeId": 14,
      "brandId": 240,
      "chainId": 330,
      "districtId": 726,
      "imagesCount": 30,
      "amenityIds": [],
      "reviews": [
        {
          "count": 6075,
          "score": 94,
          "percentage": 100,
          "reviewerGroup": "ALL"
        },
        {
          "count": 1458,
          "score": 93,
          "percentage": 24,
          "reviewerGroup": "COUPLE"
        },
        {
          "count": 4070,
          "score": 94,
          "percentage": 67,
          "reviewerGroup": "FAMILY"
        },
        {
          "count": 243,
          "score": 92,
          "percentage": 4,
          "reviewerGroup": "SOLO"
        },
        {
          "count": 304,
          "score": 95,
          "percentage": 5,
          "reviewerGroup": "BUSINESS"
        }
      ],
      "longitude": 103.859,
      "latitude": 1.29,
      "distanceToCityCentre": 0.573493,
      "distanceToNearestAirport": 16.3708
    }
  ]
}
```

#### Fetch hotels search results

##### New GET api for polling results

For consistency all apps will need to use this new GET api for polling results

```
GET metasearch/hotels/searches/:searchId/results
```

**Query Params**

| Property      | Required? | Data Type | Description                                                                                                                                               |
| ------------- | --------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| locale        | No        | String    | The language that the response will be in. <br /> en as default                                                                                           |
| currencyCode  | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format. [Note about currencyCode](#note-about-currencycode) |
| offset        | Yes       | Integer   | `count` value from previous response                                                                                                                      |
| clientId      | Yes       | String    | Client Id                                                                                                                                                 |
| reviewScale   | No        | String    | Review Scale, default=100                                                                                                                                 |
| isLastPolling | No/Yes    | Boolean   | Is last polling request (Not applicable for MOBILE device, but DESKTOP device is mandatory)                                                               |
| amountType    | No        | String    | The [amount Type](#amount-types) that will be returned in response (default: PER_NIGHT_PER_ROOM)                                                           |


##### Legacy POST api for polling results

The first response for the search only contains the list of hotels - without the rates yet. Giving you a change to render list of hotels while polling for the rates.

When the same request had been made before and cached, server will try to return rates from cache in first request.

You will need to poll this endpoint to get the hotel `rates` and other data that depends on it - `filter`, `scores` etc

Request

**_Include `searchId` and `offset` as `count` from previous response_**

By including the `offset` as `count` value from previous response, API will only return new data that has not been returned from previous calls.

```
{
    "search": {
      "id": "bafc822d-b612-4c43-94ce-1ef70b925c51",
      "cityCode": "SIN",
      "roomsCount":1,
      "guestsCount":2,
      "checkIn": "2017-05-08",
      "checkOut": "2017-05-13",
      "locale": "en",
      "siteCode": "SG",
      "currencyCode": "USD",
      "deviceType": "desktop",
      "appType": "IOS_APP",
      "userCountryCode": "SG"
    },
    "offset": 500
}
```

Keep calling this endpoint until the `offset` unless `offset` remains the same for 3 consecutive calls.

#### Response

- `count` should be used as an `offset` value in the next request, and it does not indicate a total number of rates in the response.

```
{
  "search": {
    "id": "bafc822d-b612-4c43-94ce-1ef70b925c51",
    "searchType": "CITY",
    "city": {
      "code": "SIN",
      "name": "Singapore"
    },
    "worldRegion": {
      "code": "I",
      "name": "Asia"
    },
    "country": {
      "code": "SG",
      "name": "Singapore"
    },
    "roomsCount": 1,
    "guestsCount": 2,
    "checkIn": "2017-04-08",
    "checkOut": "2017-04-13",
    "locale": "en",
    "siteCode": "SG",
    "currencyCode": "USD",
    "deviceType": "DESKTOP",
    "appType": "IOS_APP",
    "userCountryCode": "SG",
    "key": "SIN~2017-04-08~2017-04-13~1~2~SG~en"
  },
  "propertyTypes": [],
  "stars": [],
  "brands": [],
  "chains": [],
  "districts": [],
  "amenities": [],
  "themes": [],
  "rateAmenities": [],
  "roomAmenities": [
        {
            "id": 32,
            "name": "Internet access"
        }],
  "providers": [],
  "hotels": [],
  "rates": [
    {
      "id": "hotelopia.com~258051~1",
      "hotelId": 258051,
      "providerHotelId": "81079",
      "providerCode": "hotelopia.com",
      "createdAt": "2017-03-28T07:13:19.410Z",
      "description": "DOUBLE SUPERIOR",
      "price": {
        "amount": 99.35299,
        "currencyCode": "USD",
        "amountUsd": 99.35299,
        "taxAmount": 0,
        "taxAmountUsd": 0,
        "taxInclusive": true,
        "description": "DOUBLE SUPERIOR",
        "ecpc": 1.4,
        "localTaxAmount": -1,
        "totalAmount": 496.76495,
        "totalAmountUsd": 496.76495
      },
      "rateAmenityIds": [],
      "remainingRoomsCount": 4,
      "handoffUrl": "https://www.wego.com.sg/continue/258051/6/1?search_id=f42155a8-45c3-460e-beeb-8b4f7c7952ba&site=www.wego.com.sg&locale=en&pwa=true",
      "usualPrice": {
        "usualAmount": 167.59937,
        "usualAmountUsd": 167.59937,
        "usualTotalAmount": 1843.593,
        "usualTotalAmountUsd": 1843.593,
        "discountToUsualAmount": 0.1593915
      }
    }
  ],
  "providerRatesCounts": [
    {
      "hotelId": 258051,
      "providerCode": "hotelopia.com",
      "ratesCount": 1
    }
  ],
  "scores": {
    "257939": 6431763.5
  },
  "rateAmenityIds": {
    "257939": [
      2,
      4,
      5
    ]
  },
  "filter": {
    "minPrice": {
      "amount": 13,
      "currencyCode": "USD",
      "amountUsd": 13,
      "taxAmount": 0,
      "taxAmountUsd": 0,
      "taxInclusive": true,
      "description": "2 Beds in Dormitory – Male Only",
      "ecpc": 0.4,
      "localTaxAmount": 0,
      "totalAmount": 65,
      "totalAmountUsd": 65
    },
    "maxPrice": {
      "amount": 1275.1274,
      "currencyCode": "USD",
      "amountUsd": 1275.1274,
      "taxAmount": 191.75662,
      "taxAmountUsd": 191.75662,
      "taxInclusive": true,
      "description": "One Bedroom Palawan Villa with Breakfast (Free Airport Transfer + Free City Tour)",
      "ecpc": 0.62,
      "localTaxAmount": -1,
      "totalAmount": 6375.637,
      "totalAmountUsd": 6375.637
    },
    "rateAmenities": [
      {
        "code": "1",
        "count": 53
      },
      {
        "code": "2",
        "count": 81
      }
    ],
    "brands": [
      {
        "code": "133",
        "count": 1
      },
      {
        "code": "137",
        "count": 1
      }
    ],
    "chains": [
      {
        "code": "597",
        "count": 4
      }
    ],
    "propertyTypes": [
      {
        "code": "1",
        "count": 195
      }
    ],
    "districts": [
      {
        "code": "2080",
        "count": 3
      }
    ],
    "amenities": [
      {
        "code": "1",
        "count": 258
      }
    ],
    "themes": [
      {
        "code": "1",
        "count": 24
      }
    ],
    "reviewerGroups": [
      {
        "code": "FAMILY",
        "count": 295
      }
    ],
    "stars": [
      {
        "code": "0",
        "count": 60
      },
      {
        "code": "1",
        "count": 31
      },
      {
        "code": "2",
        "count": 77
      },
      {
        "code": "3",
        "count": 65
      },
      {
        "code": "4",
        "count": 102
      },
      {
        "code": "5",
        "count": 59
      }
    ]
  },
  "roomTypeCategories": [
      {
          "id": 1,
          "code": "PRIVATE_ROOM",
          "name": "Private room"
      },
      {
          "id": 2,
          "code": "SHARED_ROOM",
          "name": "Shared room"
      },
      {
          "id": 3,
          "code": "ENTIRE_HOUSE",
          "name": "Entire house"
      }
  ],
  "rentalFilter": {
      "minPrice": {
          "amount": 116,
          "currencyCode": "AED",
          "amountUsd": 31.581694,
          "taxAmount": 0,
          "taxAmountUsd": 0,
          "taxInclusive": true,
          "ecpc": 0.32,
          "localTaxAmount": 0,
          "totalAmount": 348,
          "totalAmountUsd": 94.74508,
          "totalTaxAmount": 0,
          "totalTaxAmountUsd": 0
      },
      "maxPrice": {
          "amount": 537,
          "currencyCode": "AED",
          "amountUsd": 146.20146,
          "taxAmount": 0,
          "taxAmountUsd": 0,
          "taxInclusive": true,
          "ecpc": 0.32,
          "localTaxAmount": 0,
          "totalAmount": 1611,
          "totalAmountUsd": 438.60437,
          "totalTaxAmount": 0,
          "totalTaxAmountUsd": 0
      },
      "roomTypeCategories": [
          {
              "code": "1",
              "count": 20
          },
          {
              "code": "3",
              "count": 21
          }
      ],
      "districts": [
          {
              "code": "723",
              "count": 2
          },
          {
              "code": "2083",
              "count": 1
          },
          {
              "code": "725",
              "count": 2
          },
          {
              "code": "2077",
              "count": 5
          },
          {
              "code": "42285",
              "count": 1
          },
          {
              "code": "42286",
              "count": 1
          },
          {
              "code": "2078",
              "count": 1
          },
          {
              "code": "2079",
              "count": 11
          }
      ],
      "maxBedroomsCount": 2,
      "maxBedsCount": 4,
      "maxBathroomsCount": 2,
      "roomAmenities": [
          {
              "code": "32",
              "count": 64
          },
      ],
  },
  "count": 2033
}
```

#### Notice

`usualPrice` object is optional and only exists inside `rate` object when the rate has discount.

### Create new Hotel Search

Return rates as search response by hotelId

```
POST metasearch/hotels/:hotelId/searches
```

#### Query params

| Property   | Required? | Data Type | Description                                                                                                         |
| ---------- | --------- | --------- | ------------------------------------------------------------------------------------------------------------------- |
| output     | No        | String    | Rate output type of response. Values (default: null):<br>- "ALL_RATES": Return all rates regardless of device type. |
| amountType | No        | String    | The [amount Type](#amount-types) that will be returned in response (default: PER_NIGHT_PER_ROOM)                     |

#### Request body

Input same as [Search endpoint](#create-new-hotels-search) except have 1 more field `hotelId`

| Property | Required? | Data Type | Description          |
| -------- | --------- | --------- | -------------------- |
| hotelId  | Yes       | Number    | For tracking purpose |

#### Notice

This endpoind should be handled by sending several polling requests with same request url and body to get all rates from results.

Example

```
{
    "selectedHotelIds": [123],
    "search": {
        "siteCode": "SG",
        "locale": "en",
        "currencyCode": "USD",
        "cityCode": "SIN",
        "hotelId": 1001,
        "rooms": [
            {
                "childrenAges": [
                    1
                ],
                "childrenCount": 5,
                "adultsCount": 5
            },
            {
                "childrenAges": [],
                "childrenCount": 0,
                "adultsCount": 5
            }
        ],
        "checkIn": "2019-04-24",
        "checkOut": "2019-04-29",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false,
        "userEmail": "test@wego.com"
    },
    "offset": 0,
    "reviewScale": 10
}
```

Response

```
  {
    "rates": [
      {
        "id": "f42155a8-45c3-460e-beeb-8b4f7c7952ba~booking.com~258051~1",
        "hotelId": 258051,
        "providerHotelId": "25016",
        "createdAt": "2017-04-28T07:57:48.724Z",
        "description": "Superior Double or Twin Room - Non-refundable",
        "price": {
          "amount": 148,
          "currencyCode": "SGD",
          "amountUsd": 106.04692,
          "taxAmount": 22.285513,
          "taxAmountUsd": 15.947693,
          "taxInclusive": true,
          "ecpc": 0.49,
          "localTaxAmount": 0,
          "totalAmount": 1924,
          "totalAmountUsd": 1378.61
        },
        "rateAmenityIds": [
          4
        ],
        "provider": {
          "code": "booking.com",
          "name": "Booking.com",
          "type": "OTA",
          "id": 6,
          "isMobileFriendly": true,
          "isHotelWebsite": false
        },
        "remainingRoomsCount": 1,
        "handoffUrl": "https://www.wego.com.sg/continue/258051/6/1?search_id=f42155a8-45c3-460e-beeb-8b4f7c7952ba&site=www.wego.com.sg&locale=en&pwa=true",
        "usualPrice": {
          "usualAmount": 167.59937,
          "usualAmountUsd": 167.59937,
          "usualTotalAmount": 1843.593,
          "usualTotalAmountUsd": 1843.593,
          "discountToUsualAmount": 0.1593915
        }
      }
    ],
    "rateAmenities": {
      "4": {
        "id": 4,
        "code": "FREE_WIFI",
        "type": "AMENITY"
        "name": "Free WiFi"
      }
    },
    "search": {
      "id": "f42155a8-45c3-460e-beeb-8b4f7c7952ba",
      "searchType": "HOTEL",
      "hotel": {
        "id": 1354263,
        "name": "Kam Leng"
      },
      "city": {
        "code": "SIN",
        "name": "Singapore"
      },
      "worldRegion": {
        "code": "I",
        "name": "Asia"
      },
      "country": {
        "code": "SG",
        "name": "Singapore"
      },
      "roomsCount": 1,
      "guestsCount": 2,
      "checkIn": "2017-05-09",
      "checkOut": "2017-05-22",
      "locale": "en",
      "siteCode": "SG",
      "currencyCode": "USD",
      "deviceType": "MOBILE",
      "appType": "IOS_APP",
      "userCountryCode": "SG",
      "key": "SIN~2017-05-09~2017-05-22~1~2~SG~en"
    },
    "score": 32993936
  }
```

`usualPrice` object is optional and only exists inside `rate` object when the rate has discount.

### Get Hotel Rates

```
metasearch/hotels/:hotelId/rates
```

Parameters

| Property          | Required? | Data Type | Description                                                                                                                                               |
| ----------------- | --------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| searchId          | Yes       | String    | Search ID from the previous endpoint.                                                                                                                     |
| locale            | No        | String    | The language that the response will be in. <br /> en as default                                                                                           |
| currencyCode      | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format. [Note about currencyCode](#note-about-currencycode) |
| clientId          | Yes       | String    | Client Id                                                                                                                                                 |
| reviewScale       | No        | String    | Review Scale, default=100                                                                                                                                 |
| wgCampaign        | No        | String    | wgCampaign code for promotion                                                                                                                             |
| output            | No        | String    | Output type: DEFAULT or ALL_RATES                                                                                                                         |
| similarHotelLimit | No        | Integer   | Number of similar hotels (check [Get Hotel Rates with similar hotels](#get-hotel-rates-with-similar-hotels))                                              |
| amountType        | No        | String    | The [amount Type](#amount-types) that will be returned in response (default: PER_NIGHT_PER_ROOM)                                                           |

Response

```
{
  "rates": [
    {
      "id": "agoda.com-smartertravel~810008~1",
      "hotelId": 810008,
      "providerHotelId": "4456040",
      "createdAt": "2017-03-28T06:24:50.779Z",
      "description": "Standard 1 Queen Bed",
      "price": {
        "amount": 147,
        "currencyCode": "USD",
        "amountUsd": 147,
        "taxAmount": 22,
        "taxAmountUsd": 22,
        "taxInclusive": true,
        "description": "Standard 1 Queen Bed",
        "ecpc": 0.69,
        "localTaxAmount": 0,
        "totalAmount": 735,
        "totalAmountUsd": 735
      },
      "rateAmenityIds": [],
      "provider": {
        "code": "agoda.com-smartertravel",
        "name": "Agoda",
        "type": "OTA",
        "id": 462,
        "isMobileFriendly": true,
        "isHotelWebsite": false
      },
      "handoffUrl": "https://www.wego.com.sg/continue/258051/6/1?search_id=f42155a8-45c3-460e-beeb-8b4f7c7952ba&site=www.wego.com.sg&locale=en&pwa=true",
      "usualPrice": {
        "usualAmount": 167.59937,
        "usualAmountUsd": 167.59937,
        "usualTotalAmount": 1843.593,
        "usualTotalAmountUsd": 1843.593,
        "discountToUsualAmount": 0.1593915
      }
    }
  ],
  "rateAmenities": {
    "1": {
      "id": 1,
      "code": "BREAKFAST_INCLUDED",
      "type": "AMENITY"
      "name": "Breakfast Included"
    },
    "3": {
      "id": 3,
      "code": "FREE_PARKING",
      "name": "Free Parking"
    },
    "4": {
      "id": 4,
      "code": "FREE_WIFI",
      "name": "Free WiFi"
    }
  }
}
```

`usualPrice` object is optional and only exists inside `rate` object when the rate has discount.


### Get Hotel Rates with similar hotels
In order to get similar hotels of a certain hotel, Hotel rate api is reused. Apart from polling request params, clients (mobile apps, web apps) need to specify the desired max number of similar hotels and other params related to hotel details (`name`, `star`, `reviews`, `images`).  


#### 1st Search request for Mobile apps & Web apps
For both web apps and mobile apps: 
* If clients start with **a non direct hotel search**, use the existing [new Hotels Search](#create-new-hotels-search).
* If clients start with **a direct hotel search**, the desired max number of similar hotels must be explicitly provided in the body of the 1st POST request:
```
POST metasearch/hotels/{hotelId}/searches
{
  "search": {
    [...]    
  },
  "similarHotels": {
    "limit": 10
  }
}
``` 

#### Polling requests for Mobile apps
```
GET metasearch/hotels/{hotelId}/rates
```

In addition to hotel rate api params, these are additional parameters

| Property          | Required? | Data Type | Description                                                                                                             |
| ----------------- | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| searchId          | Yes       | String    | Search ID from the previous endpoint (can be either *a direct hotel search* or *a City/Region/District/LatLon search*). |
| similarHotelLimit | No        | Number    | The desired max number of similar hotels of this hotel `hotelId`. Default value is `0`.                                 |
| reviewScale       | No        | Number    | The scale of review score of similar hotels. Default value is `100`.                                                    |

Example request:
```
GET metasearch/hotels/258074/rates?currencyCode=AED&locale=en&searchId=b338577ed19de5df&similarHotelLimit=2&reviewScale=10
```

Example Response:
```
{
  [...],
  "similarHotels": [
      {
        "hotelId": 1242078,
        "bestRate": {
          "id": "fd12a18bede759e6:booking.com:1242078:1278",
          "hotelId": 1242078,
          "providerHotelId": "3760784",
          "providerCode": "booking.com",
          "description": "Deluxe Room - Non-refundable",
          "price": {
            "amount": 1545.0,
            "currencyCode": "AED",
            "amountUsd": 420.7072,
            "taxAmount": 232.0,
            "taxAmountUsd": 63.26798,
            "taxInclusive": true,
            "ecpc": 0.45,
            "localTaxAmount": 0.0,
            "totalAmount": 4635.0,
            "totalAmountUsd": 1262.1216,
            "totalTaxAmount": 257.0,
            "totalTaxAmountUsd": 189.80394
          },
          "rateAmenityIds": [
            4
          ],
          "remainingRoomsCount": 9,
          "handoffUrl": "https://handoff.wegostaging.com/hotels/continue/1242078/6/1278?search_id=fd12a18bede759e6&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=pj0aLFthB%2FiPMcKpV2G0Opmu4YiAWyS5UoETMSD1bHI%2BwWTSfD%2FRnyOSF2jUzPzs9NSq06fAKhgsvwAYZa94RTskmLcJ%2BcZhrraDricxuRjnSpZ7ynVJ5qe0gT0jYSPIjyPuZRMULMvr9nIA4SMFFm3Z4JMjXdCPLy2ouSgXxoFQ0iEXbd%2B1495i%2Bl%2Fq%2FQ%3D%3D"
        },
        "similarityScore": 84.638695,
        "name": "The Capitol Kempinski Hotel ",
        "star": 5,
        "reviews": [
          {
            "count": 2,
            "score": 9.1,
            "percentage": 100.0,
            "reviewerGroup": "ALL"
          }
        ],
        "images": [
          {
            "url": "http://assets.wego.com/image/upload/v1537449535/Partner/hotels/1242078/pybjwof0rj6fgkp4um3m.jpg"
          }
        ]
      },
      {
        "hotelId": 258044,
        "bestRate": {
          "id": "fd12a18bede759e6:skoosh.com:258044:240",
          "hotelId": 258044,
          "providerHotelId": "41061",
          "providerCode": "skoosh.com",
          "description": "Double Or Twin Deluxe Marina View - Room Only",
          "price": {
            "amount": 1245.0,
            "currencyCode": "AED",
            "amountUsd": 339.044,
            "taxAmount": 0.0,
            "taxAmountUsd": 0.0,
            "taxInclusive": true,
            "ecpc": 0.17,
            "localTaxAmount": 0.0,
            "totalAmount": 3735.0,
            "totalAmountUsd": 1017.132,
            "totalTaxAmount": 0.0,
            "totalTaxAmountUsd": 0.0
          },
          "rateAmenityIds": [
            
          ],
          "handoffUrl": "https://handoff.wegostaging.com/hotels/continue/258044/302/240?search_id=fd12a18bede759e6&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=pj0aLFthB%2FiPMcKpV2G0Opmu4YiAWyS5UoETMSD1bHI%2BwWTSfD%2FRnyOSF2jUzPzs9NSq06fAKhgsvwAYZa94RTskmLcJ%2BcZhrraDricxuRjnSpZ7ynVJ5qe0gT0jYSPIjyPuZRMULMvr9nIA4SMFFm3Z4JMjXdCPLy2ouSgXxoFQ0iEXbd%2B1495i%2Bl%2Fq%2FQ%3D%3D"
        },
        "similarityScore": 83.846504,
        "name": "Mandarin Oriental, Singapore",
        "star": 5,
        "reviews": [
          {
            "count": 4449,
            "score": 8.9,
            "percentage": 100.0,
            "reviewerGroup": "ALL"
          }
        ],
        "images": [
          {
            "url": "https://assets.wego.com/image/upload/v1524876785/Leo/hotels/258044/108804881.jpg",
            "description": "Marina Bay View"
          }
        ]
      }
    ],
  "similarHotelProviders": [
    {
      "code": "booking.com",
      "name": "Booking.com",
      "type": "OTA",
      "id": 6,
      "isMobileFriendly": true,
      "isHotelWebsite": false
    },
    {
      "code": "skoosh.com",
      "name": "Skoosh",
      "type": "OTA",
      "id": 302,
      "isMobileFriendly": false,
      "isHotelWebsite": false
    }
  ],
}
```

#### Polling requests for Web apps
Currently, web apps still use `POST` method for polling requests. In future, for consistency with mobile apps, can switch to `GET` method (then refer to [Polling requests for Mobile apps](#polling-requests-for-mobile-apps).)
```
POST metasearch/hotels/{hotelId}/searches
{
  "search": {
    "id": "...",
    [...]    
  },
  "similarHotels": {
    "limit": 10
  },
  "reviewScale": 10
}
```

In addition to hotel rate api params, these are additional parameters

| Property            | Required? | Data Type | Description                                                                                                             |
| ------------------- | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| searchId            | Yes       | String    | Search ID from the previous endpoint (can be either *a direct hotel search* or *a City/Region/District/LatLon search*). |
| similarHotels.limit | No        | Number    | The desired max number of similar hotels of this hotel `hotelId`. Default value is `0`.                                 |
| reviewScale         | No        | Number    | The scale of review score of similar hotels. Default value is `100`.                                                    |

Example request:
```
POST metasearch/hotels/258074/searches?currencyCode=USD&locale=en
{
  "search": {
    "id": "750173c88a302f0d",
    "hotelId":"258074",
    "roomsCount":1,
    "guestsCount":2,
    "checkIn": "2019-03-01",
    "checkOut": "2019-03-10",
    "locale": "en",
    "siteCode": "SG",
    "currencyCode": "USD",
    "deviceType": "desktop",
    "appType": "WEB_APP",
    "userCountryCode": "SG"
  },
  "similarHotels": {
    "limit": 2
  },
  "reviewScale": 10
}
```

Example Response:
```
{
  [...],
  "similarHotels": [
    {
      "id": 1242078,
      "bestRate": {
        "id": "750173c88a302f0d:booking.com:1242078:9",
        "hotelId": 1242078,
        "providerHotelId": "3760784",
        "providerCode": "booking.com",
        "description": "Deluxe Room - Non-refundable",
        "price": {
          "amount": 370,
          "currencyCode": "USD",
          "amountUsd": 370.2389,
          "taxAmount": 56,
          "taxAmountUsd": 55.67667,
          "taxInclusive": true,
          "ecpc": 0.45,
          "localTaxAmount": 0,
          "totalAmount": 3330,
          "totalAmountUsd": 3332.15,
          "totalTaxAmount": 504,
          "totalTaxAmountUsd": 501.09003
        },
        "rateAmenityIds": [
          4
        ],
        "remainingRoomsCount": 9,
        "handoffUrl": "https://handoff.wegostaging.com/hotels/continue/1242078/6/9?search_id=750173c88a302f0d&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=lNZSK7d7u2XBVsfzRSk%2B06IvB%2Fr1XTm0%2BROnhCMG7BdR969RL9UTbvtlKBs2%2BcGe%2FobYVIJa56PFKmqc3oWKnSGFJiuNVqQVWB9OgUDKU0xM52f6cumD9%2BFhUl0a"
      },
      "similarityScore": 84.638695,
      "name": "The Capitol Kempinski Hotel ",
      "star": 5,
      "reviews": [
        {
          "count": 2,
          "score": 9.1,
          "percentage": 100,
          "reviewerGroup": "ALL"
        }
      ],
      "images": [
        {
          "url": "http://assets.wego.com/image/upload/v1537449535/Partner/hotels/1242078/pybjwof0rj6fgkp4um3m.jpg"
        }
      ]
    },
    {
      "id": 258111,
      "bestRate": {
        "id": "750173c88a302f0d:priceline.com:258111:194",
        "hotelId": 258111,
        "providerHotelId": "700462393",
        "providerCode": "priceline.com",
        "description": " Non - Refundable - Deluxe Double Room ",
        "price": {
          "amount": 484,
          "currencyCode": "USD",
          "amountUsd": 483.8111,
          "taxAmount": 35,
          "taxAmountUsd": 34.59111,
          "taxInclusive": true,
          "ecpc": 0.2,
          "localTaxAmount": 44.922222,
          "totalAmount": 4356,
          "totalAmountUsd": 4354.3,
          "totalTaxAmount": 315,
          "totalTaxAmountUsd": 311.32
        },
        "rateAmenityIds": [
          14
        ],
        "handoffUrl": "https://handoff.wegostaging.com/hotels/continue/258111/386/194?search_id=750173c88a302f0d&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=lNZSK7d7u2XBVsfzRSk%2B06IvB%2Fr1XTm0%2BROnhCMG7BdR969RL9UTbvtlKBs2%2BcGe%2FobYVIJa56PFKmqc3oWKnSGFJiuNVqQVWB9OgUDKU0xM52f6cumD9%2BFhUl0a"
      },
      "similarityScore": 83.95296,
      "name": "The Fullerton Bay Hotel Singapore",
      "star": 5,
      "reviews": [
        {
          "count": 2464,
          "score": 9.2,
          "percentage": 100,
          "reviewerGroup": "ALL"
        }
      ],
      "images": [
        {
          "url": "https://assets.wego.com/image/upload/v1524876810/Partner/hotels/258111/113939661.jpg"
        }
      ]
    }
  ],
  "similarHotelProviders": [
    {
      "code": "priceline.com",
      "name": "priceline.com",
      "type": "OTA",
      "id": 386,
      "isMobileFriendly": false,
      "isHotelWebsite": false
    },
    {
      "code": "booking.com",
      "name": "Booking.com",
      "type": "OTA",
      "id": 6,
      "isMobileFriendly": true,
      "isHotelWebsite": false
    }
  ],
}
```


### Get Hotel Details

```
GET hotels/hotels/:hotelId
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |
| reviewScale  | No        | Number    | Review Scale (default: 100)                                                                          |

#### Example

- `/hotels/hotels/10000?language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=8&keyTransform=underscore&reviewScale=100`

#### Response

```
{
  "id": 10000,
  "check_in": "1400",
  "check_out": "1100",
  "email": "cchotel@ihug.co.nz",
  "fax": "64-9-3070685",
  "floors_count": 7,
  "latitude": "-36.85025",
  "longitude": "174.76254",
  "native_currency": "NZD",
  "phone_1": "64-9-3073388",
  "phone_2": "64 9 3070685",
  "postal_code": "1010",
  "reservation_phone": "+6493073388",
  "rooms_count": 105,
  "star": 3,
  "website": "http://www.skoosh.com/auckland_hotels/city_central_hotel_auckland_new_zealand.html",
  "updated_at": "2017-02-16T04:48:14.000Z",
  "permalink": "econo-lodge-city-central",
  "name": "Econo Lodge City Central",
  "description": "Econo Lodge City Central is a popular choice amongst travelers in Auckland, whether exploring or just passing through. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Wi-Fi in public areas, elevator, business center, tours, restaurant are there for guest's enjoyment. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. Econo Lodge City Central combines warm hospitality with a lovely ambiance to make your stay in Auckland unforgettable.",
  "address": "37 Wellesley Street",
  "former_name": "Sheraton Krabi Beach Resort",
  "review_summary": "Good city hotel. Close to Sky City. Delicious food. Great view. Good access to airport. Popular among solo travelers.",
  "similar_hotels": [
    10305,
    9964,
    9997,
    10136,
    10048,
    1230285,
    10205,
    9958,
    10203,
    1577689
  ],
  "reviews": [
    {
      "score": 74,
      "count": 2176,
      "percentage": 100,
      "reviewer_group": "ALL",
      "snippets": [
        {
          "concept_code": "14",
          "type": "CATEGORY",
          "score": 95,
          "sentiment": "POSITIVE",
          "text": "Great location",
          "name": "Location"
        }
    }
  ],
  "images": [
    {
      "url": "https://res.cloudinary.com/wego/image/upload/v1485326423/Leo/hotels/10000/1285370.jpg",
      "description": "Exterior",
      "source" "booking.com"
    },
    {
      "url": "https://res.cloudinary.com/wego/image/upload/v1485326423/Leo/hotels/10000/1285391.jpg",
      "description": "Interior",
      "source" "booking.com"

    },
  ],
  "review_highlights": [
    {
      "sentiment": "POSITIVE",
      "text": "Terrific location. <strong>100%</strong> <pos>liked the proximity to shopping</pos>. Wonderful sightseeing"
    },
    {
      "sentiment": "POSITIVE",
      "text": "Great service. <pos>Housekeeping was great</pos>, according to <strong>88%</strong>. <pos>Management was excellent</pos>, said <strong>80%</strong>."
    },
    {
      "sentiment": "POSITIVE",
      "text": "Food is to die for. <pos>Yummy desserts</pos>, said <strong>100%</strong>."
    }
  ],
  "amenities": [
    {
      "id": 1,
      "name": "Highspeed Internet"
    },
    {
      "id": 4,
      "name": "Restaurant"
    },
    {
      "id": 6,
      "name": "Airconditioning"
    },
    {
      "id": 7,
      "name": "Non-smoking Rooms"
    },
    {
      "id": 12,
      "name": "Business Centre"
    },
    {
      "id": 20,
      "name": "Bar/Lounge"
    }
  ],
  "room_amenities": [
        {
            "id": 32,
            "name": "Internet access"
        },
        {
            "id": 34,
            "name": "Iron & ironing board"
        },
    ],
  "badges": [
    {
      "text": "Excellent City Hotel",
      "subtext": "Top 8% in city"
    }
  ],
  "themes": [
    {
      "id": 4,
      "name": "Luxury Hotel"
    }
  ],
  "property_type": {
    "id": 1,
    "name": "Hotel"
  },
  "city": {
    "id": 283,
    "code": "AKL",
    "name": "Auckland",
    "en_name": "Auckland",
    "permalink": "auckland",
    "country_code": "NZ",
    "country_name": "New Zealand",
    "country_permalink": "new-zealand"
  },
  "latestProviderReviews": [
    {
      "providerCode": "booking.com",
      "rating": 9.2,
      "title": "Nice hotel within walking distance...",
      "contents": [
        {
          "type": "pros",
          "comment": "The hotel is modern and clean. The staff were friendly and polite and the pool was nice."
        },
        {
          "type": "cons",
          "comment": "The breakfast was.okay, but not great."
        }
      ],
      "author": {
        "name": "Barry",
        "type": "solo traveller",
        "typeEn": "solo traveller",
        "country": {
          "code": "GB",
          "name": "United Kingdom",
          "nameEn": "United Kingdom"
        }
      },
      "postedAt": "20 Jun 2018",
      "reviewUrl": "http://www.booking.com/hotel/vn/phuong-nam-and-villa.en.html?aid=1464801\u0026label=hotel-71155_reviews\u0026lang=en\u0026tab=4"
    }
  ],
  "distanceToNearestAirport": 17.8982,
  "nearestAirport": {
    "code": "AKL",
    "name": "Auckland International Airport"
  }
}
```

#### Change log

30/08/2018: Add client_id on the request parameters and use it for A/B testing. A/B will be determined by getting the modulo by 2 of the first letter of the SHA1 of the `{client_id}+{experiment name}`. The base case(A) will return popular hotels while the experiment(B) will return the recommended hotels based on a Machine Learning model.

10/07/2018: Add latestProviderReviews - returns 5 of the latest provider reviews. Priority is booking.com. If not a mixed of reviews from other providers.

### Get hotels by citycode

```
GET hotels/hotels
```

| Property         | Required? | Data Type | Description                                                                                          |
| ---------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| city_code        | Yes       | String    | city Code of the user.                                                                               |
| district_id      | No        | Integer   | district id                                                                                          |
| star             | No        | Integer   | star of hotels                                                                                       |
| property_type_id | No        | Integer   | property_type_id of hotels                                                                           |
| language         | No        | String    | The language that the response will be in. En as default                                             |
| currency_code    | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| device_type      | Yes       | String    | The device type of the originating request                                                           |
| site_code        | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page             | Yes       | Number    |
| perPage          | Yes       | Number    |
| keyTransform     | Yes       | String    | underscore                                                                                           |
| rates_count      | No        | Number    | the number of rates that will be returned for each hotel (defaults to 0)                             |
| client_id        | No        | String    | The client id of the user. This will be used for recommending hotels for users                       |
| theme_id         | No        | String    | The theme id of be used as for filtering hotels.                                                     |

#### Example

- `/hotels/hotels?city_code=SIN&language=en&currency_code=SGD&device_type=mobile&site_code=SG&page=0&per_page=8&key_transform=underscore&rates_count=1`

#### Response

##### Header
| Key             | Value | Description                                                                      |
| --------------- | ----- | -------------------------------------------------------------------------------- |
| WEGO_ML_VERSION | v0    | The Machine Learning(ML) versions that was used in generating the list of hotels |

```
  [
    {
      "id": 258254,
      "permalink": "hotel-81-cosy-258254",
      "star": 2,
      "name": "Hotel 81 Cosy",
      "popular_rank": 1,  -- rank of this week
      "reviews": [
        {
          "score": 68,
          "count": 769,
          "percentage": 100,
          "reviewer_group": "ALL",
          "snippets": [
            {
              "concept_code": "11",
              "type": "CATEGORY",
              "score": 31,
              "sentiment": "NEGATIVE",
              "text": "Room needs to be improved",
              "name": "Room"
            },
            {
              "concept_code": "111",
              "type": "CATEGORY",
              "score": 29,
              "sentiment": "NEGATIVE",
              "text": "More comfort would be nice",
              "name": "Comfort"
            },
            {
              "concept_code": "111a",
              "type": "GOOD_TO_KNOW",
              "score": 29,
              "sentiment": "NEGATIVE",
              "text": "Could be quieter",
              "name": "Noise Level"
            },
            {
              "concept_code": "131",
              "type": "CATEGORY",
              "score": 23,
              "sentiment": "NEGATIVE",
              "text": "Breakfast can be improved",
              "name": "Breakfast"
            },
            {
              "concept_code": "14",
              "type": "CATEGORY",
              "score": 92,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            },
            {
              "concept_code": "14c",
              "type": "GOOD_TO_KNOW",
              "score": 95,
              "sentiment": "POSITIVE",
              "text": "Wonderful sightseeing",
              "name": "Sightseeing"
            },
            {
              "concept_code": "15",
              "type": "CATEGORY",
              "score": 86,
              "sentiment": "POSITIVE",
              "text": "Fantastic service",
              "name": "Service"
            },
            {
              "concept_code": "18",
              "type": "CATEGORY",
              "score": 44,
              "sentiment": "NEGATIVE",
              "text": "Complaints about WiFi",
              "name": "WiFi"
            },
            {
              "concept_code": "e51a",
              "type": "GOOD_TO_KNOW",
              "score": 3,
              "sentiment": "NEGATIVE",
              "text": "Rooms need regular maintenance",
              "name": "Room Maintenance"
            },
            {
              "concept_code": "f63a",
              "type": "CATEGORY",
              "score": 47,
              "sentiment": "NEGATIVE",
              "text": "Rooms could be cleaner",
              "name": "Cleanliness"
            },
            {
              "concept_code": "vmod",
              "type": "GOOD_TO_KNOW",
              "score": 41,
              "sentiment": "NEGATIVE",
              "text": "Hotel could use some updating",
              "name": "Modern Vibe"
            },
            {
              "concept_code": "wifq",
              "type": "GOOD_TO_KNOW",
              "score": 42,
              "sentiment": "NEGATIVE",
              "text": "Wifi quality could be improved",
              "name": "WiFi Quality"
            }
          ]
        },
        {
          "score": 68,
          "count": 476,
          "percentage": 62,
          "reviewer_group": "COUPLE",
          "snippets": [
            {
              "concept_code": "11",
              "type": "CATEGORY",
              "score": 31,
              "sentiment": "NEGATIVE",
              "text": "Room needs to be improved",
              "name": "Room"
            },
            {
              "concept_code": "111",
              "type": "CATEGORY",
              "score": 27,
              "sentiment": "NEGATIVE",
              "text": "More comfort would be nice",
              "name": "Comfort"
            },
            {
              "concept_code": "111",
              "type": "GOOD_TO_KNOW",
              "score": 29,
              "sentiment": "NEGATIVE",
              "text": "More comfort would be nice",
              "name": "Comfort"
            },
            {
              "concept_code": "11b",
              "type": "GOOD_TO_KNOW",
              "score": 43,
              "sentiment": "NEGATIVE",
              "text": "Beds need improvement",
              "name": "Beds"
            },
            {
              "concept_code": "14",
              "type": "CATEGORY",
              "score": 94,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            },
            {
              "concept_code": "14d",
              "type": "GOOD_TO_KNOW",
              "score": 100,
              "sentiment": "POSITIVE",
              "text": "Good restaurants & bars in the area",
              "name": "Restaurants & Bars"
            },
            {
              "concept_code": "15",
              "type": "CATEGORY",
              "score": 87,
              "sentiment": "POSITIVE",
              "text": "Fantastic service",
              "name": "Service"
            },
            {
              "concept_code": "171",
              "type": "CATEGORY",
              "score": 39,
              "sentiment": "NEGATIVE",
              "text": "Vibe is not too good",
              "name": "Vibe"
            },
            {
              "concept_code": "22a",
              "type": "CATEGORY",
              "score": 74,
              "sentiment": "POSITIVE",
              "text": "Best value for money",
              "name": "Value for money"
            },
            {
              "concept_code": "4b72",
              "type": "GOOD_TO_KNOW",
              "score": 15,
              "sentiment": "NEGATIVE",
              "text": "Rooms could be larger",
              "name": "Room Size"
            },
            {
              "concept_code": "f63a",
              "type": "CATEGORY",
              "score": 51,
              "sentiment": "NEUTRAL",
              "text": "Room cleanliness is acceptable",
              "name": "Cleanliness"
            },
            {
              "concept_code": "f63a",
              "type": "GOOD_TO_KNOW",
              "score": 47,
              "sentiment": "NEGATIVE",
              "text": "Rooms could be cleaner",
              "name": "Room Cleanliness"
            }
          ]
        },
        {
          "score": 67,
          "count": 23,
          "percentage": 3,
          "reviewer_group": "FAMILY",
          "snippets": [
            {
              "concept_code": "11",
              "type": "GOOD_TO_KNOW",
              "score": 31,
              "sentiment": "NEGATIVE",
              "text": "Room needs to be improved",
              "name": "Room"
            },
            {
              "concept_code": "14",
              "type": "CATEGORY",
              "score": 93,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            },
            {
              "concept_code": "14",
              "type": "GOOD_TO_KNOW",
              "score": 92,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            }
          ]
        },
        {
          "score": 66,
          "count": 269,
          "percentage": 35,
          "reviewer_group": "SOLO",
          "snippets": [
            {
              "concept_code": "11",
              "type": "CATEGORY",
              "score": 30,
              "sentiment": "NEGATIVE",
              "text": "Room needs to be improved",
              "name": "Room"
            },
            {
              "concept_code": "111",
              "type": "CATEGORY",
              "score": 30,
              "sentiment": "NEGATIVE",
              "text": "More comfort would be nice",
              "name": "Comfort"
            },
            {
              "concept_code": "14",
              "type": "CATEGORY",
              "score": 88,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            },
            {
              "concept_code": "14",
              "type": "GOOD_TO_KNOW",
              "score": 92,
              "sentiment": "POSITIVE",
              "text": "Great location",
              "name": "Location"
            },
            {
              "concept_code": "15",
              "type": "CATEGORY",
              "score": 86,
              "sentiment": "POSITIVE",
              "text": "Fantastic service",
              "name": "Service"
            },
            {
              "concept_code": "15",
              "type": "GOOD_TO_KNOW",
              "score": 86,
              "sentiment": "POSITIVE",
              "text": "Fantastic service",
              "name": "Service"
            },
            {
              "concept_code": "ddbc",
              "type": "GOOD_TO_KNOW",
              "score": 87,
              "sentiment": "POSITIVE",
              "text": "Friendly service",
              "name": "Service Friendliness"
            }
          ]
        }
      ],
      "images": [
        {
          "url": "https://res.cloudinary.com/wego/image/upload/v1487240125/Partner/hotels/258254/87510609.jpg",
          "source": "expedia.com"
        },
        {
          "url": "https://res.cloudinary.com/wego/image/upload/v1487240124/Partner/hotels/258254/71968808.jpg"
        }
      ],
      "district": {
        "city_code": "SIN",
        "en_name": "Chinatown",
        "en_permalink": "chinatown",
        "id": 724,
        "language": "en",
        "name": "Chinatown",
        "permalink": "chinatown",
        "city_id": 6667,
        "city_station_type": "city",
        "city_name": "Singapore",
        "city_permalink": "singapore",
        "country_id": 197,
        "country_code": "SG",
        "country_station_type": "country",
        "country_name": "Singapore",
        "country_permalink": "singapore",
        "world_region_id": 2,
        "world_region_code": "i",
        "world_region_name": "Asia",
        "world_region_permalink": "asia"
      },
      rates": [
        {
          "price": {
            "currency_code": "PHP",
            "amount": "3368.35",
            "amount_usd": 63.0585,
            "display": "₱3,368"
          },
          "provider": {
            "code": "laterooms.com"
          }
        }
      ]
    }
  ]
```

#### Change log

### Get popular brands by citycode

These brands are sorted dynamically by hotels count

```
GET hotels/brands/popular
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| cityCode     | Yes       | String    | city Code of the user.                                                                               |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |

#### Example

- `/hotels/brands/popular?cityCode=SGN&language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=2&keyTransform=underscore`

#### Response

```
{
    "code": "DZ",
    "url": "http://www.danhotels.com/",
    "permalink": "dan-hotels-corporation-ltd",
    "hotels_count": 78,
    "name": "Dan Hotels Corporation Ltd."
  },
  {
    "code": "TN",
    "url": "http://www.timehotels.ae/",
    "permalink": "time-hotels",
    "hotels_count": 268,
    "name": "Time Hotels"
  }
```

### Get featured brands by sitecode

These brands are manually managed via CMS.

```
GET hotels/brands/featured
```

| Property     | Required? | Data Type | Description                                                   |
| ------------ | --------- | --------- | ------------------------------------------------------------- |
| siteCode     | Yes       | String    | Country Code of the user. Must be in ISO country code format. |
| language     | No        | String    | The language that the response will be in. En as default      |
| locale       | No        | String    | The language that the response will be in. en as default      |
| page         | No        | Number    |
| perPage      | No        | Number    |
| keyTransform | No        | String    | camelCase as default, can change to underscore                |

#### Example

- `/hotels/brands/featured?siteCode=IN&locale=ar&perPage=2&page=0&keyTransform=underscore`

#### Response

```
[
    {
        "code": "000055",
        "url": "http://www.oberoihotels.com/",
        "permalink": "oberoi-hotels-resorts",
        "chain_id": 583,
        "hotels_count": 38,
        "image_url": "https://res.cloudinary.com/wego/image/upload/v1499394604/hotels/brands/000055.jpg",
        "name": "مجموعة فنادق أوبروي"
    },
    {
        "code": "PG",
        "url": "http://www.parkhotelgroup.com/",
        "permalink": "park-hotel-group",
        "hotels_count": 14,
        "image_url": "https://res.cloudinary.com/wego/image/upload/v1499394680/hotels/brands/PG.png",
        "name": "Park Hotel Group"
    }
]
```

### Get rates by hotel ids

```
GET hotels/rates
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| hotelIds[]   | Yes       | Array     | Array of hotels                                                                                      |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |

#### Example

- `/hotels/rates?hotelIds[]=10000&language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=8&keyTransform=underscore`

#### Response

```
 [
   {
    "hotel_id": 10000,
    "price": {
      "currency_code": "SGD",
      "amount": "96.34",
      "amount_usd": 68.45,
      "display": "S$96"
    },
    "provider": {
      "code": "booking.com"
    }
  },
  {
    "hotel_id": 10000,
    "price": {
      "currency_code": "SGD",
      "amount": "96.49",
      "amount_usd": 68.56,
      "display": "S$96"
    },
    "provider": {
      "code": "expedia.co.nz"
    }


  "badges": [
    {
      "text": "Excellent Shopping",
      "subtext": "Top 1% in city"
    },
    {
      "text": "Excellent Business Hotel",
      "subtext": "Top 1% in city"
    },
    {
      "text": "Excellent Overall Ranking",
      "subtext": "Top 6% in city"
    }
  ],
  "propertyType": {
    "id": 1,
    "name": "Hotel"
  }
 ]
```

### Get historical hotel rates

```
GET hotels/:hotel_id/rates
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |

#### Example

- `/hotels/hotels/10000/rates?language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=8&keyTransform=underscore`

#### Response

```
[
   {
    "hotel_id": 10000,
    "price": {
      "currency_code": "SGD",
      "amount": "189.18",
      "amount_usd": 134.42,
      "display": "S$189"
    },
    "provider": {
      "code": "booking.com"
    }
  },
  {
    "hotel_id": 10000,
    "price": {
      "currency_code": "SGD",
      "amount": "189.67",
      "amount_usd": 134.77,
      "display": "S$190"
    },
    "provider": {
      "code": "expedia.co.nz"
    }
  }
]
```

### Get hotel images

```
GET hotels/hotels/:hotel_id/images
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |

#### Example

- `/hotels/hotels/207/images?language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=8&keyTransform=underscore`

#### Response

```
 [
   {
    "url": "https://res.cloudinary.com/wego/image/upload/v1397116095/hotels/207/3751163.jpg",
    "description": "Surroundings",
    "source" "booking.com"
  },
  {
    "url": "https://res.cloudinary.com/wego/image/upload/v1397116095/hotels/207/3751190.jpg",
    "description": "Bathroom",
    "source" "hotels.com"
  },
  {
    "url": "https://res.cloudinary.com/wego/image/upload/v1397116095/hotels/207/3751196.jpg",
    "description": "Hotel Interior"
  },
  {
    "url": "https://res.cloudinary.com/wego/image/upload/v1397116095/hotels/207/3751187.jpg",
    "description": "Pub/Lounge"
  },
  {
    "url": "https://res.cloudinary.com/wego/image/upload/v1397116095/hotels/207/3751193.jpg",
    "description": "Garden"
  }
 ]
```

### Get hotel reviews

```
GET hotels/hotels/:hotel_id/reviews
```

| Property     | Required? | Data Type | Description                                              |
| ------------ | --------- | --------- | -------------------------------------------------------- |
| language     | No        | String    | The language that the response will be in. En as default |
| perProvider  | No        | Number    | Max # of reviews for each provider_code, default is 30   |
| keyTransform | Yes       | String    | underscore                                               |

> booking.com only returns max of 5 reviews. The result is sorted by provider_code ASC, posted_at DESC

> the `comment` inside `content` can have html tags for formatting. Render/handle properly in the client.

#### Example

- `/hotels/hotels/207/reviews?language=en&perProvider=50&keyTransform=underscore`

```
[
    {
        "providerCode": "booking.com",
        "rating": 10,
        "title": "Excellent Hotel. Will definitely go...",
        "contents": [
            {
                "type": "pros",
                "comment": "Shower"
            },
            {
                "type": "cons",
                "comment": "None"
            }
        ],
        "author": {
            "name": "Joseph",
            "type": "family with young children",
            "typeEn": "family with young children",
            "country": {
                "code": "NZ",
                "name": "New Zealand",
                "nameEn": "New Zealand"
            }
        },
        "postedAt": "2018-01-12T04:09:02.000Z"
    }
]
```

- `/hotels/hotels/207/reviews?language=ar`

```
[
    {
        "providerCode": "booking.com",
        "rating": 7.9,
        "title": "جيده جدآ",
        "contents": [
            {
                "type": "pros",
                "comment": "غرفه واسعه مفروشه ومريحه"
            },
            {
                "type": "cons",
                "comment": "لا شئ"
            }
        ],
        "author": {
            "name": "Muftah",
            "type": "منفردا مسافر",
            "typeEn": "solo traveller",
            "country": {
                "code": "DE",
                "name": "ألمانيا",
                "nameEn": "Germany"
            }
        },
        "postedAt": "2016-03-20T19:44:20.000Z"
    }
]
```

### Get hotel description

```
GET hotels/:hotel_id/description
```

| Property | Required? | Data Type | Description
| locale | Yes | The language that the response will be in. en as default

#### Response

```
{
  "content": " Wego Hotel is located in 100 Beach Road, Singapore, Singapore. \n
     Some of the attractions and points of interest near the hotel are,\n
     - Shaw Tower\n
     - National Museum of Singapore\n
     - Artscience Museum\n
     If you’re feeling hungry and looking for places to eat, you can try these food places,\n
     - Jai Thai\n
     - Qiji\n
     - Supreme Pork Chop Rice\n
     Looking for some entertainment venues? Check out the following places,\n
     - Golden Village Cineplex\n
     - Esplanade Concourse\n
     - Cap Singapore\n
     Should you feel like shopping, these retail stores and malls are nearest to the hotel,\n
     - Suntec City Mall\n
     - Bugis Junction\n
     - Raffles City Shopping Center\n",
  "attraction_spot_ids": [ 1, 2 , 3],
  "food_spot_ids": [ 10, 11, 12 ],
  "entertainment_spot_ids": [ 5, 6, 7],
  "shop_spot_ids": [ 22, 23, 25],
  "header_template": "{hotel_name} is located in {hotel_address}, {city_name}, {state_code}, {country_name}",
  "attraction_template": "Some of the attractions and points of interest near the hotel are, \n {attraction_spots}",
  "food_template": "If you’re feeling hungry and looking for places to eat, you can try these food places, \n {food_spots}",
  "entertainment_template": "Looking for some entertainment venues? Check out the following places, \n {entertainment_spots}",
  "shop_template": "Should you feel like shopping, these retail stores and malls are nearest to the hotel, \n {shop_spots}"
}
```

### Update hotel description

```
PUT hotels/:hotel_id/description/
```

#### Request

```
  {
    "attraction_spot_ids": [ 1, 2 , 3],
    "food_spot_ids": [ 10, 11, 12 ],
    "entertainment_spot_ids": [ 5, 6, 7],
    "shop_spot_ids": [33, 34, 45],
    "header_template": "{hotel_name} is located in {hotel_address}, {city_name}, {state_code}, {country_name}",
    "attraction_template": "Some of the attractions and points of interest near the hotel are, \n {attraction_spot_ids}",
    "food_template": "If you’re feeling hungry and looking for places to eat, you can try these food places, \n {food_spots}",
    "entertainment_template": "Looking for some entertainment venues? Check out the following places, \n {entertainment_spots}",
    "shop_template": "Should you feel like shopping, these retail stores and malls are nearest to the hotel, \n {shop_spots}"
  }
```

#### Response

```
{
  "content": " Wego Hotel is located in 100 Beach Road, Singapore, Singapore. \n
     Some of the attractions and points of interest near the hotel are,\n
     - Shaw Tower\n
     - National Museum of Singapore\n
     - Artscience Museum\n
     If you’re feeling hungry and looking for places to eat, you can try these food places,\n
     - Jai Thai\n
     - Qiji\n
     - Supreme Pork Chop Rice\n
     Looking for some entertainment venues? Check out the following places,\n
     - Golden Village Cineplex\n
     - Esplanade Concourse\n
     - Cap Singapore\n
     Should you feel like shopping, these retail stores and malls are nearest to the hotel,\n
     - Suntec City Mall\n
     - Bugis Junction\n
     - Raffles City Shopping Center\n",
    "attraction_spots": [ 1, 2 , 3],
    "food_spots": [ 10, 11, 12 ],
    "entertainment_spots": [ 5, 6, 7],
    "shop_template": [ 22, 23, 25],
    "header_template": "{hotel_name} is located in {hotel_address}, {city_name}, {state_code}, {country_name}",
    "attraction_template": "Some of the attractions and points of interest near the hotel are, \n {attraction_spots}",
    "food_template": "If you’re feeling hungry and looking for places to eat, you can try these food places, \n {food_spots}",
    "entertainment_template": "Looking for some entertainment venues? Check out the following places, \n {entertainment_spots}",
    "shop_template": "Should you feel like shopping, these retail stores and malls are nearest to the hotel, \n {shop_spots}"
}
```

### Preview hotel description

- generate hotel description based on the request. This doesn't update the hotel's description.

```
POST hotels/:hotel_id/description/preview
```

#### Request

```
  {
    "attraction_spot_ids": [ 1, 2 , 3],
    "food_spot_ids": [ 10, 11, 12 ],
    "entertainment_spot_ids": [ 5, 6, 7],
    "shop_spot_ids": [33, 34, 45],
    "header_template": "{hotel_name} is located in {hotel_address}, {city_name}, {state_code}, {country_name}",
    "attraction_template": "Some of the attractions and points of interest near the hotel are, \n {attraction_spots}",
    "food_template": "If you’re feeling hungry and looking for places to eat, you can try these food places, \n {food_spots}",
    "entertainment_template": "Looking for some entertainment venues? Check out the following places, \n {entertainment_spots}",
    "shop_template": "Should you feel like shopping, these retail stores and malls are nearest to the hotel, \n {shop_spots}"
  }
```

#### Response

```
{
  "content": " Wego Hotel is located in 100 Beach Road, Singapore, Singapore. \n
     Some of the attractions and points of interest near the hotel are,\n
     - Shaw Tower\n
     - National Museum of Singapore\n
     - Artscience Museum\n
     If you’re feeling hungry and looking for places to eat, you can try these food places,\n
     - Jai Thai\n
     - Qiji\n
     - Supreme Pork Chop Rice\n
     Looking for some entertainment venues? Check out the following places,\n
     - Golden Village Cineplex\n
     - Esplanade Concourse\n
     - Cap Singapore\n
     Should you feel like shopping, these retail stores and malls are nearest to the hotel,\n
     - Suntec City Mall\n
     - Bugis Junction\n
     - Raffles City Shopping Center\n"
}
```

### Get hotels by ids

```
GET hotels/hotels
```

| Property     | Required? | Data Type | Description                                                                                          |
| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| ids          | Yes       | Array     |
| language     | No        | String    | The language that the response will be in. En as default                                             |
| currencyCode | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| deviceType   | Yes       | String    | The device type of the originating request                                                           |
| siteCode     | No        | String    | Country Code of the user. Must be in ISO country code format.                                        |
| page         | Yes       | Number    |
| perPage      | Yes       | Number    |
| keyTransform | Yes       | String    | underscore                                                                                           |

#### Example

- `/hotels/hotels?ids[]=716690&ids[]=257965&language=en&currencyCode=SGD&deviceType=mobile&siteCode=SG&page=0&perPage=8&keyTransform=underscore`

#### Response

```
[
  {
    "id": 716690,
    "permalink": "resorts-world-sentosa-equarius-hotel",
    "star": 5,
    "name": "Resorts World Sentosa - Equarius Hotel",
    "reviews": [
      {
        "score": 87,
        "count": 3547,
        "percentage": 100,
        "reviewer_group": "ALL",
        "snippets": [
          {
            "concept_code": "15",
            "type": "CATEGORY",
            "score": 76,
            "sentiment": "POSITIVE",
            "text": "Fantastic service",
            "name": "Service"
          },
          {
            "concept_code": "11a",
            "type": "GOOD_TO_KNOW",
            "score": 80,
            "sentiment": "POSITIVE",
            "text": "Impressive bathroom"
          },
          {
            "concept_code": "16f",
            "type": "HOTEL_TYPE",
            "score": 96,
            "sentiment": "POSITIVE",
            "text": "Good choice for a city trip"
          },
        ]
      },
      {
        "score": 90,
        "count": 35,
        "percentage": 1,
        "reviewer_group": "BUSINESS",
        "snippets": [

          {
            "concept_code": "4b72",
            "type": "GOOD_TO_KNOW",
            "score": 96,
            "sentiment": "POSITIVE",
            "text": "Spacious rooms"
          },
          {
            "concept_code": "22a",
            "type": "CATEGORY",
            "score": 58,
            "sentiment": "NEUTRAL",
            "text": "Fairly good value for money",
            "name": "Value for money"
          },
        ]
      },
        ]
      }
    ],
    "images": [
      {
        "url": "https://res.cloudinary.com/wego/image/upload/v1487240157/Partner/hotels/716690/54804245.jpg"
      },
      {
        "url": "https://res.cloudinary.com/wego/image/upload/v1487240157/Partner/hotels/716690/41335808.jpg"
      }
    ],
    "district": {
      "id": 718,
      "name": "Sentosa Island",
      "permalink": "sentosa-island"
    }
  },
]
```

### Get metasearch hotel

```
GET metasearch/hotels/:hotel_id
```

#### Example

- `metasearch/hotels/-24263832`

#### Response

```
{
    "id": -24263832,
    "name": "Cheap private room at resort like condominium.",
    "star": 0,
    "images": [
        {
            "url": "https://a0.muscache.com/im/pictures/c5027ffb-00f6-418d-a2ee-2c23e7b4ad4b.jpg?aki_policy=large"
        },
        {
            "url": "https://a0.muscache.com/im/pictures/6138f07b-c2fb-4803-8a36-9a9b416ad424.jpg?aki_policy=large"
        },
        {
            "url": "https://a0.muscache.com/im/pictures/06906593-0228-4fcf-92bd-782924fc6255.jpg?aki_policy=large"
        }
    ],
    "badges": [],
    "propertyTypeId": 39,
    "brandId": 0,
    "chainId": 0,
    "cityCode": "SIN",
    "districtId": 0,
    "imagesCount": 9,
    "amenityIds": [],
    "themeIds": [],
    "reviews": [],
    "longitude": 103.78559,
    "latitude": 1.4288094,
    "nameI18n": {},
    "roomTypeCategoryId": 1,
    "reviewsScore": 0,
    "capacity": 2,
    "bedroomsCount": 1,
    "bedsCount": 1,
    "bathroomsCount": 1
}
```

## Create new hotel partner search

Create new hotel search for a specific provider code. New searchId in this response will be used in next polling requests to get list of partner's request/responses.

Request params and request body are exactly same as in [Create new Hotels Search](#create-new-hotels-search), except that we will include `provider_code` in the Url path.

```
POST metasearch/hotels/partners/:provider_code/searches
```

Response:

| Property | Data Type | Description                               |
| -------- | --------- | ----------------------------------------- |
| search   | Hash      | Full search object that includes searchId |
| provider | Hash      | Provider details                          |

### Example:

Request:

```
POST metasearch/hotels/partners/booking.com/searches?currencyCode=AED&locale=ar

{
    "search": {
        "siteCode": "AE",
        "locale": "ar",
        "currencyCode": "AED",
        "cityCode": "DXB",
        "rooms": [
            {
                "childrenAges": [12, 2, 0, 1, 5],
                "childrenCount": 5,
                "adultsCount": 2
            },
            {
                "childrenAges": [1, 5],
                "childrenCount": 2,
                "adultsCount": 1
            }
        ],
        "checkIn": "2018-06-02",
        "checkOut": "2018-06-08",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false
    },
    "offset": 0,
    "reviewScale": 10
}
```

Response:

```
{
    "search": {
        "id": "530cc1b1bf033184",
        "searchType": "CITY",
        "city": {
            "code": "DXB",
            "name": "دبي"
        },
        "worldRegion": {
            "code": "m",
            "name": "الشرق الأوسط"
        },
        "country": {
            "code": "AE",
            "name": "الإمارات العربية المتحدة"
        },
        "roomsCount": 2,
        "guestsCount": 10,
        "rooms": [
            {
                "adultsCount": 2,
                "childrenCount": 5,
                "childrenAges": [
                    12,
                    2,
                    0,
                    1,
                    5
                ]
            },
            {
                "adultsCount": 1,
                "childrenCount": 2,
                "childrenAges": [
                    1,
                    5
                ]
            }
        ],
        "checkIn": "2018-06-02",
        "checkOut": "2018-06-08",
        "createdAt": "2018-05-21T09:28:03.548Z",
        "locale": "ar",
        "siteCode": "AE",
        "currencyCode": "AED",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userCountryCode": "US",
        "key": "DXB~CITY~2018-06-02~2018-06-08~2~10~AE~ar~DESKTOP~WEB_APP",
        "cityCode": "DXB",
        "cityName": "Dubai",
        "countryCode": "AE",
        "countryName": "United Arab Emirates"
    },
    "provider": {
        "code": "booking.com",
        "name": "Booking.com",
        "type": "OTA",
        "id": 6,
        "isMobileFriendly": true,
        "isHotelWebsite": false
    }
}
```

## Fetch hotel partner requests results

Fetch hotel partner requests results with the searchId that is created from [Create new hotel partner search](#create-new-hotel-partner-search)

Request url/params/body are same as [Create new hotel partner search](#create-new-hotel-partner-search), except that we will include the searchId from previous request into new search request body.

As a polling request we have to call this endpoint a few times and wait a few moment in order to fetch full response. Polling time depends on provider's response time, some provider might be slow and returns response after around 60s.

Some providers might send a lot of requests. Due to big response size, each time the api only returns maximum 3 partner request/response pairs. Set `offset` value in next polling request as the value of `requestsCount` from previous response to get new set of partner request/response pairs.

Incase of error, `errorMessages` or readable error messages will be returned in response.

```
POST metasearch/hotels/partners/:provider_code/searches
```

Response:

| Property         | Data Type | Description                               |
| ---------------- | --------- | ----------------------------------------- |
| search           | Hash      | Full search object that includes searchId |
| provider         | Hash      | Provider details                          |
| partnerExchanges | List      | List of partner's request/response pairs  |

### Example:

Request:

```
POST metasearch/hotels/partners/booking.com/searches?currencyCode=AED&locale=ar

{
    "search": {
        "id": "530cc1b1bf033184",
        "siteCode": "AE",
        "locale": "ar",
        "currencyCode": "AED",
        "cityCode": "DXB",
        "rooms": [
            {
                "childrenAges": [12, 2, 0, 1, 5],
                "childrenCount": 5,
                "adultsCount": 2
            },
            {
                "childrenAges": [1, 5],
                "childrenCount": 2,
                "adultsCount": 1
            }
        ],
        "checkIn": "2018-06-02",
        "checkOut": "2018-06-08",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false
    },
    "offset": 5,
    "reviewScale": 10
}
```

Response:

```
{
    "search": {
        "id": "530cc1b1bf033184",
        "searchType": "CITY",
        "city": {
            "code": "DXB",
            "name": "دبي"
        },
        "worldRegion": {
            "code": "m",
            "name": "الشرق الأوسط"
        },
        "country": {
            "code": "AE",
            "name": "الإمارات العربية المتحدة"
        },
        "roomsCount": 2,
        "guestsCount": 10,
        "rooms": [
            {
                "adultsCount": 2,
                "childrenCount": 5,
                "childrenAges": [
                    12,
                    2,
                    0,
                    1,
                    5
                ]
            },
            {
                "adultsCount": 1,
                "childrenCount": 2,
                "childrenAges": [
                    1,
                    5
                ]
            }
        ],
        "checkIn": "2018-06-02",
        "checkOut": "2018-06-08",
        "createdAt": "2018-05-21T09:28:03.548Z",
        "locale": "ar",
        "siteCode": "AE",
        "currencyCode": "AED",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userCountryCode": "US",
        "key": "DXB~CITY~2018-06-02~2018-06-08~2~10~AE~ar~DESKTOP~WEB_APP",
        "cityCode": "DXB",
        "cityName": "Dubai",
        "countryCode": "AE",
        "countryName": "United Arab Emirates"
    },
    "provider": {
        "code": "booking.com",
        "name": "Booking.com",
        "type": "OTA",
        "id": 6,
        "isMobileFriendly": true,
        "isHotelWebsite": false
    },
    "totalRequestsCount": 38,
    "requestsCount": 10,
    "partnerExchanges": [
        {
            "request": {
                "url": "https://distribution-xml.booking.com/2.0/json/hotelAvailability?checkin=2018-06-02&checkout=2018-06-08&hotel_ids=2002054%2C280058%2C2575756%2C1788919%2C403780%2C1990294%2C1603406%2C261770%2C458436%2C1603405%2C1970265%2C72542%2C48016%2C73872%2C1759180%2C2469350%2C2218708%2C2044701%2C189554%2C1086512%2C2329167%2C1270001%2C3165348%2C1373294%2C1373293%2C69371%2C1373292%2C2857954%2C1373291%2C175368%2C1373290%2C49341%2C69375%2C2533961%2C1005580%2C2533960%2C1990296%2C2199596%2C2939862%2C68058%2C2038470%2C1802839%2C1788920%2C1788924%2C2192954%2C1788923%2C362375%2C2798704%2C1911076%2C2022918%2C69380%2C1996840%2C2476097%2C2729754%2C73894%2C1786759%2C1302939%2C1742726%2C2447568%2C2031851%2C2120021%2C807013%2C2082160%2C67301%2C67304%2C67305%2C592386%2C67308%2C1988600%2C2062686%2C67306%2C2567888%2C822340%2C2087988%2C249226%2C337086%2C2643284%2C2705616%2C822341%2C3070946%2C1880041%2C67310%2C249228%2C1388494%2C2119654%2C448810%2C357935%2C2119652%2C2064858%2C2648984%2C2907472%2C1537325%2C263509%2C2334492%2C1985116%2C2522962%2C2522963%2C2522964%2C2282716%2C2522966&extras=room_details%2Chotel_amenities&room1=A%2CA%2C12%2C2%2C0%2C1%2C5&room2=A%2C1%2C5&language=ar&currency=AED",
                "method": "GET",
                "headers": {},
                "cookies": [],
                "contentLength": 0
            },
            "response": {
                "statusCode": 200,
                "statusText": "OK",
                "size": 37110,
                "headers": {},
                "cookies": [],
                "body": "{\"result\":[{\"hotel_id\":280058,\"hotel_amenities\":[\"paid_parking\",\"restaurant\",\"meeting_facilities\",\"bar\",\"24_hour_front_desk\",\"sauna\"]}]}"
            }
        },
        ....
    ]
}
```


## Get hotel deeplink

Get hotel deeplink

```
GET metasearch/hotels/deeplink/:rate_id
```

Parameter:

| Property | Required? | Data Type | Description |
| -------- | --------- | --------- | ----------- |
| rate_id  | Yes       | String    | Rate Id     |

Response:

| Property | Data Type | Description                                                                 |
| -------- | --------- | --------------------------------------------------------------------------- |
| search   | Hash      | Search details object                                                       |
| rate     | Hash      | Rate details object includes deeplinkUrl and other params to build deeplink |

### Example

https://srv.wegostaging.com/metasearch/hotels/deeplink/6d7f58eb796e8398:expedia.com.sg:258051:1257

```
{
    "search": {
        "id": "6d7f58eb796e8398",
        "searchType": "CITY",
        "city": {
            "code": "SIN",
            "name": "Singapore"
        },
        "worldRegion": {
            "code": "i",
            "name": "Asia"
        },
        "country": {
            "code": "SG",
            "name": "Singapore"
        },
        "roomsCount": 1,
        "guestsCount": 2,
        "rooms": [
            {
                "adultsCount": 2,
                "childrenCount": 0,
                "childrenAges": []
            }
        ],
        "checkIn": "2018-12-11",
        "checkOut": "2018-12-24",
        "createdAt": "2018-11-21T02:47:32.540Z",
        "locale": "en",
        "siteCode": "SG",
        "currencyCode": "SGD",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userCountryCode": "US",
        "key": "SIN~CITY~2018-12-11~2018-12-24~1~2~SG~en~DESKTOP~WEB_APP",
        "cityCode": "SIN",
        "cityName": "Singapore",
        "countryCode": "SG",
        "countryName": "Singapore",
        "userEmail": "tam400@wego.com"
    },
    "rate": {
        "id": "6d7f58eb796e8398:expedia.com.sg:258051:1257",
        "hotelId": 258051,
        "providerHotelId": "520959",
        "description": "Superior Double Or Twin Room (free Wifi) - Book Early And Save 4% (on Select Nights) - Non Refundable",
        "price": {
            "amount": 138,
            "currencyCode": "SGD",
            "amountUsd": 100.09876,
            "taxAmount": 21,
            "taxAmountUsd": 15.053071,
            "taxInclusive": true,
            "ecpc": 0.29,
            "localTaxAmount": 0,
            "totalAmount": 1794,
            "totalAmountUsd": 1301.2839,
            "totalTaxAmount": 273,
            "totalTaxAmountUsd": 195.68993
        },
        "rateAmenityIds": [],
        "provider": {
            "code": "expedia.com.sg",
            "name": "Expedia.com.sg",
            "type": "OTA",
            "id": 178,
            "isMobileFriendly": true,
            "isHotelWebsite": false
        },
        "remainingRoomsCount": 1,
        "handoffUrl": "https://handoff.wegostaging.com/hotels/continue/258051/178/1257?search_id=6d7f58eb796e8398&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP",
        "deeplinkUrl": "https://www.expedia.com/go/hotel/search/pinned/520959/2018-12-11/2018-12-24?tpid=1&NumAdult1=2&chid=1fb346d3-f882-43b6-98d3-15e61f462850&eapid=74287&NumRoom=1&mctc=8&rateplanid=205609521_24&currency=SGD&langid=2057&NumNights=13",
        "occupancy": 0,
        "params": {
            "bucket": "0",
            "agreement_term_id": "7098",
            "term_type": "CPA"
        },
        "siteConfig": {
            "siteCode": "SG",
            "locale": "en",
            "host": "www.wego.com.sg"
        },
        "isMobile": false
    }
}
```


## Search for rental properties only

The API of Search for rental properties only is nothing new but the existing APIs of [new Hotels Search](#create-new-hotels-search) and [Create new Hotel Search](#create-new-hotel-search) with a new request param `rentalOnly`.
Subsequent polling requests follow the same exisiting polling mechanism with `searchId`.


Parameter:

| Property   | Required? | Data Type | Description                                                                                                                                                       |
| ---------- | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| rentalOnly | No        | Boolean   | `rentalOnly=true` to get rates of rental properties only in [new Hotels Search](#create-new-hotels-search) or [Create new Hotel Search](#create-new-hotel-search) |

### Example

##### Creating new Hotels search for rental only

Request
```
POST https://srv.wego.com/v3/metasearch/hotels/searches?locale=en&currencyCode=SGD
{
    "search": {
      "cityCode": "SIN",
      "roomsCount":1,
      "guestsCount":2,
      "checkIn": "2019-04-26",
      "checkOut": "2019-04-28",
      "locale": "en",
      "siteCode": "SG",
      "currencyCode": "SGD",
      "deviceType": "desktop",
      "appType": "WEB_APP",
      "userCountryCode": "SG",
      "rentalOnly": true
    }
}
```
Response
```
{
    "search": {
        "id": "eb1b28c2f054cdf9",
        "searchType": "CITY",
        "city": {
            "code": "SIN",
            "name": "Singapore"
        },
        "worldRegion": {
            "code": "i",
            "name": "Asia"
        },
        "country": {
            "code": "SG",
            "name": "Singapore"
        },
        "roomsCount": 1,
        "guestsCount": 2,
        "checkIn": "2019-04-26",
        "checkOut": "2019-04-28",
        "createdAt": "2019-04-04T02:53:35.899Z",
        "locale": "en",
        "siteCode": "SG",
        "currencyCode": "SGD",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userCountryCode": "SG",
        "key": "SIN~CITY~2019-04-26~2019-04-28~1~2~SG~en~DESKTOP~WEB_APP",
        "cityCode": "SIN",
        "cityName": "Singapore",
        "countryCode": "SG",
        "countryName": "Singapore",
        "rooms": [
            {
                "adultsCount": 2,
                "childrenCount": 0,
                "childrenAges": [],
                "guestsCount": 2
            }
        ]
    },
    "hotels": [],
    "propertyTypes": [],
    "brands": [],
    "chains": [],
    "cities": [
        {
            "code": "SIN",
            "name": "Singapore"
        }
    ],
    "districts": [],
    "amenities": [],
    "roomAmenities": [],
    "themes": [],
    "roomTypeCategories": [],
    "destinationInfo": {
        "hotelCount": 0
    }
}
```

##### Polling rental only in Hotels search
`[...]` and `{...}` are used to omit long fields which can be referenced in normal [Fetch hotels search results](#fetch-hotels-search-results) and [Get Hotel Rates](#get-hotel-rates).

Request
```
POST https://srv.wego.com/v3/metasearch/hotels/searches?locale=en&currencyCode=SGD
{
    "search": {
      "id": "eb1b28c2f054cdf9",
      "cityCode": "SIN",
      "roomsCount":1,
      "guestsCount":2,
      "checkIn": "2019-04-26",
      "checkOut": "2019-04-28",
      "locale": "en",
      "siteCode": "SG",
      "currencyCode": "SGD",
      "deviceType": "desktop",
      "appType": "WEB_APP",
      "userCountryCode": "SG",
      "rentalOnly": true
    }
}
```
Response
```
{
    "search": {
        "id": "eb1b28c2f054cdf9",
        "searchType": "CITY",
        "city": {
            "code": "SIN",
            "name": "Singapore"
        },
        "worldRegion": {
            "code": "i",
            "name": "Asia"
        },
        "country": {
            "code": "SG",
            "name": "Singapore"
        },
        "roomsCount": 1,
        "guestsCount": 2,
        "checkIn": "2019-04-26",
        "checkOut": "2019-04-28",
        "createdAt": "2019-04-04T02:53:35.899Z",
        "locale": "en",
        "siteCode": "SG",
        "currencyCode": "SGD",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userCountryCode": "SG",
        "key": "SIN~CITY~2019-04-26~2019-04-28~1~2~SG~en~DESKTOP~WEB_APP",
        "cityCode": "SIN",
        "cityName": "Singapore",
        "countryCode": "SG",
        "countryName": "Singapore",
        "rooms": [
            {
                "adultsCount": 2,
                "childrenCount": 0,
                "childrenAges": [],
                "guestsCount": 2
            }
        ]
    },
    "rates": [
        {
            "id": "eb1b28c2f054cdf9:airbnb.com:-43287317:45",
            "hotelId": -43287317,
            "providerHotelId": "24923536",
            "providerCode": "airbnb.com",
            "price": {
                "amount": 289,
                "currencyCode": "SGD",
                "amountUsd": 213.23003,
                "taxAmount": 0,
                "taxAmountUsd": 0,
                "taxInclusive": true,
                "ecpc": 0.17,
                "localTaxAmount": 0,
                "totalAmount": 578,
                "totalAmountUsd": 426.46005,
                "totalTaxAmount": 0,
                "totalTaxAmountUsd": 0
            },
            "rateAmenityIds": [],
            "handoffUrl": "https://handoff.wego.com/hotels/continue/-43287317/613/45?search_id=eb1b28c2f054cdf9&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=%2Fm0jf45okOp3R8Xr3EHDUGzEPTKOkqNHP9AYZEppLXq1Sr%2FnLvOfiAghsuPl7SJ0MPhonJk9vmSEyps0QahThWgLYZAoJt%2FTWX%2B24l%2F3AOn%2FaF5ujyKd76T6Jwty7LpaQZOemFzwm1h1G9XevcE%2FGQSzoeVkKPCMRBR%2FV0cHff0j8K%2BKvxSab55U9d2wAA%3D%3D"
        },
        {
            "id": "eb1b28c2f054cdf9:airbnb.com:-43287318:44",
            "hotelId": -43287318,
            "providerHotelId": "33067109",
            "providerCode": "airbnb.com",
            "price": {
                "amount": 167,
                "currencyCode": "SGD",
                "amountUsd": 123.42951,
                "taxAmount": 0,
                "taxAmountUsd": 0,
                "taxInclusive": true,
                "ecpc": 0.17,
                "localTaxAmount": 0,
                "totalAmount": 334,
                "totalAmountUsd": 246.85902,
                "totalTaxAmount": 0,
                "totalTaxAmountUsd": 0
            },
            "rateAmenityIds": [],
            "handoffUrl": "https://handoff.wego.com/hotels/continue/-43287318/613/44?search_id=eb1b28c2f054cdf9&site=www.wego.com.sg&locale=en&version=2&device_type=DESKTOP&app_type=WEB_APP&awsalb=%2Fm0jf45okOp3R8Xr3EHDUGzEPTKOkqNHP9AYZEppLXq1Sr%2FnLvOfiAghsuPl7SJ0MPhonJk9vmSEyps0QahThWgLYZAoJt%2FTWX%2B24l%2F3AOn%2FaF5ujyKd76T6Jwty7LpaQZOemFzwm1h1G9XevcE%2FGQSzoeVkKPCMRBR%2FV0cHff0j8K%2BKvxSab55U9d2wAA%3D%3D"
        },
        ...
    ],
    "filter": {...},
    "rentalFilter": {
        "minPrice": {
            "amount": 119,
            "currencyCode": "SGD",
            "amountUsd": 87.95277,
            "taxAmount": 0,
            "taxAmountUsd": 0,
            "taxInclusive": true,
            "ecpc": 0.17,
            "localTaxAmount": 0,
            "totalAmount": 238,
            "totalAmountUsd": 175.90553,
            "totalTaxAmount": 0,
            "totalTaxAmountUsd": 0
        },
        "maxPrice": {
            "amount": 454,
            "currencyCode": "SGD",
            "amountUsd": 335.55087,
            "taxAmount": 0,
            "taxAmountUsd": 0,
            "taxInclusive": true,
            "ecpc": 0.17,
            "localTaxAmount": 0,
            "totalAmount": 908,
            "totalAmountUsd": 671.10175,
            "totalTaxAmount": 0,
            "totalTaxAmountUsd": 0
        },
        "roomTypeCategories": [
            {
                "code": "3"
            }
        ],
        "districts": [...],
        "bookingTypes": [],
        "roomAmenities": [...],
        "maxBedroomsCount": 2,
        "maxBedsCount": 5,
        "maxBathroomsCount": 2
    },
    "providerRatesCounts": [...],
    "scores": {...},
    "propertyTypes": [
        {
            "id": 39,
            "name": "Homes & Villas"
        }
    ],
    "stars": [...],
    "brands": [],
    "chains": [],
    "cities": [
        {
            "code": "SIN",
            "name": "Singapore"
        }
    ],
    "districts": [...],
    "amenities": [...],
    "roomAmenities": [...],
    "themes": [],
    "rateAmenities": [],
    "roomTypeCategories": [
        {
            "id": 3,
            "code": "ENTIRE_HOUSE",
            "name": "Entire house"
        }
    ],
    "providers": [
        {
            "code": "airbnb.com",
            "name": "Airbnb",
            "type": "OTA",
            "id": 613,
            "isMobileFriendly": true,
            "isHotelWebsite": false
        }
    ],
    "count": 60,
    "done": true,
    "destinationInfo": {
        "hotelCount": 0
    }
}
```

## Get Hotel Logos
Returns logos based on given logo_type, site_code, location codes.

```
GET hotels/logos
```

#### Logic:

1. Check for `logo_type` parameter

    * If `logo_type` is either `provider`, `brand` or `loading_page`, then render corresponding logos.
    * Else, An empty array will be rendered.

### Parameters

| Property     | Required? | Data Type | Description                                                              |
| ------------ | --------- | --------- | ------------------------------------------------------------------------ |
| logoType     | No        | String    | Types of Logos. The 3 Types are `provider`, `brand`, and `loading_page`  |
| cityCode     | No        | String    | 3-letter IATA code of city. Used when logoType = `loading_page`          |
| siteCode     | No        | String    | Country Code of the user                                                 |
| providerType | No        | String    | Type of Provider. The 3 Types are `ota`, `direct`, and `direct_priority` |
| perPage      | No        | Number    | Number of returned results                                               |
| page         | No        | Number    | Offset Number                                                            |

### Examples
  * `/hotels/logos?logoType=loading_page&siteCode=SA&cityCode=KWI`

### Response
```json
[
  {
    "code": "agoda.com",
    "name": "Agoda",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/agoda.com"
  },
  {
    "code": "booking.com",
    "name": "Booking.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/booking.com"
  },
  {
    "code": "holidayme.com",
    "name": "Holidayme.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/holidayme.com"
  },
  {
    "code": "BOUDL",
    "name": "Boudl Hotels",
    "imageUrl": "https://assets.wego.com/hotels/brands/BOUDL"
  },
  {
    "code": "EF",
    "name": "Safir Hotels \u0026 Resorts",
    "imageUrl": "https://assets.wego.com/hotels/brands/EF"
  },
  {
    "code": "hotels.com",
    "name": "Hotels.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/hotels.com"
  },
  {
    "code": "BW+",
    "name": "Best Western Plus",
    "imageUrl": "https://assets.wego.com/hotels/brands/BW+"
  },
  {
    "code": "FS",
    "name": "Four Seasons",
    "imageUrl": "https://assets.wego.com/hotels/brands/FS"
  },
  {
    "code": "XI",
    "name": "ibis hotel",
    "imageUrl": "https://assets.wego.com/hotels/brands/XI"
  },
  {
    "code": "MK",
    "name": "Mövenpick Hotels \u0026 Resorts",
    "imageUrl": "https://assets.wego.com/hotels/brands/MK"
  }
]
```

## Get recommended hotel collections
Returns recommended hotel collections in a certain city. There are returned hotel collections in: `brands`, `stars`, `accommodation_types`, `districts` and `guest_score`.

```
GET /hotels/recommended/collections
```

### Parameters

| Property     | Required? | Data Type | Description                                                                  |
| ------------ | --------- | --------- | -----------------------------------------------------------------------------|
| city_code    | Yes       | String    | 3-letter IATA code of city.                                                  |
| locale       | No        | String    | The language that the response will be in. en as default                     |
| key_transform| No        | String    | Format of json keys. `camel_lower` or `underscore`. `camel_lower` as default |

### Examples
  * `https://srv.wego.com/hotels/recommended/collections?cityCode=SIN&locale=en&key_transform=underscore`

### Response
```json
[
  {
    "filter": {
      "brands": [
        407
      ]
    },
    "hotel_count": 32,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1488350343/Partner/hotels/258116/82409338.jpg",
    "title": "The best of Hotel 81",
    "desc": "Hand-picked selection of the best Hotel 81 properties in Singapore"
  },
  {
    "filter": {
      "stars": [
        5
      ]
    },
    "hotel_count": 71,
    "image_url": "https://assets.wego.com/image/upload/v1524876815/Partner/hotels/258105/66074781.jpg",
    "title": "Top 5-star hotels",
    "desc": "Explore the perfect 5-star properties in Singapore"
  },
  {
    "filter": {
      "accommodation_types": [
        2
      ]
    },
    "hotel_count": 93,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1487240105/Partner/hotels/258171/12882818.jpg",
    "title": "Most Recommended Hostel / Backpacker in Singapore",
    "desc": "Choose from the highest rated Singapore Hostel / Backpacker options"
  },
  {
    "filter": {
      "guest_score": [
        86,
        100
      ]
    },
    "hotel_count": 126,
    "image_url": "https://assets.wego.com/image/upload/v1524876810/Partner/hotels/258111/113939661.jpg",
    "title": "Highest Rated Hotels in Singapore",
    "desc": "See only the top-rated Singapore hotels, sorted from the highest review score to the lowest"
  },
  {
    "filter": {
      "districts": [
        719
      ]
    },
    "hotel_count": 83,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1488350303/Partner/hotels/258080/80943804.jpg",
    "title": "Most Recommended Orchard Hotels",
    "desc": "Choose the perfect hotel in Orchard, one of the most popular districts of Singapore."
  },
  {
    "filter": {
      "brands": [
        954
      ]
    },
    "hotel_count": 24,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1487240095/Partner/hotels/258095/87363301.jpg",
    "title": "Curated selection of Fragrance Hotel",
    "desc": "Choose from the wide range of Fragrance Hotel properties"
  },
  {
    "filter": {
      "stars": [
        4
      ]
    },
    "hotel_count": 119,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1506524584/Partner/hotels/695651/84842532.jpg",
    "title": "Hand-picked 4-star hotels",
    "desc": "Search among the best 4-star hotels in Singapore"
  },
  {
    "filter": {
      "accommodation_types": [
        5
      ]
    },
    "hotel_count": 6,
    "image_url": "https://res.cloudinary.com/wego/image/upload/v1499329050/Partner/hotels/258030/xst2t5qx8rj0usgmyqg3.jpg",
    "title": "Top Rated Holiday home picks in Singapore",
    "desc": "Selection of the most recommended Holiday home properties by travellers in Singapore"
  },
  {
    "filter": {
      "districts": [
        726
      ]
    },
    "hotel_count": 18,
    "image_url": "https://assets.wego.com/image/upload/v1524876815/Partner/hotels/258105/66074781.jpg",
    "title": "The best of Marina Bay Hotels",
    "desc": "Explore hotels in Marina Bay, a district loved by other travellers to Singapore"
  }
]
```

## Users

### Authentication

```
POST users/oauth/token
```

Input

| Property      | Required? | Data Type | Description |
| ------------- | --------- | --------- | ----------- |
| grant_type    | yes       | password  |
| email         | No        | String    |
| client_id     | No        | String    |
| client_secret | Yes       | String    |
| password      | Yes       | String    |
| scope         | Yes       | users     |

Headers

| Key          | value            |
| ------------ | ---------------- |
| Content-Type | application/json |

#### Example

```
{
  "grant_type": "password",
  "email": "client.email@gmail.com",
  "client_id": "c9o8b07c38789dc270cb79abcffc10abe69ed9c6eaa081c00aa2354d63cef6a7",
  "client_secret": "346o15e864b5d2b4dd16a2d75caacb17cba5deb098c1a60ebc3c052809865bfb",
  "password": "clientpassword",
  "scope": "users"
}
```

#### Response

```
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1aWQiOjY3MzUsInN1YiI6ImluaWdvLnNhcm1pZW50b0BnbWFpbC5jb20iLCJhdWQiOiJ1c2VycyIsImV4cCI6MTQ5NDYxNjkxNSwiaWF0IjoxNDk0NTczNzE1LCJpc3MiOiJXZWdvIEZhY2lsaXRhdGVkIEJvb2tpbmcgQXBwIiwianRpIjoiZWIwMTBjNzgxZWZmMjgwMzhjYzRmZWE3MmQwZjU3ZjEifQ.a-KU2ATeUhmbRLqZe-1cXs5TQIzOZIZRBr6vQX-ZsHPcisAVPqNaMvre_AALeQJlFNstLXjoR3jRIsyD4_V2uA",
  "token_type": "bearer",
  "expires_in": 43200,
  "refresh_token": "4f37c69e3438439ba745cca72844fb984071cfc4b544d45fd614df627a9cd727",
  "scope": "users",
  "created_at": 1494573715,
  "authentication_token": "SvRax-GWgntcYsrN2c_f"
}
```

### Get booking history

```
GET  users/bookings
```

| Property     | Required? | Data Type | Description |
| ------------ | --------- | --------- | ----------- |
| keyTransform | Yes       | String    | camel_lower |

Headers

| Key            | value                 |
| -------------- | --------------------- |
| Content-Type   | application/json      |
| X-Wego-Version | 1                     |
| Authorization  | Bearer <access_token> |

#### Example

- `/users/bookings?key_transform=camel_lower`

#### Response

```
{
  "flightsBookings": [
    {
      "id": 22143,
      "status": "SUCCESSFUL",
      "search": {
        "adultsCount": 1,
        "createdAt": "2017-02-09T22:41:47.630+08:00",
        "childrenCount": 0,
        "infantsCount": 0,
        "siteCode": "SG",
        "cabin": "ECONOMY",
        "trips": [
          {
            "departureCountryCode": "SG",
            "departureCountryName": "Singapore",
            "arrivalCountryCode": "PH",
            "arrivalCountryName": "Philippines",
            "outboundDate": "2017-04-13",
            "departureCityCode": "SIN",
            "departureCityName": "Singapore Changi Airport",
            "arrivalCityCode": "MNL",
            "arrivalCityName": "Manila Ninoy Aquino International Airport"
          }
        ]
      },
      "price": {
        "amountUsd": 111.78,
        "amount": 158.1,
        "totalAmount": 158.1,
        "currencyCode": "SGD",
        "amountPerAdult": 152,
        "amountPerChild": 0,
        "amountPerInfant": 0,
        "taxAmount": 6.1,
        "taxInclusive": true,
        "paymentFees": [
          {
            "paymentName": "Mastercard Credit Card",
            "paymentType": "MASTERCARD_CREDIT_CARD",
            "paymentCardNumberLengthMax": 16,
            "paymentCardNumberLengthMin": 16,
            "amount": 0,
            "currencyCode": "SGD",
            "paymentImageUrl": "http://res.cloudinary.com/wego/image/upload/v1469439534/payment_logos/MasterCard.jpg"
          }

        ]
      },
      "trip": {
        "legs": [
          {
            "legId": "SIN_MNL",
            "departureAirportCode": "SIN",
            "departureAirportName": "Singapore Changi Airport",
            "departureDate": "2017-04-13",
            "departureTime": "01:35",
            "arrivalAirportCode": "MNL",
            "arrivalAirportName": "Manila Ninoy Aquino International Airport",
            "arrivalDate": "2017-04-13",
            "arrivalTime": "05:10",
            "stopoversCount": 0,
            "segments": [
              {
                "segmentId": "SIN_MNL",
                "departureAirportCode": "SIN",
                "departureAirportName": "Singapore Changi Airport",
                "departureDate": "2017-04-13",
                "departureTime": "01:35",
                "duration": "03h 35m",
                "airlineCode": "5J",
                "airlineName": "Cebu Pacific",
                "designatorCode": "5J804",
                "arrivalAirportCode": "MNL",
                "arrivalAirportName": "Manila Ninoy Aquino International Airport",
                "arrivalDate": "2017-04-13",
                "arrivalTime": "05:10"
              }
            ]
          }
        ]
      },
      "fare": {
        "id": "ukbDceH8T3eNJB2CfyJIRA:wego.com-cebupacificair.com:5",
        "price": {
          "currencyCode": "SGD",
          "amount": 158.1,
          "taxInclusive": true,
          "amountUsd": 111.70698,
          "amountPerAdult": 152,
          "amountPerChild": 0,
          "paymentFees": [
            {
              "currencyCode": "SGD",
              "amount": 0
            },
            {
              "currencyCode": "SGD",
              "amount": 0
            }
          ]
        },
        "provider": {
          "code": "wego.com-cebupacificair.com",
          "name": "Cebu Pacific via Wego",
          "parentCode": "cebupacificair.com",
          "parentName": "Cebu Pacific",
          "imageUrl": "http://0.omg.io/wego/image/upload/c_fit,w_160,h_48/v1/providers/rectangular_logos/wego.com-cebupacificair.com.png",
          "url": "https://www.cebupacificair.com/sg-en/Pages/contact-us.aspx",
          "phoneNumber": "+632-2905241",
          "email": "",
          "termsAndConditionsUrl": "https://www.cebupacificair.com/Pages/terms-and-conditions-of-carriage.aspx",
          "summaryTermsAndConditions": "*Payment*\r\n- The total amount shown may be processed by two different merchants.\r\n\r\n*Refund*\r\n\r\n- Once issued, tickets are non-refundable.\r\n\r\n*Visa*\r\n\r\n- Airline carrier is not responsible for obtaining any required visas (including transit visa) for its passengers. Please make sure you apply for all necessary visas directly. You may not be allowed onboard in case a required visas is missing.",
          "termsAndConditions": "## GENERAL TERMS AND CONDITIONS OF CARRIAGE OF PASSENGERS AND BAGGAGE ## The text was too long to paste into the response"
        }
      },
      "contact": {
        "fullName": "Inigo Iraj Sarmiento",
        "email": "inigo.sarmiento@gmail.com",
        "countryCode": "SG",
        "phoneCountryCode": "+65",
        "phoneNumber": "96447763"
      },
      "billingAddress": {
        "addressLine1": "Block 324 Unit 07-549",
        "cityName": "Singapore",
        "countryName": "Singapore",
        "countryCode": "SG",
        "postalCode": "400324"
      },
      "travellers": [
        {
          "firstName": "Inigo Iraj",
          "lastName": "Sarmiento",
          "nationality": "PH",
          "dateOfBirth": "1988-12-19",
          "passport": "EB9233592",
          "passportExpiry": "2018-09-24",
          "title": "mr",
          "travellerType": "ADULT"
        }
      ]
    }

 ]
```

### Get user info

```
GET  users/info
```

Headers

| Key            | value                 |
| -------------- | --------------------- |
| Content-Type   | application/json      |
| X-Wego-Version | 1                     |
| Authorization  | Bearer <access_token> |

#### Example

- `/users/info`

#### Response

```
{
    "id": 1129874,
    "email": "dummy@wego.com",
    "name": "dummy data",
    "photo_url": null,
    "country_code": "ID"
}
```

### Get user tags

```
GET  users/users
```

Headers

| Key            | value                 |
| -------------- | --------------------- |
| Content-Type   | application/json      |
| X-Wego-Version | 1                     |
| Authorization  | Bearer <access_token> |

#### Example

- `/users/users`

#### Response

```
{
    "user": {
        "user_id": 1129874,
        "contacts": [
            {
                "id": 51,
                "full_name": "Yagi Anggar",
                "email": "yagi@wego.com",
                "phone_country_code": "+62",
                "phone_number": "1234567"
            }
        ],
        "tags": [
            {
              "id": 3,
              "name": "dummy tag",
              "category": {
                  "id": 1,
                  "name": "dummy category",
                  "image_url": "http://dummy.com/im.png",
                  "selection_color": "#000000"
              }
            }
        ]
    }
}
```

### Contact Us Api

```
POST  users/contact_us
```

Input

| Property    | Required? | Data Type | Description |
| ----------- | --------- | --------- | ----------- |
| user_email  | Yes       | String    |
| subject     | Yes       | String    |
| app_version | Yes       | String    |
| device_type | Yes       | String    |
| device_os   | Yes       | String    |
| feedback    | Yes       | String    |
| attachment  | No        | Array     | Image Hash  |

Headers

| Key            | value            |
| -------------- | ---------------- |
| Content-Type   | application/json |
| X-Wego-Version | 1                |

#### Example Request

```
{
  "user_email": "kusumah@wego.com",
  "subject": "Failed Booking",
  "app_version": "5.4.1",
  "device_type": "iPhone",
  "device_os": "ios",
  "feedback": "failed booking, should be any email related to this error",
  "attachment": [
    {
      "content": "<image_in_base_64>",
      "image_type": "image/png",
      "filename": "sc.png"
    }
  ]
}
```

#### Response Success

```
{
    "message": "Email Has Been Sent"
}
```

#### Response Error

```
{
    "error_code": 500,
    "error": "The attachment content must be base64 encoded."
}
```

### Sign Up

```
POST users/sign_up
```

Input

| Property | Required? | Data Type | Description |
| -------- | --------- | --------- | ----------- |
| user     | Yes       | Object    |
| device   | No        | Object    |

Headers

| Key            | value            |
| -------------- | ---------------- |
| Content-Type   | application/json |
| X-Wego-Version | 1                |

#### Example request (Email and Password Sign Up)

```
{
  "user": {
    "email": "ahmad_k102@yahoo.com",
    "password": "password",
    "password_confirmation": "password",
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  }

}
```

#### Example request (FB/ Google Sign Up)

```
{
  "user": {
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  },
  "provider": "<provider (google/ facebook)>",
  "token": "<provider_token>"
}
```

#### Example Response

```
{
    "id": 2609997,
    "email": "ahmad_k1021234@yahoo.com",
    "token": "7E92xbFwNBymACCgDSxu",
    "needs_to_set_password": false,
    "sign_in_count": 0
}
```

### Sign In

```
POST users/sign_in
```

Input

| Property | Required? | Data Type | Description |
| -------- | --------- | --------- | ----------- |
| user     | Yes       | Object    |
| device   | No        | Object    |

Headers

| Key            | value            |
| -------------- | ---------------- |
| Content-Type   | application/json |
| X-Wego-Version | 1                |

#### Example Request (Email And Password)

```
{
  "user": {
    "email": "kusumah@ganteng.com",
    "password": "johndoepassword"
    },
    "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
   },
   "locale": "en"
  }
```

#### Example Request (Provider FB/Google)

```
{
  "provider": "facebook",
  "token": "dummytoken"
    "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
   },
   "locale": "en"
  }
```

#### Response

```
{
    "id": 36328,
    "email": "kusumah@ganteng.com",
    "token": "ZAMBY4Zoco6Yz1zS_-xw",
    "needs_to_set_password": false,
    "sign_in_count": 6782
}
```

---

## Compare Unit

### Compare Unit Flight Search

```
GET compare/flights/search
```

Parameters

| Property               | Required?                         | Data Type                                                | Description                                                   |
| ---------------------- | --------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| departure_airport_code | Yes, if no departure_city_code    | String                                                   | IATA Airport Code                                             |
| departure_city_code    | Yes, if no departure_airport_code | String                                                   | IATA City Code                                                |
| departure_country_code | Yes                               | String                                                   | Must be in ISO country code format                            |
| arrival_airport_code   | Yes, if no arrival_city_code      | String                                                   | IATA Airport Code                                             |
| arrival_city_code      | Yes, if no arrival_airport_code   | String                                                   | IATA City Code                                                |
| arrival_country_code   | Yes                               | String                                                   | Must be in ISO country code format                            |
| site_code              | Yes                               | String                                                   | Country Code of the user. Must be in ISO country code format. |
| locale                 | Yes                               | The language that the response will be in. en as default |
| device_type            | No                                | String. '*' as default                                   | support device, the options are '*', 'mobile', 'desktop'      |
| key_transform          | Yes                               | String                                                   | underscore                                                    |

#### Example

- `compare/flights/search?departure_airport_code=SGN&arrival_airport_code=HKG&site_code=IN&locale=en&departure_country_code=IN&arrival_country_code=SG&device_type=mobile&key_transform=underscore`

#### Response

```
[
  {
    "handoff_url": "https://proxy-staging.bezurk.org/compare/flights/continue?departure_airport_code=SIN&departure_country_code=AE&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&key_transform=underscore&pr"ovider_id=4&pre_checked=false",
    "search_id": "FLIGHT-SIN-LON-AE-GB-AE-en",
    "provider": {
      "code": "cleartrip.ae",
      "name": "cleartrip.ae",
      "ecpc": "0.3",
      "term_id": 6361
    }
  },
  {
    "handoff_url": "https://proxy-staging.bezurk.org/compare/flights/continue?departure_airport_code=SIN&departure_country_code=AE&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&key_transform=underscore&provider_id=1&pre_checked=true",
    "pre_checked": true,
    "search_id": "FLIGHT-SIN-LON-AE-GB-AE-en",
    "provider": {
      "code": "britishairways.com",
      "name": "britishairways.com",
      "ecpc": "0.15",
      "term_id": 7101
    }
  }
]
```

### Compare Unit Flight Deeplink

```
GET compare/flights/deeplink
```

Parameters

| Property               | Required?                         | Data Type                                                | Description                                                                 |
| ---------------------- | --------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------- |
| departure_airport_code | Yes, if no departure_city_code    | String                                                   | IATA Airport Code                                                           |
| departure_city_code    | Yes, if no departure_airport_code | String                                                   | IATA City Code                                                              |
| departure_country_code | Yes                               | String                                                   | Must be in ISO country code format                                          |
| arrival_airport_code   | Yes, if no arrival_city_code      | String                                                   | IATA Airport Code                                                           |
| arrival_city_code      | Yes, if no arrival_airport_code   | String                                                   | IATA City Code                                                              |
| arrival_country_code   | Yes                               | String                                                   | Must be in ISO country code format                                          |
| adults_count           | Yes                               | Integer                                                  | Must be a number greater than or equal to 1 and smaller than or equal to 10 |
| children_count         | No                                | Integer                                                  | Must be a number greater than or equal to 0 and smaller than or equal to 10 |
| infants_count          | No                                | Integer                                                  | Must be a number greater than or equal to 0 and smaller than or equal to 2  |
| cabin                  | Yes                               | String                                                   | `economy` as default. Can be `economy`, `business`, `first`                 |
| provider_id            | Yes, if no airline_code           | Number                                                   | This value present in search api response                                   |
| airline_code           | Yes, if no provider_id            | String                                                   | Must be either 2 or 3 characters long                                       |
| pre_checked            | No                                | Boolean                                                  | This value present in search api response                                   |
| outbound_date          | Yes                               | String                                                   | YYYY-MM-DD format                                                           |
| inbound_date           | Yes, if roundtrip                 | String                                                   | YYYY-MM-DD format                                                           |
| currency_code          | No                                | String                                                   | Must be ISO currency code format                                            |
| site_code              | Yes                               | String                                                   | Country Code of the user. Must be in ISO country code format.               |
| locale                 | Yes                               | The language that the response will be in. en as default |
| key_transform          | Yes                               | String                                                   | underscore                                                                  |

#### Example

**For Airlines which accept `GET` requests**

- `compare/flights/deeplink?provider_id=1&departure_airport_code=ALG&departure_country_code=DZ&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&outbound_date=2017-07-25&cabin=economy&currency_code=AED&adults_count=2&children_count=0&infants_count=0&key_transform=underscore`

- `compare/flights/deeplink?provider_id=1&departure_airport_code=ALG&departure_country_code=DZ&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&outbound_date=2017-07-25&inbound_date=2017-08-25&cabin=economy&currency_code=AED&adults_count=2&children_count=0&infants_count=0&key_transform=underscore`

**For Airlines which accept `POST` requests**

- `compare/flights/deeplink?airline_code=SG&departure_airport_code=ALG&departure_country_code=DZ&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&outbound_date=2017-07-25&cabin=economy&currency_code=AED&adults_count=2&children_count=0&infants_count=0&key_transform=underscore`

- `compare/flights/deeplink?airline_code=J9&departure_airport_code=ALG&departure_country_code=DZ&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&outbound_date=2017-07-25&inbound_date=2017-08-25&cabin=economy&currency_code=AED&adults_count=2&children_count=0&infants_count=0&key_transform=underscore`

#### Response

**For Airlines which accept `GET` requests**

```
{
  "code": "britishairways.com",
  "name": "British Airways",
  "ecpc": "0.15",
  "term_id": 7101,
  "iframe": false,
  "deeplink_url": "https://prf.hn/click/camref:1011l9us/adref:bookable/destination:https://ba.com/travel/fx/en_sg?eId=111009\u0026from=ALG\u0026to=LON\u0026ad=2\u0026ch=0\u0026inf=0\u0026cabin=M\u0026depDate=25/07/17\u0026restrictionType=LOWEST\u0026myDatesAreFixedSelected=true\u0026retDate=25/08/17",
  "analytics_params": {
    "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar-britishairways.com",
    "provider_code": "britishairways.com",
    "provider_domain": "*",
    "pre_checked": null,
    "cpc": "0.15",
    "term_id": 7101,
    "search": {
      "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar",
      "adults_count": "1",
      "children_count": "1",
      "infants_count": "1",
      "cabin": 1,
      "site_code": "SA",
      "locale": "ar",
      "currency_code": "AED",
      "trips": [
        {
          "departure_airport_code": "SIN",
          "departure_city_code": "SIN",
          "arrival_airport_code": "BLR",
          "arrival_city_code": "BLR",
          "outbound_date": "2017-07-25",
          "inbound_date": "2017-08-25",
          "departure_airport_name": "سنغافورة",
          "departure_city_name": "سنغافورة",
          "departure_country_code": "SG",
          "departure_country_name": "سنغافورة",
          "departure_world_region_code": "i",
          "departure_world_region_name": "آسيا",
          "arrival_airport_name": "بنغالور",
          "arrival_city_name": "بنغالور",
          "arrival_country_code": "IN",
          "arrival_country_name": "الهند",
          "arrival_world_region_code": "i",
          "arrival_world_region_name": "آسيا"
        }
      ]
    }
  }
}
```

**For Airlines which accept `POST` requests**

```
{
  "code": "spicejet.com",
  "name": "Spicejet",
  "ecpc": "0.0",
  "iframe": false,
  "deeplink_url": "http://book.spicejet.com/Select.aspx?APIPartner=WEGO\u0026utm_source=MetaSearch\u0026utm_medium=CPA\u0026utm_term=BLRMAA\u0026utm_campaign=Wego\u0026wego_click_id=12ff49bee20e9c08:spicejet.com:3",
  "post_params": {
    "triptype": "OneWay",
    "origincity": "(ALG)",
    "origincitycode": "ALG",
    "destinationcity": "(LON)",
    "destinationcitycode": "LON",
    "fromdate": "25-07-2017",
    "adultcount": "2",
    "childcount": "0",
    "infantcount": "0"
  },
  "analytics_params": {
    "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar-spicejet.com",
    "provider_code": "spicejet.com",
    "provider_domain": "*",
    "pre_checked": null,
    "cpc": "0.0",
    "term_id": null,
    "search": {
      "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar",
      "adults_count": "1",
      "children_count": "1",
      "infants_count": "1",
      "cabin": 1,
      "site_code": "SA",
      "locale": "ar",
      "currency_code": "AED",
      "trips": [
        {
          "departure_airport_code": "SIN",
          "departure_city_code": "SIN",
          "arrival_airport_code": "BLR",
          "arrival_city_code": "BLR",
          "outbound_date": "2017-07-25",
          "inbound_date": "2017-08-25",
          "departure_airport_name": "سنغافورة",
          "departure_city_name": "سنغافورة",
          "departure_country_code": "SG",
          "departure_country_name": "سنغافورة",
          "departure_world_region_code": "i",
          "departure_world_region_name": "آسيا",
          "arrival_airport_name": "بنغالور",
          "arrival_city_name": "بنغالور",
          "arrival_country_code": "IN",
          "arrival_country_name": "الهند",
          "arrival_world_region_code": "i",
          "arrival_world_region_name": "آسيا"
        }
      ]
    }
  }
}
```

```
{
  "code": "J9",
  "name": "Jazeera Airways",
  "ecpc": "0.0",
  "iframe": false,
  "deeplink_url": "https://book.jazeeraairways.com/Search.aspx",
  "post_params": {
    "__eventtarget": "ControlGroupSearchView$LinkButtonSubmit",
    "control_group_search_view$availability_search_input_search_view$radio_button_market_structure": "RoundTrip",
    "control_group_search_view_availability_search_input_search_vieworigin_station1": "ALG",
    "control_group_search_view$availability_search_input_search_view$text_box_market_origin1": "ALG",
    "control_group_search_view_availability_search_input_search_viewdestination_station1": "LON",
    "control_group_search_view$availability_search_input_search_view$text_box_market_destination1": "LON",
    "control_group_search_view$availability_search_input_search_view$drop_down_list_market_day1": "25",
    "control_group_search_view$availability_search_input_search_view$text_box_market_date1": "25 Jul 2017",
    "control_group_search_view$availability_search_input_search_view$drop_down_list_market_day2": "25",
    "control_group_search_view$availability_search_input_search_view$text_box_market_date2": "25 Aug 2017",
    "control_group_search_view$availability_search_input_search_view$drop_down_list_passenger_type_adt": "2",
    "control_group_search_view$availability_search_input_search_view$drop_down_list_passenger_type_chd": "0",
    "control_group_search_view$availability_search_input_search_view$drop_down_list_passenger_type_infant": "0"
  },
  "analytics_params": {
    "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar-J9",
    "provider_code": "J9",
    "provider_domain": "*",
    "pre_checked": null,
    "cpc": "0.0",
    "term_id": null,
    "search": {
      "id": "FLIGHT-SIN-BLR-SG-IN-SA-ar",
      "adults_count": "1",
      "children_count": "1",
      "infants_count": "1",
      "cabin": 1,
      "site_code": "SA",
      "locale": "ar",
      "currency_code": "AED",
      "trips": [
        {
          "departure_airport_code": "SIN",
          "departure_city_code": "SIN",
          "arrival_airport_code": "BLR",
          "arrival_city_code": "BLR",
          "outbound_date": "2017-07-25",
          "inbound_date": "2017-08-25",
          "departure_airport_name": "سنغافورة",
          "departure_city_name": "سنغافورة",
          "departure_country_code": "SG",
          "departure_country_name": "سنغافورة",
          "departure_world_region_code": "i",
          "departure_world_region_name": "آسيا",
          "arrival_airport_name": "بنغالور",
          "arrival_city_name": "بنغالور",
          "arrival_country_code": "IN",
          "arrival_country_name": "الهند",
          "arrival_world_region_code": "i",
          "arrival_world_region_name": "آسيا"
        }
      ]
    }
  }
}
```

### Compare Unit Flight Airline

```
GET compare/flights/airlines
```

It will return all airline codes which are having `deeplink_configs` values and sorted into descending order of `ecpc`.

#### Example

- `compare/flights/airlines`

#### Response

```
[
  {
    "code": "BA"
  },
  {
    "code": "SG"
  },
  {
    "code": "G9"
  },
  {
    "code": "AZ"
  },
  {
    "code": "EK"
  },
  {
    "code": "FZ"
  },
  {
    "code": "GF"
  },
  {
    "code": "J9"
  },
  {
    "code": "9W"
  },
  {
    "code": "KL"
  },
  {
    "code": "MH"
  },
  {
    "code": "VJ"
  },
  {
    "code": "QG"
  }
]
```

### Compare Unit Flight Continue

```
GET compare/flights/continue
```

Parameters

| Property               | Required?                         | Data Type                                                | Description                                                                 |
| ---------------------- | --------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------- |
| departure_airport_code | Yes, if no departure_city_code    | String                                                   | IATA Airport Code                                                           |
| departure_city_code    | Yes, if no departure_airport_code | String                                                   | IATA City Code                                                              |
| departure_country_code | Yes                               | String                                                   | Must be in ISO country code format                                          |
| arrival_airport_code   | Yes, if no arrival_city_code      | String                                                   | IATA Airport Code                                                           |
| arrival_city_code      | Yes, if no arrival_airport_code   | String                                                   | IATA City Code                                                              |
| arrival_country_code   | Yes                               | String                                                   | Must be in ISO country code format                                          |
| adults_count           | Yes                               | Integer                                                  | Must be a number greater than or equal to 1 and smaller than or equal to 10 |
| children_count         | No                                | Integer                                                  | Must be a number greater than or equal to 0 and smaller than or equal to 10 |
| infants_count          | No                                | Integer                                                  | Must be a number greater than or equal to 0 and smaller than or equal to 2  |
| cabin                  | Yes                               | String                                                   | `economy` as default. Can be `economy`, `business`, `first`                 |
| provider_id            | Yes                               | Number                                                   | This value present in search api response                                   |
| pre_checked            | No                                | Boolean                                                  | This value present in search api response                                   |
| outbound_date          | Yes                               | String                                                   | YYYY-MM-DD format                                                           |
| inbound_date           | Yes, if roundtrip                 | String                                                   | YYYY-MM-DD format                                                           |
| currency_code          | No                                | String                                                   | Must be ISO currency code format                                            |
| site_code              | Yes                               | String                                                   | Country Code of the user. Must be in ISO country code format.               |
| locale                 | Yes                               | The language that the response will be in. en as default |
| key_transform          | Yes                               | String                                                   | underscore                                                                  |

#### Example

- `compare/flights/continue?departure_airport_code=ALG&departure_country_code=DZ&arrival_airport_code=LON&arrival_country_code=GB&site_code=AE&locale=en&provider_id=1&outbound_date=2017-07-25&cabin=economy&currency_code=AED&adults_count=2&children_count=0&infants_count=0&key_transform=underscore`

#### Response

```
Redirect to partner url
```

### Bulk Create Compare Unit Flight Routes

```
POST compare/flights/compare_unit_routes/bulk_create
```

Parameters

| Property    | Required? | Data Type                                 | Description                                                   |
| ----------- | --------- | ----------------------------------------- | ------------------------------------------------------------- |
| provider_id | Yes       | Integer                                   | The provider belonging to this route                          |
| from        | Yes       | String                                    | IATA Airport Code                                             |
| to          | Yes       | String                                    | IATA Airport Code                                             |
| locale      | Yes       | The language that the response will be in | The language that the response will be in                     |
| site_code   | Yes       | String                                    | Country Code of the user. Must be in ISO country code format. |

#### Example

- `/compare/flights/compare_unit_routes/bulk_create`

#### Request Body

It must be wrap in a hash with key compare_units.

```
{
 "compare_units": [
       {"provider_id": "1", "from": "SGN", "to": "CAH", "site_code": "*", "locale": "*", "pre_checked": "1"},
       {"provider_id": "1", "from": "SGN", "to": "ABC", "site_code": "*", "locale": "*", "pre_checked": "1"},
       {"provider_id": "1", "from": "SGN", "to": "CAH", "site_code": "", "locale": "*", "pre_checked": "1"}
  ]
}
```

#### Response

```
{
    "failed_instances": [
        {
            "from": "SGN",
            "to": "CAH",
            "pre_checked": true,
            "site_code": "",
            "locale": "*",
            "placement_type": "all",
            "errors": {
                "site_code": [
                    "can't be blank"
                ]
            },
            "provider": {
                "code": "britishairways.com",
                "name": "British Airways",
                "provider_type": "airline",
                "airline_code": "BA",
                "ecpc": "0.15",
                "term_id": 7101,
                "iframe": false
            }
        }
    ],
    "success_count": 2
}
```

### Compare Unit Hotel Search

```
GET compare/hotels/search
```

Parameters

| Property              | Required? | Data Type                                                | Description                                                   |
| --------------------- | --------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| city_code             | Yes       | String                                                   | Wego Location Code                                            |
| location_country_code | Yes       | String                                                   | Must be in ISO country code format                            |
| site_code             | Yes       | String                                                   | Country Code of the user. Must be in ISO country code format. |
| locale                | Yes       | The language that the response will be in. en as default |
| device_type           | No        | String. '*' as default                                   | support device, the options are '*', 'mobile', 'desktop'      |
| key_transform         | Yes       | String                                                   | underscore                                                    |

#### Example

- `compare/hotels/search?city_code=BLR&site_code=IN&locale=en&location_country_code=IN&device_type=mobile&key_transform=underscore`

#### Response

```
[
  {
    "handoff_url": "https://proxy-staging.bezurk.org/compare/hotels/deeplink?city_code=BLR&location_country_code=IN&site_code=IN&locale=en&key_transform=underscore&provider_id=6",
    "pre_checked": true,
    "search_id": "HOTEL-BLR-IN-IN-en",
    "provider": {
      "code": "booking.com",
      "name": "booking.com",
      "ecpc": "0.2",
      "term_id": 6361
    }
  }
]
```

### Compare Unit Hotel Deeplink

```
GET compare/hotels/deeplink
```

Parameters

| Property              | Required? | Data Type                                                | Description                                                   |
| --------------------- | --------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| city_code             | Yes       | String                                                   | Wego Location Code                                            |
| location_country_code | Yes       | String                                                   | Must be in ISO country code format                            |
| rooms_count           | Yes       | Number                                                   |
| guests_count          | Yes       | Number                                                   |
| check_in              | Yes       | Date                                                     | YYYY-MM-DD format                                             |
| check_out             | Yes       | Date                                                     | YYYY-MM-DD format                                             |
| provider_id           | Yes       | Number                                                   | This value present in search api response                     |
| pre_checked           | No        | Boolean                                                  | This value present in search api response                     |
| currency_code         | No        | String                                                   | Must be ISO currency code format                              |
| site_code             | Yes       | String                                                   | Country Code of the user. Must be in ISO country code format. |
| locale                | Yes       | The language that the response will be in. en as default |
| key_transform         | Yes       | String                                                   | underscore                                                    |

#### Example

- `hotels/deeplink?city_code=SIN&location_country_code=IN&site_code=IN&locale=en&provider_id=6&pre_checked=true&key_transform=underscore&currency_code=AED&check_in=17-08-2017&check_out=18-08-2017&guests_count=4&rooms_count=2`

#### Response

```
{
  code: "booking.com",
  name: "Booking.com",
  ecpc: "0.2",
  termId: 5564,
  iframe: true,
  deeplinkUrl: "https://www.booking.com/searchresults.html?aid=366946&city=-73635&label=ufi-M73635&utm_source=wego&amp;utm_medium=SPPC&utm_content=bookables&utm_campaign=row&utm_term=ufi-M73635&checkin_monthday=17&checkin_year_month=2018-08&checkout_monthday=18&checkout_year_month=2018-08&group_adults=2&group_adults=2",
  analyticsParams: {
    id: "dc1ca85e-8eef-40b6-ac01-8b9195e09f04",
    providerCode: "booking.com",
    providerDomain: "*",
    preChecked: null,
    cpc: "0.2",
    termId: 5564,
    createdAt: "2017-09-20T16:22:12",
    createdAtTimezone: "+05:30",
    page: {
      url: "https://proxy-staging.bezurk.org/compare/hotels/deeplink?city_code=SIN&location_country_code=IN&site_code=IN&locale=en&provider_id=6&currency_code=AED&check_in=17-08-2018&check_out=18-08-2018&guests_count=4&rooms_count=2",
      referrerUrl: null,
      siteCode: "IN",
      locale: "en",
      currencyCode: "AED"
    },
    search: {
      cityCode: "SIN",
      countryCode: "IN",
      roomsCount: "2",
      guestsCount: "4",
      checkIn: "17-08-2018",
      checkOut: "18-08-2018",
      siteCode: "IN",
      locale: "en",
      currencyCode: "AED"
    },
    client: {
      geocode: {
        ip: "::1",
        countryCode: null,
        cityName: null,
        latitude: null,
        longitude: null
      },
      id: null
    }
  }
}
```

### Get Rate

Get Rate by rateId

```
metasearch/hotels/rates/:rateId
```

Response

```
{
  "id": "f7cb3002-2793-43cf-881c-e76466dc8d4e~zenrooms.com~1354769~1",
  "hotelId": 1354769,
  "providerHotelId": "6941",
  "createdAt": "2017-04-28T10:41:41.936Z",
  "description": "Double Bed/Twin Bed",
  "price": {
    "amount": 62,
    "currencyCode": "USD",
    "amountUsd": 61.716362,
    "taxAmount": 0,
    "taxAmountUsd": 0,
    "taxInclusive": true,
    "ecpc": 0.4,
    "localTaxAmount": 0,
    "totalAmount": 682,
    "totalAmountUsd": 678.88
  },
  "rateAmenityIds": [],
  "provider": {
    "code": "zenrooms.com",
    "name": "ZEN Rooms",
    "type": "CHAIN",
    "id": 535,
    "isMobileFriendly": true,
    "isHotelWebsite": true
  },
  "remainingRoomsCount": 6,
  "handoffUrl": "https://www.wego.com.sg/continue/1354769/535/1?search_id=f7cb3002-2793-43cf-881c-e76466dc8d4e&site=www.wego.com.sg&locale=en"
}
```

---

## Reference

### Device Types

List of supported device types:

```
  UNDEFINED_DEVICE_TYPE,
  DESKTOP,
  TABLET,
  MOBILE,
  WATCH;
```

### App Types

List of supported app types:

```
  UNDEFINED_APP_TYPE,
  IOS_APP,
  IOS_TABLET_APP,
  ANDROID_APP,
  ANDROID_TABLET_APP,
  WEB_APP,
  MOBILE_WEB_APP,
  API_APP;
```

### Locales

List of supported locales:

```
[ "en", "ar", "id", "fa", "zh-cn", "zh-tw", "zh-hk", "de", "es-419", "es", "fr", "it", "ja", "ko", "ms", "nl", "pl", "pt", "pt-br", "ru", "sv", "th", "tr", "vi", "ur", "te", "ta", "pa", "or", "mr", "ml", "kn", "hi", "gu", "bn" ]
```

### Site Codes

List of supported site codes:

```
[ "DZ", "AR", "AU", "BH", "BD", "BR", "CA", "CL", "CN", "CO", "EG", "FR", "DE", "GH", "HK", "IN", "ID", "IR", "IR", "IE", "IT", "JP", "JO", "KW", "MY", "MX", "MA", "NL", "NZ", "NG", "OM", "PK", "PH", "PL", "PT", "QA", "RU", "SA", "SG", "ZA", "KR", "ES", "LK", "SE", "CH", "TW", "TH", "TN", "TR", "AE", "GB", "US", "VN" ]
```

### Amount Types

Value is case-insensitive

| Value              | Description              |
| ------------------ | ------------------------ |
| PER_NIGHT_PER_ROOM | Price per night per room |
| NIGHTLY            | Price nightly            |

