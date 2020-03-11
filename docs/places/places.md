# Wego Place Services API

| Endpoint                                                                                   | Description                                             |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------- |
| [GET /places/airports/:id](#get-airport)                                                   | Get airport                                             |
| [GET /places/airports](#list-airports)                                                     | List airports                                           |
| [GET /places/airports/:id/permalinks](#list-all-locales-airport-permalinks)                | List all locales airport permalinks                     |
| [GET /places/districts/:id](#get-district)                                                 | Get district                                            |
| [GET /places/districts](#list-districts)                                                   | List districts                                          |
| [GET /places/districts/popular/hotels](#list-popular-districts-for-hotels)                 | List Popular Districts for Hotels                       |
| [GET /places/cities/:id](#get-city)                                                        | Get city                                                |
| [GET /places/v2/cities/:code](#v2-get-city)                                                | Get city by code                                        |
| [GET /places/cities/:code/permalinks](#get-all-locales-of-city-permalinks)                 | Get all locales of city permalinks by code              |
| [GET /places/cities](#list-cities)                                                         | List cities                                             |
| [GET /places/cities/popular/flights](#list-popular-cities-for-flights)                     | List Popular Cities for Flights                         |
| [GET /places/v2/cities/popular/flights](#list-popular-cities-v2-for-flights)               | List Popular Cities for Flights                         |
| [GET /places/v2/cities/popular_countries/flights](#list-popular-countries-v2-for-flights)  | List Popular Countries for Flights                      |
| [GET /places/cities/popular/hotels](#list-popular-cities-for-hotels)                       | List Popular Cities for Hotels                          |
| [GET /places/cities/weather](#list-required-cities-monthly-weather)                        | List of cities required, monthly weather                |
| [GET /places/cities/:id/weather](#list-a-city-monthly-weather)                             | List City Monthly Weather                               |
| [GET /places/cities/:id/nearby_popular](#list-nearby-popular-cities)                       | List Cities Nearby Popular a city                       |
| [GET /places/cities/:id/attractions](#list-attractions-in-a-city)                          | List Attractions in a city                              |
| [GET /places/regions/:id](#get-region)                                                     | Get Regions                                             |
| [GET /places/regions](#list-regions)                                                       | List Regions                                            |
| [GET /places/states/:id](#get-state)                                                       | Get state                                               |
| [GET /places/states](#list-countries)                                                      | List states                                             |
| [GET /places/countries/:id](#get-country)                                                  | Get country                                             |
| [GET /places/countries](#list-countries)                                                   | List countries                                          |
| [GET /places/countries/:country_code/permalinks](#get-all-locales-of-country-permalinks)   | List all locales of country permalinks                  |
| [GET /places/countries/popular/flights](#list-popular-countries-for-flights)               | List Popular Countries for Flights                      |
| [GET /places/countries/popular/hotels](#list-popular-countries-for-hotels)                 | List Popular Countries for Hotels                       |
| [GET /places/countries/:id/cities/](#list-cities-in-a-country)                             | List Cities in a country.                               |
| [GET /places/countries/:id/attractions](#list-attractions-in-a-country)                    | List Attractions in a country                           |
| [GET /places/countries/:id/cities/popular](#list-popular-cities-in-a-country)              | List Popular Cities in a Country                        |
| [GET /places/holidays](#query-holidays)                                                    | Query holidays                                          |
| [GET /places/v2/holidays](#v2-holidays)                                                    | List Holidays that are grouped                          |
| [GET /places/recommended_dates](#recommended-dates)                                        | List Recommended Dates for holiday                      |
| [GET /spots](#search-spots)                                                                | Search Spots                                            |
| [GET /places/cities/:id/headers](#list-city-headers)                                       | List city headers                                       |
| [GET /places/countries/:id/headers](#list-country-headers)                                 | List country headers                                    |
| [GET /places/attractions](#list-top-attractions)                                           | List top attractions based on bounding box              |
| [PATCH /places/attractions/:id](#update-attractions)                                       | Update attractions                                      |
| [GET /places/cities/:id/districts/popular/hotels/](#list-hotels-popular-districts-in-city) | List Hotels Popular Districts in City                   |
| [GET /places/cities/visa_free/flights](#list-visa-free-cities-for-flights)                 | List Visa Free Cities for Flights                       |
| [GET /places/countries/visa_free](#list-visa-free-countries)                               | List Visa Countries                                     |
| [GET /places/countries/visa_free/flights](#list-visa-free-countries-for-flights)           | List Visa Countries for Flights                         |
| [GET /places/cities/flights/themes](#list-cities-flights-for-themes)                       | List Cities Flights for Themes                          |
| [GET /places/cities/themes/:theme_id/flights](#list-cities-flights-for-a-theme)            | List Cities Flights for a Theme                         |
| [GET /places/explore](#explore-summary-api)                                                | Explore Summary Api                                     |
| [GET /places/cities/short_getaways](#weekend-getaway-cities)                               | Weekend Getaway Cities                                  |
| [GET /places/campaigns](#list-ongoing-featured-destination-campaigns)                      | List ongoing featured destination campaigns             |
| [GET /places/campaigns/:id](#get-featured-destination-campaign)                            | Get featured destination campaign                       |
| [GET /places/countries/cities/fares](#get-city-fares)                                      | Get city fares of an arrival country                    |
| [GET /places/v1/holiday_planner](#get-holiday-planner)                                     | Get Public Holidays & Recommended Dates for a site code |
| [GET /places/v1/events](#get-events)                                                       | List Trending Events                                    |
| [GET /places/v1/events/:id](#get-event-by-id)                                              | Get Trending Events by id                               |
| [GET /places/v1/themes/:id/cities](#get-cities-by-theme)                                   | Get Cities by Theme                                     |

## Get Airport

```
GET /places/airports/:id
```

### Example

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

---

## List Airports

```
GET /places/airports
```

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

### Examples

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

---

## List All Locales Airport Permalinks

```
GET /places/airports/:id/permalinks
```

### Examples

- `/places/airports/LLF/permalinks`

### Response

```
        {
	    "code": "LLF",
	    "permalinks": {
		"zh-cn": "yongzhoulingling",
		"en": "yongzhou-(lingling)-airport",
		"zh-tw": "yongzhou-(lingling)-airport",
		"id": "lingling",
		"fa": "yongzhou-(lingling)-airport",
		"ar": "yongzhou-(lingling)-airport",
		"th": "yongzhou-(lingling)-airport",
		"zh-hk": "yongzhou-(lingling)-airport",
		"tr": "yongzhou-(lingling)-airport",
		"hi": "yongzhou-(lingling)-airport"
    	     }
	}
```

---

## Get District

```
GET /places/districts/:id
```

### Example

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

---

## List Districts

```
GET /places/districts
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

### Examples

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

---

## List Popular Districts for Hotels

```
GET /places/districts/popular/hotels
```

### Parameters

| Param         | Required?                            | Data Type | Description                                                       |
| ------------- | ------------------------------------ | --------- | ----------------------------------------------------------------- |
| site_code     | No if country_code/code present      | String    | a site code                                                       |
| country_code  | No if site_code/code present         | String    | country code                                                      |
| code          | No if site_code/country_code present | String    | a site code or country code                                       |
| language      | No                                   | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No                                   | Number    | number of results to return. defaults to 20                       |
| page          | No                                   | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No                                   | String    | Format of json keys. `camelLower` or `underscore`                 |

### Examples

- `/places/districts/popular/hotels?country_code=SG&page=1&per_page=10`
- `/places/districts/popular/hotels?code=SG&page=1&per_page=10`
- `/places/districts/popular/hotels?site_code=SG`

### Response

```
    [
      {
        id: 2018,
        name: "Bukit Bintang",
        permalink: "bukit-bintang",
        locationId: 3907,
        districtId: 2018,
        districtName: "Bukit Bintang",
        districtPermalink: "bukit-bintang",
        cityId: 3907,
        cityCode: "KUL",
        cityName: "Kuala Lumpur",
        cityPermalink: "kuala-lumpur",
        countryId: 133,
        countryCode: "MY",
        countryName: "Malaysia",
        countryPermalink: "malaysia",
        worldRegionId: 2,
        worldRegionName: "Asia",
        worldRegionPermalink: "asia",
        worldRegionCode: "i",
        lat: 3.14568,
        long: 101.712,
        type: "district",
        hotelCount: 402,
        stationType: "district",
        enName: "Bukit Bintang",
        enPermalink: "bukit-bintang",
        districtEnName: "Bukit Bintang",
        districtEnPermalink: "bukit-bintang",
        cityEnName: "Kuala Lumpur",
        cityEnPermalink: "kuala-lumpur",
        worldRegionEnName: "Asia",
        worldRegionEnPermalink: "asia",
        countryEnName: "Malaysia",
        countryEnPermalink: "malaysia",
        hotelsPopularCurrentRank: 1 --  rank of this week
      },{
        id: 2018,
        name: "Bukit Bintang",
        permalink: "bukit-bintang",
        locationId: 3907,
        districtId: 2018,
        districtName: "Bukit Bintang",
        districtPermalink: "bukit-bintang",
        cityId: 3907,
        cityCode: "KUL",
        cityName: "Kuala Lumpur",
        cityPermalink: "kuala-lumpur",
        countryId: 133,
        countryCode: "MY",
        countryName: "Malaysia",
        countryPermalink: "malaysia",
        worldRegionId: 2,
        worldRegionName: "Asia",
        worldRegionPermalink: "asia",
        worldRegionCode: "i",
        lat: 3.14568,
        long: 101.712,
        type: "district",
        hotelCount: 402,
        stationType: "district",
        enName: "Bukit Bintang",
        enPermalink: "bukit-bintang",
        districtEnName: "Bukit Bintang",
        districtEnPermalink: "bukit-bintang",
        cityEnName: "Kuala Lumpur",
        cityEnPermalink: "kuala-lumpur",
        worldRegionEnName: "Asia",
        worldRegionEnPermalink: "asia",
        countryEnName: "Malaysia",
        countryEnPermalink: "malaysia",
        hotelsPopularCurrentRank: 2
      },
      ...
    ]
```

---

## Get City

```
GET /places/cities/:id
```

### Example

- `/places/cities/6667`

### Response

```
{
  "id": 6667,
  "code": "SIN",
  "name": "Singapore",
  "permalink": "singapore",
  "cityId": 6667,
  "cityCode": "SIN",
  "cityName": "Singapore",
  "cityPermalink": "singapore",
  "worldRegionId": 2,
  "worldRegionName": "Asia",
  "worldRegionPermalink": "asia",
  "worldRegionCode": "i",
  "countryId": 197,
  "countryName": "Singapore",
  "countryPermalink": "singapore",
  "countryCode": "SG",
  "lat": 1.35208,
  "long": 103.82,
  "type": "city",
  "hotelCount": 777,
  "airportCount": 1,
  "timeZone": "+08:00",
  "stationType": "city",
  "enName": "Singapore",
  "enPermalink": "singapore",
  "cityEnName": "Singapore",
  "cityEnPermalink": "singapore",
  "worldRegionEnName": "Asia",
  "worldRegionEnPermalink": "asia",
  "countryEnName": "Singapore",
  "countryEnPermalink": "singapore",
  "description": "Cultural melting pot. Garden City. Foodie Paradise. Prosperous and innovative, Singapore punches well above its weight.",
  "themes": [
    {
      "id": 13,
      "name": "Romantic",
      "permalink": "romantic",
      "type": "theme",
      "themeId": 13
    },
    ...
  ]
}
```

---

## Get All Locales of City Permalinks

```
GET /places/cities/:code/permalinks
```

### Parameters

| Param | Required? | Data Type | Description |
| ----- | --------- | --------- | ----------- |
| code  | Yes       | String    | City Code   |

### Example

- `/places/cities/sin/permalinks`

### Response

```
{
    "city-code": "SIN",
    "permalinks": {
        "en": "singapore",
        "ms": "singapura",
        "zh-cn": "singapore",
        "id": "singapura",
        "fa": "singapore",
        "fr": "singapour",
        "ko": "singapore",
        "th": "singapore",
        "ja": "singapore",
        "zh-hk": "singapore",
        "zh-tw": "singapore",
        "es": "singapur",
        "de": "singapur",
        "ru": "singapore",
        "pl": "singapur",
        "tr": "singapur",
        "pt": "cingapura",
        "ar": "singapore",
        "pt-br": "singapore",
        "es-419": "singapore",
        "sv": "singapore",
        "zh": "singapore",
        "it": "singapore",
        "nl": "singapore",
        "hi": "singapore"
    }
}
```

---

## V2 Get City

```
GET /places/cities/:code
```

### Parameters

| Param         | Required? | Data Type | Description                                                                |
| ------------- | --------- | --------- | -------------------------------------------------------------------------- |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default          |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. `camelLower` as default |

### Example

- `/places/v2/cities/SIN`

### Response

```
{
  "city": {
    "id": 6667,
    "code": "SIN",
    "name": "Singapore",
    "permalink": "singapore",
    "cityId": 6667,
    "cityCode": "SIN",
    "cityName": "Singapore",
    "cityPermalink": "singapore",
    "worldRegionId": 2,
    "worldRegionName": "Asia",
    "worldRegionPermalink": "asia",
    "worldRegionCode": "i",
    "countryId": 197,
    "countryName": "Singapore",
    "countryPermalink": "singapore",
    "countryCode": "SG",
    "regionId": 411,
    "regionName": "Singapore",
    "regionPermalink": "singapore",
    "lat": 1.35208,
    "long": 103.82,
    "type": "city",
    "hotelCount": 772,
    "airportCount": 1,
    "timeZone": "+08:00",
    "stationType": "city",
    "ianaTimeZone": "Asia/Singapore",
    "enName": "Singapore",
    "enPermalink": "singapore",
    "cityEnName": "Singapore",
    "cityEnPermalink": "singapore",
    "worldRegionEnName": "Asia",
    "worldRegionEnPermalink": "asia",
    "countryEnName": "Singapore",
    "countryEnPermalink": "singapore",
    "description": "Singapore is much more than the sum of its numerous attractions..",
    "themes": [{
        "id": 13,
        "name": "Romantic",
        "permalink": "romantic",
        "type": "theme",
        "themeId": 13,
        "imageUrls": [
          "http://assets.wego.com/image/upload/v1551758807/themes/staging/romantic/Romantic_1_ellztj.jpg",
          "http://assets.wego.com/image/upload/v1551758816/themes/staging/romantic/Romantic_2_vkl78o.jpg",
          "http://assets.wego.com/image/upload/v1551758823/themes/staging/romantic/Romantic_3_m6tbcq.jpg"
        ]
      }
      ...
    ]
  }
}
```

---

## List Cities

```
GET /places/cities
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

### Examples

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

---

## List Popular Cities for Flights

```
GET /places/cities/popular/flights
```

### Parameters

| Param         | Required?                | Data Type | Description                                                                                                                        |
| ------------- | ------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| city_code     | Yes (if no country_code) | String    | IATA city code. The city origin from which the popular destination cities to based on.                                             |
| site_code     | Yes (if no city_code)    | String    | Country code. The country origin from which the popular destination cities to based on.                                            |
| city_type     | No                       | String    | The type of cities returned. `departure` or `arrival`. <br /> defaults to `arrival`. Works only on popular flights by `site_code`. |
| language      | No                       | String    | The language that the response will be in. <br /> `en` as default                                                                  |
| per_page      | No                       | Number    | number of results to return. defaults to 20                                                                                        |
| page          | No                       | Number    | the page to return for multiple page results. defaults to 1                                                                        |
| key_transform | No                       | String    | Format of json keys. `camelLower` or `underscore`                                                                                  |
| geoType       | No                       | String    | Possible values are: `domestic`, `international`, `all` (the method will return `international` if no value specified)             |
| currencyCode  | No                       | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format                               |

### Changelog

05/07/2018: Implement _Preferred Cities_ option based on `site_code`. This adds the ability to include cities in the results even if it is not popular. Ex: SG to include Macau in popular.

### Examples

- `/places/cities/popular/flights?site_code=SG&per_page=10`
- `/places/cities/popular/flights?site_code=SA&geoType=all`

### Response

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

---

## List Popular Cities v2 for Flights

```
GET /places/v2/cities/popular/flights
```

### Parameters

| Param                   | Required?                          | Data Type               | Description                                                                                                            |
| ----------------------- | ---------------------------------- | ----------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| departure_city_code     | Yes (if no departure_country_code) | String                  | IATA city code. The city origin from which the popular destination cities to based on.                                 |
| departure_country_code  | Yes (if no departure_city_code)    | String                  | Country code. The country origin from which the popular destination cities to based on.                                |
| trip_type               | Yes                                | ['oneway', 'roundtrip'] | type of trip                                                                                                           |
| trip_duration_min       | No                                 | Number                  | filter with minimum trip duration (>=0)                                                                                |
| trip_duration_max       | No                                 | Number                  | filter with maximum trip duration (>=0)                                                                                |
| departure_month         | No                                 | String [yyyy-mm]        | filter with trip departure_month                                                                                       |
| arrival_country_code    | No                                 | String                  | filter popular cities based on arrival country                                                                         |
| arrival_world_region_id | No                                 | Number                  | filter popular cities based on arrival world region                                                                    |
| departure_date          | No                                 | String[yyyy-mm-dd]      | date of departure                                                                                                      |
| return_date             | No                                 | String[yyyy-mm-dd]      | date of return                                                                                                         |
| language                | No                                 | String                  | The language that the response will be in. <br /> `en` as default                                                      |
| per_page                | No                                 | Number                  | number of results to return. defaults to 20                                                                            |
| page                    | No                                 | Number                  | the page to return for multiple page results. defaults to 1                                                            |
| key_transform           | No                                 | String                  | Format of json keys. `camelLower` or `underscore`                                                                      |
| geo_type                | No                                 | String                  | Possible values are: `domestic`, `international`, `all` (the method will return `international` if no value specified) |
| currency_code           | No                                 | String                  | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format                   |

### Examples

- `/places/v2/cities/popular/flights?city_code=CAI&page=2&per_page=2&trip_type=roundtrip&departure_month=2019-10&trip_duration_min=1&trip_duration_max=15&currency_code=SGD`

### Response

```
[
    {
        "id": 2976,
        "code": "HRG",
        "name": "Hurghada",
        "permalink": "hurghada",
        "cityId": 2976,
        "cityCode": "HRG",
        "cityName": "Hurghada",
        "cityPermalink": "hurghada",
        "worldRegionId": 1,
        "worldRegionName": "Africa",
        "worldRegionPermalink": "africa",
        "worldRegionCode": "f",
        "countryId": 64,
        "countryName": "Egypt",
        "countryPermalink": "egypt",
        "countryCode": "EG",
        "regionId": 35,
        "regionName": "Red Sea Coast",
        "regionPermalink": "red-sea-coast",
        "lat": 27.2579,
        "long": 33.8116,
        "type": "city",
        "hotelCount": 466,
        "airportCount": 1,
        "timeZone": "+02:00",
        "stationType": "city",
        "ianaTimeZone": "Africa/Cairo",
        "enName": "Hurghada",
        "enPermalink": "hurghada",
        "cityEnName": "Hurghada",
        "cityEnPermalink": "hurghada",
        "worldRegionEnName": "Africa",
        "worldRegionEnPermalink": "africa",
        "countryEnName": "Egypt",
        "countryEnPermalink": "egypt",
        "cheapestPrice": {
            "amount": 129.98,
            "amountUsd": 94.39,
            "currencyCode": "SGD",
            "departureDate": "2019-10-20",
            "returnDate": "2019-10-30"
        }
    },
    {
        "id": 321,
        "code": "HBE",
        "name": "Alexandria",
        "permalink": "alexandria",
        "cityId": 321,
        "cityCode": "HBE",
        "cityName": "Alexandria",
        "cityPermalink": "alexandria",
        "worldRegionId": 1,
        "worldRegionName": "Africa",
        "worldRegionPermalink": "africa",
        "worldRegionCode": "f",
        "countryId": 64,
        "countryName": "Egypt",
        "countryPermalink": "egypt",
        "countryCode": "EG",
        "regionId": 34,
        "regionName": "Alexandria - Mediterranean Coast",
        "regionPermalink": "alexandria-mediterranean-coast",
        "lat": 31.2001,
        "long": 29.9187,
        "type": "city",
        "hotelCount": 158,
        "airportCount": 1,
        "timeZone": "+02:00",
        "stationType": "city",
        "ianaTimeZone": "Africa/Cairo",
        "enName": "Alexandria",
        "enPermalink": "alexandria",
        "cityEnName": "Alexandria",
        "cityEnPermalink": "alexandria",
        "worldRegionEnName": "Africa",
        "worldRegionEnPermalink": "africa",
        "countryEnName": "Egypt",
        "countryEnPermalink": "egypt",
        "cheapestPrice": {
            "amount": 139.44,
            "amountUsd": 101.25,
            "currencyCode": "SGD",
            "departureDate": "2019-10-16",
            "returnDate": "2019-10-20"
        }
    }
]
```

---

## List Popular Countries v2 for Flights

```
GET /places/v2/cities/popular_countries/flights
```

### Parameters

| Param               | Required?                          | Data Type | Description                                                                            |
| ------------------- | ---------------------------------- | --------- | -------------------------------------------------------------------------------------- |
| departure_city_code | Yes (if no departure_country_code) | String    | IATA city code. The city origin from which the popular destination cities to based on. |
| locale              | No                                 | String    | The language that the response will be in. <br /> `en` as default                      |
| per_page            | No                                 | Number    | number of results to return. defaults to 20                                            |
| page                | No                                 | Number    | the page to return for multiple page results. defaults to 1                            |
| key_transform       | No                                 | String    | Format of json keys. `camelLower` or `underscore`                                      |

### Examples

- `/places/v2/cities/popular_countries/flights?departure_city_code=IST&page=1&per_page=3`

### Response

```
[
    {
        "id": 223,
        "code": "TR",
        "name": "Turkey",
        "permalink": "turkey",
        "countryId": 223,
        "countryCode": "TR",
        "countryName": "Turkey",
        "countryPermalink": "turkey",
        "lat": 39.0684,
        "long": 35.1874,
        "type": "country",
        "airportCount": 55,
        "stationType": "country",
        "keyCityCode": "IST",
        "enName": "Turkey",
        "enPermalink": "turkey",
        "countryEnName": "Turkey",
        "countryEnPermalink": "turkey"
    },
    {
        "id": 192,
        "code": "SA",
        "name": "Saudi Arabia",
        "permalink": "saudi-arabia",
        "countryId": 192,
        "countryCode": "SA",
        "countryName": "Saudi Arabia",
        "countryPermalink": "saudi-arabia",
        "lat": 24.2481,
        "long": 45.1286,
        "type": "country",
        "airportCount": 27,
        "stationType": "country",
        "keyCityCode": "JED",
        "enName": "Saudi Arabia",
        "enPermalink": "saudi-arabia",
        "countryEnName": "Saudi Arabia",
        "countryEnPermalink": "saudi-arabia"
    },
    {
        "id": 64,
        "code": "EG",
        "name": "Egypt",
        "permalink": "egypt",
        "countryId": 64,
        "countryCode": "EG",
        "countryName": "Egypt",
        "countryPermalink": "egypt",
        "lat": 26.8249,
        "long": 30.7873,
        "type": "country",
        "airportCount": 11,
        "stationType": "country",
        "keyCityCode": "CAI",
        "enName": "Egypt",
        "enPermalink": "egypt",
        "countryEnName": "Egypt",
        "countryEnPermalink": "egypt"
    }
]
```

---

## List Popular Cities for Hotels

```
GET /places/cities/popular/hotels
```

### Parameters

| Param         | Required? | Data Type | Description                                                                                                        |
| ------------- | --------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| site_code     | Yes       | String    | Site code                                                                                                          |
| country_code  | No        | String    | Country code                                                                                                       |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default                                                  |
| per_page      | No        | Number    | number of results to return. defaults to 20                                                                        |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1                                                        |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                                                                  |
| domestic      | No        | Boolean   | True would return only cities within the same country ( based from country_code or the country of the city `code`) |

### Changelog

05/07/2018: Implement _Preferred Cities_ option based on `country_code`. This adds the ability to include cities in the results even if it is not popular. Ex: SG to include Macau in popular.

### Examples

- `/places/cities/popular/hotels?site_code=SG&per_page=10`
- `/places/cities/popular/hotels?site_code=SA&domestic=true`

### Response

```
    [ ...,
      {
        "id": 4254,
        "code": "LON",
        "name": "London",
        "permalink": "london",
        "cityId": 4254,
        "cityCode": "LON",
        "cityName": "London",
        "cityPermalink": "london",
        "worldRegionId": 4,
        "worldRegionName": "Europe",
        "worldRegionPermalink": "europe",
        "worldRegionCode": "e",
        "countryId": 230,
        "countryName": "United Kingdom",
        "countryPermalink": "united-kingdom",
        "countryCode": "GB",
        "regionId": 55, (*)
        "regionName": "Greater London", (*)
        "regionPermalink": "greater-london", (*)
        "lat": 51.5074,
        "long": -0.127758,
        "type": "city",
        "hotelCount": 7949,
        "airportCount": 6,
        "timeZone": "+00:00",
        "stationType": "city",
        "enName": "London",
        "enPermalink": "london",
        "cityEnName": "London",
        "cityEnPermalink": "london",
        "worldRegionEnName": "Europe",
        "worldRegionEnPermalink": "europe",
        "countryEnName": "United Kingdom",
        "countryEnPermalink": "united-kingdom",
        "hotelsPopularCurrentRank": 2,
        "hotelsPopularLastRank": 4
      },
      ...
    ]
```

(\*) if the city belongs to a region.

## Get Region

```
GET /places/regions/:id
```

### Examples

- `/places/regions/2`

### Response

```
      {
        "id": 2,
        "name": "Tabanan Regency",
        "permalink": "tabanan-regency",
        "regionId": 2,
        "regionName": "Tabanan Regency",
        "regionPermalink": "tabanan-regency",
        "countryId": 102,
        "countryCode": "ID",
        "countryName": "Indonesia",
        "countryPermalink": "indonesia",
        "worldRegionId": 2,
        "worldRegionName": "Asia",
        "worldRegionCode": "i",
        "worldRegionPermalink": "asia",
        "lat": -8.51541,
        "long": 115.079,
        "type": "region",
        "stationType": "region",
        "enName": "Tabanan Regency",
        "enPermalink": "tabanan-regency",
        "regionEnName": "Tabanan Regency",
        "regionEnPermalink": "tabanan-regency",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "Indonesia",
        "countryEnPermalink": "indonesia"
      }
```

---

## List Regions

```
GET /places/regions
```

### Parameters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| country_code  | No        | String    | Coutry code                                                       |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

### Examples

- `/places/regions?country_code=US&page=1&per_page=10`
- `/places/regions?permalinks[]=los-angeles-county`

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

---

## Get State

```
GET /places/states/:id
```

### Example

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

---

## List States

```
GET /places/states
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

### Examples

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

---

## Get Country

```
GET /places/countries/:id
```

### Example

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

---

## List Countries

```
GET /places/countries
```

### Paremeters

| Param         | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| codes         | No        | Array     | list of country codes                                             |
| permalinks    | No        | Array     | list of permalinks                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page      | No        | Number    | number of results to return. defaults to 20                       |
| page          | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

### Examples

- `/places/countries?codes[]=SG`
- `/places/countries?codes[]=SG&codes[]=MY`
- `/places/countries?permalinks[]=singapore`
- `/places/countries?codes[]=SG&language=ar`

### Response 200

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

---

## Get All Locales of Country Permalinks

```
GET /places/countries/country_code/permalinks
```

### Parameters

| Param        | Required? | Data Type | Description |
| ------------ | --------- | --------- | ----------- |
| country_code | Yes       | String    | Coutry code |

### Example

- `/places/countries/AX/permalinks`

### Response

```
{
   "code": "AX",
   "permalinks": {
       "en": "aland-islands",
       "ms": "aland-islands",
       "zhCn": "aland-islands",
       "id": "kepulauan-land",
       "fa": "aland-islands",
       "fr": "aland-islands",
       "ko": "aland-islands",
       "vi": "aland-islands",
       "th": "aland-islands",
       "ja": "aland-islands",
       "zhHk": "aland-islands",
       "zhTw": "aland-islands",
       "es": "aland-islands",
       "de": "aland-islands",
       "it": "aland-islands",
       "ru": "aland-islands",
       "ptBr": "aland-islands",
       "nl": "aland-islands",
       "pl": "aland-islands",
       "sv": "aland-islands",
       "tr": "aland-islands",
       "pt": "aland-islands",
       "es419": "aland-islands",
       "ar": "aland-islands",
       "hi": "aland-islands"
   }
}
```

---

## List Popular Countries for Flights

```
GET /places/countries/popular/flights
```

### Parameters

| Param         | Required? | Data Type | Description                                                                                          |
| ------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| site_code     | No        | Array     | list of country codes                                                                                |
| language      | No        | String    | The language that the response will be in. <br /> `en` as default                                    |
| per_page      | No        | Number    | number of results to return. defaults to 10                                                          |
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

---

## List Popular Countries for Hotels

```
GET /places/countries/popular/hotels
```

### Parameters

| Param          | Required? | Data Type | Description                                                       |
| -------------- | --------- | --------- | ----------------------------------------------------------------- |
| site_code      | No        | Array     | list of country codes                                             |
| language       | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page       | No        | Number    | number of results to return. defaults to 20                       |
| page           | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform  | No        | String    | Format of json keys. `camelLower` or `underscore`                 |
| include_itself | No        | Boolean   | Include the country with code as site_code in finding logic       |

### Examples

- `/places/countries/popular/hotels?site_code=SA&per_page=11&language=ar&include_itself=true`
- `/places/countries/popular/hotels?site_code=VN&include_itself=true`

### Response

```
    [
      {
        id: 237,
        code: "VN",
        name: "Vietnam",
        permalink: "vietnam",
        countryId: 237,
        countryCode: "VN",
        countryName: "Vietnam",
        countryPermalink: "vietnam",
        worldRegionId: 2,
        worldRegionName: "Asia",
        worldRegionCode: "i",
        worldRegionPermalink: "asia",
        lat: 16.6475,
        long: 111.309,
        type: "country",
        airportCount: 22,
        stationType: "country",
        keyCityCode: "SGN",
        currencyCode: "VND",
        hotelsPopularCurrentRank: 1,  -- rank of this week
        hotelsPopularLastRank: 1,  -- rank of last week
        enName: "Vietnam",
        enPermalink: "vietnam",
        worldRegionEnName: "Asia",
        worldRegionEnPermalink: "asia",
        countryEnName: "Vietnam",
        countryEnPermalink: "vietnam"
      },{
        id: 216,
        code: "TH",
        name: "Thailand",
        permalink: "thailand",
        countryId: 216,
        countryCode: "TH",
        countryName: "Thailand",
        countryPermalink: "thailand",
        worldRegionId: 2,
        worldRegionName: "Asia",
        worldRegionCode: "i",
        worldRegionPermalink: "asia",
        lat: 15.1138,
        long: 101.012,
        type: "country",
        airportCount: 34,
        stationType: "country",
        keyCityCode: "BKK",
        currencyCode: "THB",
        hotelsPopularCurrentRank: 2,
        hotelsPopularLastRank: 2,
        enName: "Thailand",
        enPermalink: "thailand",
        worldRegionEnName: "Asia",
        worldRegionEnPermalink: "asia",
        countryEnName: "Thailand",
        countryEnPermalink: "thailand"
      },
      ...
    ]
```

---

## List Popular Cities in a Country

```
GET /places/countries/:id/cities/popular
```

### Changelog

17/08/18: Updated hotelcount to this api for NTO page to display number of hotel for per popular city.

### Logic

1. Calls /places/cities/popular/hotels with `domestic=true` passed in.
2. If results return is >= 10, will return.
3. If less than 10, will append from flights popular results that are not already in hotels.

Reason of priority from `/places/cities/popular/hotels`: If we were to take from flights, it is only for cities with airports return. One example would be `jeddah`, mecca is a popular city but it does not get returned due to no airports in the city. Hence, hotels would be a better choice as it accounts all cities - with or without airports.

### Parameters

| Param           | Required? | Data Type | Description                                                       |
| --------------- | --------- | --------- | ----------------------------------------------------------------- |
| language/locale | No        | String    | The language that the response will be in. <br /> `en` as default |
| per_page        | No        | Number    | number of results to return. defaults to 10                       |
| page            | No        | Number    | the page to return for multiple page results. defaults to 1       |
| key_transform   | No        | String    | Format of json keys. `camelLower` or `underscore`                 |

### Response

`/places/countries/14/cities/popular`

```
[
  {
    "name": "Melbourne",
    "cityId": 4534,
    "cityCode": "MEL",
    "description": "Beautiful place",
    "hotelCount": 145
  },
  {
    "name": "Sydney",
    "cityId": 7046,
    "cityCode": "SYD"
  },
  {
   "name": "Gold Coast",
   "cityId": 5518,
   "cityCode": "OOL"
  },
  ...
]
```

---

## List Attractions In A Country

```
GET /places/countries/:id/attractions
```

### Logic

Sort by rating desc.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale        | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page      | No        | Integer   | Number of result return. Default set to 20.                              |
| page          | No        | Integer   | Page number for result.                                                  |

### Example

`/places/countries/230/attractions`

```
[
  {
    "name": "Big Ben",
    "perex": "The most famous bell in Europe, perhaps even in the world, Big Ben, is one of the iconic landmarks of London.",
    "latitude": 51.5007,
    "longitude": -0.124584,
    "thumbnailUrl": "https://assets.wego.com/image/upload/v1538974846/sygic/attractions/thumbnail_url/12023.jpg",
    "cityCode": "LON",
    "countryCode": "GB",
    "cityName": "London",
    "countryName": "United Kingdom"
  },
  {
    "name": "Buckingham Palace",
    "perex": "This majestic palace is the official residence of British monarchs and is usually recognized as a symbol of UK's monarchy. ",
    "latitude": 51.5008,
    "longitude": -0.142525,
    "thumbnailUrl": "https://assets.wego.com/image/upload/v1539007719/sygic/attractions/thumbnail_url/78076.jpg",
    "cityCode": "LON",
    "countryCode": "GB",
    "cityName": "London",
    "countryName": "United Kingdom"
  },
```

---

## Query Holidays

```
GET /places/holidays
```

### Parameters

| Param      | Required? | Data Type | Description                                                        |
| ---------- | --------- | --------- | ------------------------------------------------------------------ |
| site_code  | Yes       | String    | 2 letter code for the Point of Sale                                |
| start_date | No        | String    | Start date in YYYY-MM-DD format. Defaults to current date.         |
| end_date   | No        | String    | End date in YYYY-MM-DD format. Defaults to +1 year of `start_date` |
| language   | No        | String    | The language the respond will be translated into. eg 'ID','TH'..   |
| per_page   | No        | Integer   | default is 20                                                      |
| page       | No        | Integer   | default is 1                                                       |

### Examples

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

---

## V2 Holidays

```
GET places/v2/holidays
```

### Description

Return holidays that are consecutive dates with the name and key as the first day of holiday.

### Parameters

| Param      | Required? | Data Type | Description                                                        |
| ---------- | --------- | --------- | ------------------------------------------------------------------ |
| site_code  | Yes       | String    | 2 letter code for the Point of Sale                                |
| start_date | No        | String    | Start date in YYYY-MM-DD format. Defaults to current date.         |
| end_date   | No        | String    | End date in YYYY-MM-DD format. Defaults to +1 year of `start_date` |
| language   | No        | String    | The language the respond will be translated into. eg 'ID','TH'..   |
| per_page   | No        | Integer   | default is 10                                                      |
| page       | No        | Integer   | default is 1                                                       |

### Example

`/places/v2/holidays?site_code=SG`

### Examples

- `/places/holidays?site_code=SG`
- `/places/holidays?site_code=SG&start_date=2019-03-01`
- `/places/holidays?site_code=SG&start_date=2019-03-01&end_date=2019-05-15`
- `/places/holidays?site_code=SG&end_date=2019-05-15`

### Response

```
{
    "publicHolidays": [
        {
            "name": "Labour Day",
            "key": "labour_day",
            "startDate": "2019-05-01",
            "endDate": "2019-05-01"
        },
        {
            "name": "Vesak Day",
            "key": "vesak_day",
            "startDate": "2019-05-19",
            "endDate": "2019-05-20"
        },
        {
            "name": "Hari Raya Puasa",
            "key": "hari_raya_puasa",
            "startDate": "2019-06-05",
            "endDate": "2019-06-05"
        },
        {
            "name": "National Day",
            "key": "national_day",
            "startDate": "2019-08-09",
            "endDate": "2019-08-09"
        },
        {
            "name": "Hari Raya Haji",
            "key": "hari_raya_haji",
            "startDate": "2019-08-11",
            "endDate": "2019-08-12"
        },
        {
            "name": "Diwali/Deepavali",
            "key": "diwali_deepavali",
            "startDate": "2019-10-27",
            "endDate": "2019-10-28"
        }
    ]
}
```

---

## Recommended Dates

```
GET places/recommended_dates
```

### Description / Logic

Relevant ticket logic here: https://wegomushi.atlassian.net/browse/BE-2309

### CHANGELOG

08/03/2019 : Based on public holiday.

### Parameters

| Param      | Required? | Data Type | Description                                                        |
| ---------- | --------- | --------- | ------------------------------------------------------------------ |
| site_code  | Yes       | String    | 2 letter code for the Point of Sale                                |
| start_date | No        | String    | Start date in YYYY-MM-DD format. Defaults to current date.         |
| end_date   | No        | String    | End date in YYYY-MM-DD format. Defaults to +1 year of `start_date` |
| language   | No        | String    | The language the respond will be translated into. eg 'ID','TH'..   |

### Example

`/places/recommended_dates`

### Examples

- `/places/recommended_dates?site_code=SG`
- `/places/recommended_dates?site_code=SG&start_date=2019-03-01`
- `/places/recommended_dates?site_code=SG&start_date=2019-03-01&end_date=2019-05-15`
- `/places/recommended_dates?site_code=SG&end_date=2019-05-15`

### Response

```
[
    {
        "startDate": "2019-05-18",
        "endDate": "2019-05-20"
    },
    {
        "startDate": "2019-06-05",
        "endDate": "2019-06-09"
    },
    {
        "startDate": "2019-08-09",
        "endDate": "2019-08-12"
    },
    {
        "startDate": "2019-10-26",
        "endDate": "2019-10-28"
    }
]
```

---

## Search Spots

```
GET /spots
```

### Parameters

| Property   | Required? | Data Type | Description                                                     |
| ---------- | --------- | --------- | --------------------------------------------------------------- |
| locale     | No        | String    | The language that the response will be in. <br /> en as default |
| latitude   | Yes       | Number    | Latitude                                                        |
| longitude  | Yes       | Number    | Longitude                                                       |
| radius     | No        | Number    | Radius in KM. Default = 10. Max 25.                             |
| categories | No        | Array     | valid values: `attraction`, `food`, `entertainment`, `shop`     |

### Response

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

## List Required Cities Monthly Weather

```
GET /places/cities/weather
```

### Logic

API will be getting data from `location_monthly_weather` table.

> Location monthly weather table consist of location_id, month, min_temperature, max_temperature, source. Temperature is in units of celcius.

If city_ids is not given, returns empty array `[]`

Returns a list of cities weather based on the country.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| city_ids      | Yes       | Array     | list of city id that weather is required                                 |

### Example

`/places/cities/weather?city_ids[]=6&city_ids[]=20&key_transform=underscore`

```
[
    {
        "city_id": 6,
        "month": 1,
        "min_temperature": 19.9,
        "max_temperature": 32.1
    },
    {
        "city_id": 6,
        "month": 2,
        "min_temperature": 19.4,
        "max_temperature": 32.6
    },
    {
        "city_id": 6,
        "month": 3,
        "min_temperature": 18.4,
        "max_temperature": 28.6
    },
    {
        "city_id": 6,
        "month": 4,
        "min_temperature": 15.6,
        "max_temperature": 26
    },
    {
        "city_id": 6,
        "month": 5,
        "min_temperature": 12.2,
        "max_temperature": 23.8
    },
    {
        "city_id": 6,
        "month": 6,
        "min_temperature": 10.4,
        "max_temperature": 19.7
    },
    {
        "city_id": 6,
        "month": 7,
        "min_temperature": 9.2,
        "max_temperature": 20.5
    },
    {
        "city_id": 6,
        "month": 8,
        "min_temperature": 10,
        "max_temperature": 23.6
    },
    {
        "city_id": 6,
        "month": 9,
        "min_temperature": 12.6,
        "max_temperature": 27.7
    },
    {
        "city_id": 6,
        "month": 10,
        "min_temperature": 14.6,
        "max_temperature": 26.8
    },
    {
        "city_id": 6,
        "month": 11,
        "min_temperature": 17.2,
        "max_temperature": 29.7
    },
    {
        "city_id": 6,
        "month": 12,
        "min_temperature": 18.4,
        "max_temperature": 31.8
    },
    {
        "city_id": 20,
        "month": 1,
        "min_temperature": 16.7,
        "max_temperature": 28.6
    },

```

## List A City Monthly Weather

```
GET /places/cities/:city_id/weather
```

### Logic

API will be getting data from `location_monthly_weather` table.

> Location monthly weather table consist of location_id, month, min_temperature, max_temperature, source. Temperature is in units of celcius.

Returns list of city weather.

If city weather is not found, returns empty array `[]`.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |

### Example

`/cities/14/weather`

```
[
  {
    "cityId":14
    "month": 1,
    "minTemperature": 22.3,
    "maxTemperature": 30.1
  },
  {
    "cityId":14
    "month": 2,
    "minTemperature": 20.4,
    "maxTemperature": 32.9
  },
  ...
]

```

## List Nearby Popular Cities

```
GET /places/cities/:city_id/nearby_popular
```

### Logic

City will join `hotels_popular_cities` table on destination_city_code with sum(score) and group by destination_city_code. Filtered by cities that are 1000km around that city.
Lastly, sort by `score/distance` in descending order to get popular nearby.

Will return empty array if no such cities found. i.e. no cities within 1000km or in hotels_popular_cities table.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale        | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page      | No        | Integer   | Number of result return. Default set to 10.                              |
| page          | No        | Integer   | Page number for result.                                                  |

### Example

`/cities/6667/nearby_popular`

```
[
    {
        "name": "Port Dickson",
        "cityId": 19561,
        "cityCode": "10937"
    },
    {
        "name": "Petaling Jaya",
        "cityId": 39289,
        "cityCode": "85022"
    },
    {
        "name": "Singapore",
        "cityId": 6667,
        "cityCode": "SIN",
        "description": "english city description"
    },
    ...
]
```

---

## List Attractions In A City

```
GET /places/cities/:id/attractions
```

### Logic

Sort by rating desc.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale        | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page      | No        | Integer   | Number of result return. Default set to 20.                              |
| page          | No        | Integer   | Page number for result.                                                  |

### Example

`/places/cities/6667/attractions`

```
[
  {
    "name": "Gardens by the Bay",
    "perex": "This huge garden complex featuring the futuristic Supertrees is a reason in itself to visit Singapore.",
    "latitude": 1.28129,
    "longitude": 103.864,
    "thumbnailUrl": "https://assets.wego.com/image/upload/v1539067718/sygic/attractions/thumbnail_url/102715.jpg",
    "cityCode": "SIN",
    "countryCode": "SG",
    "cityName": "Singapore",
    "countryName": "Singapore"
  },
  {
    "name": "Merlion Park",
    "perex": "This park is notable especially because it holds the iconic landmark and \"mascot\" of Singapore: Merlion, a mythical half-lion, half-fish…",
    "latitude": 1.28697,
    "longitude": 103.855,
    "thumbnailUrl": "https://assets.wego.com/image/upload/v1539061992/sygic/attractions/thumbnail_url/90913.jpg",
    "cityCode": "SIN",
    "countryCode": "SG",
    "cityName": "Singapore",
    "countryName": "Singapore"
  },
  ...
]
```

---

## List City Headers

```
GET /places/cities/:id/headers
```

### Logic

First checking if a city is existing or not using id. If yes, return headers of that city. Otherwise, return 404.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale        | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page      | No        | Integer   | Number of result return. Default set to 10.                              |
| page          | No        | Integer   | Page number for result.                                                  |

### Example

`/places/countries/197/headers`

```
[
  {
    bannerUrl: "https://assets.wego.com/image/upload/v1531908897/destination_headers/locations/banners/bbceluo1nmk2heegcxzf.jpg",
    title: "Melbourne, Victoria",
    description: "<p>An urban city of its own&nbsp;</p>",
    caption: "City ",
    subcaption: "City Center"
  },
  {
    bannerUrl: "https://assets.wego.com/image/upload/v1531910819/destination_headers/locations/banners/wiprk7gvm7xyhnwudzkv.jpg",
    title: "Melbourne, Victoria",
    description: "<p>An urban city of its own&nbsp;</p>",
    caption: "Brighton Beach",
    subcaption: "City Center"
  },
  {
    bannerUrl: "https://assets.wego.com/image/upload/v1531908145/destination_headers/locations/banners/wev1lp8q3cayro2dtlzi.webp",
    title: "Melbourne, Victoria",
    logoUrl: "https://assets.wego.com/image/upload/v1531908155/destination_headers/locations/logos/qeku8vapxkdfh2vclggr.jpg",
    description: "<p>An urban city of its own&nbsp;</p>",
    caption: "City ",
    subcaption: "City Center"
  }
]
```

## List Country Headers

```
GET /places/countries/:id/headers
```

### Logic

First checking if a country is existing or not using id. If yes, return headers of that country. Otherwise, return 404.

### Parameters

| Params        | Required? | Data Type | Description                                                              |
| ------------- | --------- | --------- | ------------------------------------------------------------------------ |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale        | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page      | No        | Integer   | Number of result return. Default set to 10.                              |
| page          | No        | Integer   | Page number for result.                                                  |

### Example

`/places/cities/4534/headers`

```
[
  {
    bannerUrl: "https://assets.wego.com/image/upload/v1533091265/destination_headers/countries/banners/n0dwotpov1o6jk1acgbo.jpg",
    title: "Singapore",
    logoUrl: "https://assets.wego.com/image/upload/v1533091330/destination_headers/countries/logos/x2qpq6b9yioorzx5bye1.png",
    description: "<table><tbody><tr><td><p>An urban country of its own&nbsp;<a target="_blank" href="https://www.stb.gov.sg/">LEARN MORE</a></p></td></tr></tbody></table>",
    caption: "CBD",
    subcaption: "Singapore"
  },
  {
    bannerUrl: "https://assets.wego.com/image/upload/v1533100096/destination_headers/countries/banners/woitjukkjrq7wwrvdep8.jpg",
    title: "Singapore",
    logoUrl: "https://assets.wego.com/image/upload/v1533091330/destination_headers/countries/logos/x2qpq6b9yioorzx5bye1.png",
    description: "<table><tbody><tr><td><p>An urban country of its own&nbsp;<a target="_blank" href="https://www.stb.gov.sg/">LEARN MORE</a></p></td></tr></tbody></table>",
    caption: "CBD",
    subcaption: "Singapore"
  }
]
```

## List Top Attractions

```
GET /places/attractions
```

### Logic

Look through elastic search based on the bounding box and per_page params if provided. It will return top x (either default 20 or per_page params) attractions based on the rating given by sygic.
If bounding_box or no such attractions found within bounding box, will return empty array.

### Parameters

| Params        | Required? | Data Type | Description                                                                                                                                                    |
| ------------- | --------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| bounding_box  | Yes       | String    | Must be 4 values, comma separated string. North Latitude, East Longitude, South Latitude, West Longitude. North Latitude should be bigger than South Latitude. |
| key_transform | No        | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower                                                                                       |
| locale        | No        | String    | language that you want to get translated in for description and name.                                                                                          |
| per_page      | No        | Integer   | Number of result return. Default set to 20.                                                                                                                    |
| page          | No        | Integer   | Page number for result.                                                                                                                                        |

### Example

`/places/attractions?bounding_box=52.675454,13.761117,52.3382340,13.088346&locale=ar&key_transform=underscore&per_page=10&page=1`

```
[
    {
        "name": "Reichstag Building",
        "name_suffix": "Berlin, Germany",
        "perex": "This majestic historical building, which today serves as a home to the German parliament, is a must see for any history buff.",
        "latitude": 52.5186,
        "longitude": 13.3761,
        "thumbnail_url": "https://media-cdn.sygictraveldata.com/media/poi:889",
        "description": "This majestic historical building, which today serves as a home to the German parliament, is a must see for any history buff. You may remember it from the famous photo Raising a flag over the Reichstag, which, in modern terms, went viral by the end of the World War II. There is also a roofed terrace on the top of the building complete with a garden, a restaurant, and a glass dome, which the visitors can climb to get spectacular 360° views of Berlin's skyline. If you want to learn more about the building, audioguides are available on the roofed terrace.\n\nThe Reichstag has a long and eventful history. Built in 1894 to house the parliament of the country, it only remained in use until 1933, when it got severely damaged by fire. Since then, it had been left unused for political reasons until its restoration in 1999. \nToday, tourists can take a look at the graffiti on its walls, made by the Soviets at the end of the Second World War, or take a picture with a copy of the photograph that made it famous.",
        "description_provider": "wikipedia",
        "description_translation_provider": "wikipedia",
        "description_link": "https://en.wikipedia.org/wiki/Old_Protestant_Cemetery_(Macau)"
    },
    {
        "name": "Memorial to the Murdered Jews of Europe",
        "name_suffix": "Berlin, Germany",
        "perex": "Also referred to as the Holocaust Memorial, this monument is dedicated to the memory of the Jewish people killed by the Nazis. ",
        "latitude": 52.5139,
        "longitude": 13.3786,
        "thumbnail_url": "https://media-cdn.sygictraveldata.com/media/poi:1708",
        "description": "Also referred to as the Holocaust Memorial, this monument is dedicated to the memory of the Jewish people killed by the Nazis. \n\nThe memorial was finished in 2004, it consists of 2711 concrete “stelae” (slabs) of various sizes and was designed by Peter Eisenman. His vision was to create an impression of instability in a seemingly stable (yet machine-like and inhuman) system. However, the visitors usually say that the place reminds them of an abandoned cemetery.\n\nThe Information Centre, which is a part of the complex, tells the story of the Holocaust terrors and of the Final Solution. Here, you can also find millions of names of the Jewish people killed by the Nazis. The Centre also organizes free public tours of the memorial.\n\nThe nearest metro/bus station is Mohrenstraße, line U2."
    },
    ...
]
```

## Update Attractions

```
PATCH /places/attractions
```

### Parameters

| Params                           | Required? | Data Type | Description                                   |
| -------------------------------- | --------- | --------- | --------------------------------------------- |
| description                      | No        | String    | description of the attraction                 |
| description_provider             | No        | String    | which provider gave this description          |
| description_translation_provider | No        | String    | which provider for translation of description |
| description_link                 | No        | String    | source of description.                        |
| perex                            | No        | String    | short description                             |
| name                             | No        | String    | name of attraction                            |
| name_suffix                      | No        | String    | city name and country name                    |
| locale                           | Yes       | String    | language of the translated attributes         |

### Example

`/places/attractions/:id`

### Request Body

```
{
	"translations_attributes": [
		{
		  "description_translation_provider": "test 2",
		  "locale": "en"
		}
	]
}
```

### Response

```
{
    "name": "Reichstag Building",
    "nameSuffix": "Berlin, Germany",
    "perex": "This majestic historical building, which today serves as a home to the German parliament, is a must see for any history buff.",
    "latitude": 52.5186,
    "longitude": 13.3761,
    "thumbnailUrl": "https://media-cdn.sygictraveldata.com/media/poi:889",
    "description": "This majestic historical building, which today serves as a home to the German parliament, is a must see for any history buff. You may remember it from the famous photo Raising a flag over the Reichstag, which, in modern terms, went viral by the end of the World War II. There is also a roofed terrace on the top of the building complete with a garden, a restaurant, and a glass dome, which the visitors can climb to get spectacular 360° views of Berlin's skyline. If you want to learn more about the building, audioguides are available on the roofed terrace.\n\nThe Reichstag has a long and eventful history. Built in 1894 to house the parliament of the country, it only remained in use until 1933, when it got severely damaged by fire. Since then, it had been left unused for political reasons until its restoration in 1999. \nToday, tourists can take a look at the graffiti on its walls, made by the Soviets at the end of the Second World War, or take a picture with a copy of the photograph that made it famous.",
    "descriptionTranslationProvider": "test 2"
}

```

## List Hotels Popular Districts in City

```
GET /places/cities/:id/districts/popular/hotels
```

### Logic

Returns the hotels popular districts in a city using the `id` and `site_code` parameter. Results are rank using the score in descending order. Not all districts have scores and in that case, those districts without scores will end up on the bottom of the result. Districts without score are sorted using `hotel_count`.

### Parameters

| Params        | Required? | Data Type | Description                                                                         |
| ------------- | --------- | --------- | ----------------------------------------------------------------------------------- |
| site_code     | No        | String    | The user country code that results will use to filter the results. Defaults to `US` |
| key_transform | No        | String    | Format of json keys. `camel_lower` or `underscore`. default is camelLower           |
| locale        | No        | String    | langugage that you want to get translated in for description and name.              |
| per_page      | No        | Integer   | Number of result return. Default set to 10.                                         |
| page          | No        | Integer   | Page number for result.                                                             |

### Example

`places/cities/1034/districts/popular/hotels?site_code=SG&locale=ar`

```
[
    {
        "id": 2138,
        "name": "ناجويا",
        "permalink": "nagoya",
        "locationId": 1034,
        "districtId": 2138,
        "districtName": "ناجويا",
        "districtPermalink": "nagoya",
        "cityId": 1034,
        "cityCode": "BTH",
        "cityName": "باتام سنتر",
        "cityPermalink": "batam",
        "countryId": 102,
        "countryCode": "ID",
        "countryName": "أندونيسيا",
        "countryPermalink": "indonesia",
        "stateId": 132,
        "stateName": "جزر رياو",
        "statePermalink": "riau-islands",
        "stateCode": "KR",
        "worldRegionId": 2,
        "worldRegionName": "آسيا",
        "worldRegionPermalink": "asia",
        "worldRegionCode": "i",
        "lat": 1.14388,
        "long": 104.029,
        "type": "district",
        "hotelCount": 65,
        "stationType": "district",
        "enName": "Nagoya",
        "enPermalink": "nagoya",
        "districtEnName": "Nagoya",
        "districtEnPermalink": "nagoya",
        "cityEnName": "Batam",
        "cityEnPermalink": "batam",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "Indonesia",
        "countryEnPermalink": "indonesia",
        "stateEnName": "Riau Islands",
        "stateEnPermalink": "riau-islands",
        "hotelsPopularCurrentRank": 1
    }
]
```

## List Visa Free Cities for Flights

```
GET /places/cities/visa_free/flights
```

### Parameters

| Param                 | Required?                                   | Data Type | Description                                                                                          |
| --------------------- | ------------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------- |
| site_code             | Yes if passport_country_code is not present | String    | The user site code.                                                                                  |
| passport_country_code | Yes if site_code is not present             | String    | Coutry code. The country code based on the nationality of the user.                                  |
| departure_city_code   | Yes                                         | String    | The departure city code of the flights.                                                              |
| arrival_country_code  | No                                          | String    | The arrival country code of flights.                                                                 |
| language              | No                                          | String    | The language that the response will be in. `en` as default                                           |
| per_page              | No                                          | Number    | number of results to return. defaults to 20                                                          |
| page                  | No                                          | Number    | the page to return for multiple page results. Defaults to 1                                          |
| key_transform         | No                                          | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| currency_code         | No                                          | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |
| sort_by               | No                                          | String    | The type of ordering of the results. Values: (`price`, `popularity`). Defaults to popularity         |

### Changelog

28/09/2018: First version.
07/03/2019: Change `departure_city_code` query parameter to `departure_city_code`

### Examples

- `/places/cities/visa_free/flights?site_code=SG&per_page=10&departure_city_code=SIN&arrival_country_code=TH&sort_by=popularity`
- `/places/cities/visa_free/flights?site_code=US&passport_country_code=SG&departure_city_code=SIN&arrival_country_code=TH`

### Response

```
    [
        {
            "id": 3260,
            "code": "IST",
            "name": "Istanbul",
            "permalink": "istanbul",
            "cityId": 3260,
            "cityCode": "IST",
            "cityName": "Istanbul",
            "cityPermalink": "istanbul",
            "worldRegionId": 9,
            "worldRegionName": "Middle East",
            "worldRegionPermalink": "middle-east",
            "worldRegionCode": "m",
            "countryId": 223,
            "countryName": "Turkey",
            "countryPermalink": "turkey",
            "countryCode": "TR",
            "regionId": 147,
            "regionName": "Black Sea Coast",
            "regionPermalink": "black-sea-coast",
            "lat": 41.0136,
            "long": 28.955,
            "type": "city",
            "hotelCount": 3764,
            "airportCount": 2,
            "timeZone": "+03:00",
            "stationType": "city",
            "cheapestPriceUsd": 75.875,
            "enName": "Istanbul",
            "enPermalink": "istanbul",
            "cityEnName": "Istanbul",
            "cityEnPermalink": "istanbul",
            "worldRegionEnName": "Middle East",
            "worldRegionEnPermalink": "middle-east",
            "countryEnName": "Turkey",
            "countryEnPermalink": "turkey"
        }
    ]
```

## List Visa Free Countries

```
GET /places/countries/visa_free
```

### Parameters

| Param                 | Required?                                   | Data Type | Description                                                         |
| --------------------- | ------------------------------------------- | --------- | ------------------------------------------------------------------- |
| site_code             | Yes if passport_country_code is not present | String    | The user site code.                                                 |
| passport_country_code | Yes if site_code is not present             | String    | Coutry code. The country code based on the nationality of the user. |
| language              | No                                          | String    | The language that the response will be in. `en` as default          |
| per_page              | No                                          | Number    | number of results to return. Defaults to 20                         |
| page                  | No                                          | Number    | the page to return for multiple page results. Defaults to 1         |
| key_transform         | No                                          | String    | Format of json keys. `camelLower` or `underscore`                   |

### Changelog

28/09/2018: First version.

### Examples

- `/places/countries/visa_free?site_code=SG&per_page=10`
- `/places/countries/visa_free?site_code=US&passport_country_code=SG`

### Response

```
[
    {
        "id": 133,
        "code": "MY",
        "name": "ماليزيا",
        "permalink": "malaysia",
        "countryId": 133,
        "countryCode": "MY",
        "countryName": "ماليزيا",
        "countryPermalink": "malaysia",
        "worldRegionId": 2,
        "worldRegionName": "آسيا",
        "worldRegionCode": "i",
        "worldRegionPermalink": "asia",
        "lat": 7.23346,
        "long": 117.17,
        "type": "country",
        "airportCount": 34,
        "stationType": "country",
        "keyCityCode": "KUL",
        "currencyCode": "MYR",
        "enName": "Malaysia",
        "enPermalink": "malaysia",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "Malaysia",
        "countryEnPermalink": "malaysia"
    }
]
```

## List Visa Free Countries for Flights

```
GET /places/countries/visa_free/flights
```

### Parameters

| Param                 | Required?                                   | Data Type | Description                                                                                          |
| --------------------- | ------------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------- |
| site_code             | Yes if passport_country_code is not present | String    | The user site code.                                                                                  |
| passport_country_code | Yes if site_code is not present             | String    | Coutry code. The country code based on the nationality of the user.                                  |
| departure_city_code   | Yes                                         | String    | The departure city code of the flights.                                                              |
| language              | No                                          | String    | The language that the response will be in. `en` as default                                           |
| per_page              | No                                          | Number    | number of results to return. Defaults to 20                                                          |
| page                  | No                                          | Number    | the page to return for multiple page results. Defaults to 1                                          |
| key_transform         | No                                          | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| currency_code         | No                                          | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |
| sort_by               | No                                          | String    | The type of ordering of the results. Values: (`price`, `popularity`). Defaults to popularity         |
| visa_type             | No                                          | String    | Filter the countries by the visa type. Values: (`ETA`, `VISA_ON_ARRIVAL`, `VISA_FREE`)               |

### Changelog

28/09/2018: First version.
07/03/2019: Change `departure_city_code` query parameter to `departure_city_code`

### Examples

- `/places/countries/visa_free/flights?site_code=SG&per_page=10&departure_city_code=SG&sort_by=popularity`
- `/places/countries/visa_free/flights?site_code=US&passport_country_code=SG&departure_city_code=SG`

### Response

```
[
    {
        "id": 133,
        "code": "MY",
        "name": "ماليزيا",
        "permalink": "malaysia",
        "countryId": 133,
        "countryCode": "MY",
        "countryName": "ماليزيا",
        "countryPermalink": "malaysia",
        "worldRegionId": 2,
        "worldRegionName": "آسيا",
        "worldRegionCode": "i",
        "worldRegionPermalink": "asia",
        "lat": 7.23346,
        "long": 117.17,
        "type": "country",
        "airportCount": 34,
        "stationType": "country",
        "keyCityCode": "KUL",
        "cheapestPriceUsd": 13.8872,
        "currencyCode": "MYR",
        "enName": "Malaysia",
        "enPermalink": "malaysia",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "Malaysia",
        "countryEnPermalink": "malaysia"
    }
]
```

## List Cities Flights for Themes

```
GET /places/cities/flights/themes
```

### Parameters

| Param               | Required? | Data Type | Description                                                                                          |
| ------------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| departure_city_code | Yes       | String    | The departure city code of the flights.                                                              |
| site_code           | No        | String    | The user site code. Will be used to filter the themes.                                               |
| language            | No        | String    | The language that the response will be in. `en` as default                                           |
| per_page            | No        | Number    | Number of results to return. Defaults and limits to 20                                               |
| page                | No        | Number    | The page to return for multiple page results. Defaults to 1                                          |
| currency_code       | No        | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |
| key_transform       | No        | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| sort_by             | No        | String    | The type of ordering of the results. Values: (`price`). Defaults to price                            |
| appType             | No        | String    | to sort themes by popularity based on appType(ios/android)                                           |

### Changelog

26/02/2019: First version.

### Examples

- `/places/cities/flights/themes?per_page=10&page=1&currency_code=SGD&site_code=SG&departure_city_code=SIN`

### Response

```
[
    {
        "id": 18,
        "name": "Muslim-friendly",
        "permalink": "muslim-friendly",
        "type": "theme",
        "count": 99,
        "cheapestPrice": {
            "amount": 64.44,
            "amountUsd": 47.74,
            "currencyCode": "SGD"
        }
    },
    {
        "id": 13,
        "name": "Romantic",
        "permalink": "romantic",
        "type": "theme",
        "imageUrls": [
        "http://assets.wego.com/image/upload/v1551080363/themes/romantic/tzoo.1.0.567887.C-vacation-Romantic-shutterstock-paris_yx9h3a.jpg"
        ],
        "count": 38,
        "cheapestPrice": {
            "amount": 87.77,
            "amountUsd": 65.02,
            "currencyCode": "SGD"
        }
    }
]
```

## List Cities Flights for a Theme

```
GET /places/cities/themes/:theme_id/flights
```

### Parameters

| Param               | Required? | Data Type | Description                                                                                          |
| ------------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| departure_city_code | Yes       | String    | The departure city code of the flights.                                                              |
| theme_id            | Yes       | String    | The theme id of the theme.                                                                           |
| site_code           | No        | String    | The user site code. Will be used to filter the themes.                                               |
| language            | No        | String    | The language that the response will be in. `en` as default                                           |
| per_page            | No        | Number    | Number of results to return. Defaults and limits to 20                                               |
| page                | No        | Number    | The page to return for multiple page results. Defaults to 1                                          |
| currency_code       | No        | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |
| key_transform       | No        | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| sort_by             | No        | String    | The type of ordering of the results. Values: (`price`). Defaults to price                            |

### Changelog

26/02/2019: First version.

### Examples

- `/places/cities/themes/7/flights?per_page=10&page=1&currency_code=SGD&site_code=SG&departure_city_code=SIN`

### Response

```
[
    {
        "id": 4113,
        "code": "LGK",
        "name": "Langkawi",
        "permalink": "langkawi",
        "cityId": 4113,
        "cityCode": "LGK",
        "cityName": "Langkawi",
        "cityPermalink": "langkawi",
        "worldRegionId": 2,
        "worldRegionName": "Asia",
        "worldRegionPermalink": "asia",
        "worldRegionCode": "i",
        "countryId": 133,
        "countryName": "Malaysia",
        "countryPermalink": "malaysia",
        "countryCode": "MY",
        "lat": 6.35,
        "long": 99.8,
        "type": "city",
        "hotelCount": 458,
        "airportCount": 1,
        "timeZone": "+08:00",
        "stationType": "city",
        "cheapestPrice": {
            "amount": 66.62,
            "amountUsd": 49.35,
            "currencyCode": "SGD"
        },
        "enName": "Langkawi",
        "enPermalink": "langkawi",
        "cityEnName": "Langkawi",
        "cityEnPermalink": "langkawi",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "Malaysia",
        "countryEnPermalink": "malaysia"
    }
]
```

## Explore Summary Api

```
GET /places/explore
```

### Parameters

| Param                          | Required? | Data Type | Description                                                                                          |
| ------------------------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| departure_city_code            | Yes       | String    | The departure city code of the flights.                                                              |
| passport_country_code          | Yes       | String    | Coutry code. The country code based on the nationality of the user.                                  |
| weekend_getaway_departure_date | Yes       | String    | The departure date of the weeked getaway (format: YYYY-MM-DD)                                        |
| weekend_getaway_arrival_date   | Yes       | String    | The arrival date of the weeked getaway (format: YYYY-MM-DD)                                          |
| site_code                      | No        | String    | The user site code. Will be used to filter the themes.                                               |
| language                       | No        | String    | The language that the response will be in. `en` as default                                           |
| currency_code                  | No        | String    | Currency code in which you want the Price to be in. USD as default. Must be ISO currency code format |
| key_transform                  | No        | String    | Format of json keys. `camelLower` or `underscore`                                                    |
| appType                        | No        | String    | to sort themes by popularity based on appType(ios/android)                                           |

### Changelog

12/03/2019: First version.

### TODO

- Add weekeend getaways collection.
- Implement translation.

### Examples

- `/places/explore?currency_code=SGD&site_code=SG&departure_city_code=SIN&weekend_getaway_departure_date=2019-04-06&weekend_getaway_arrival_date=2019-04-08&passport_country_code=SG`

### Response

```
[
  {
    "collectionKey": "popular_destination",
    "collectionName": "Popular Destinations",
    "destinationCount": 362,
    "imageUrls": [
      "https://assets.wego.com/image/upload/destinations/cities/BKK.jpg",
      "https://assets.wego.com/image/upload/destinations/cities/KUL.jpg",
      "https://assets.wego.com/image/upload/destinations/cities/TPE.jpg"
    ],
    "cheapestPrice": {
      "amount": 11.2,
      "amountUsd": 11.2,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "visa_free_countries",
    "collectionName": "Visa-free Countries",
    "destinationCount": 305,
    "imageUrls": [
      "https://assets.wego.com/image/upload/destinations/country/TH.jpg",
      "https://assets.wego.com/image/upload/destinations/country/MY.jpg",
      "https://assets.wego.com/image/upload/destinations/country/TW.jpg"
    ],
    "cheapestPrice": {
      "amount": 36.16,
      "amountUsd": 36.16,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "romantic_theme",
    "collectionName": "Romantic Destinations",
    "destinationCount": 38,
    "imageUrls": [
      "http://assets.wego.com/image/upload/v1551758807/themes/staging/romantic/Romantic_1_ellztj.jpg",
      "http://assets.wego.com/image/upload/v1551758816/themes/staging/romantic/Romantic_2_vkl78o.jpg",
      "http://assets.wego.com/image/upload/v1551758823/themes/staging/romantic/Romantic_3_m6tbcq.jpg"
    ],
    "subKey": 13,
    "cheapestPrice": {
      "amount": 45.87,
      "amountUsd": 45.87,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "cultural_theme",
    "collectionName": "Cultural Destinations",
    "destinationCount": 25,
    "imageUrls": [
      "http://assets.wego.com/image/upload/v1551429170/themes/cultural/shutterstock_654317653_wnlgsn.jpg",
      "http://assets.wego.com/image/upload/v1551429379/themes/cultural/shutterstock_593203085_nzmbm1.jpg",
      "http://assets.wego.com/image/upload/v1551768711/themes/staging/cultural/shutterstock_588345188_zt61mz.jpg"
    ],
    "subKey": 5,
    "cheapestPrice": {
      "amount": 45.87,
      "amountUsd": 45.87,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "nature_theme",
    "collectionName": "Nature Destinations",
    "destinationCount": 18,
    "imageUrls": [
      "http://assets.wego.com/image/upload/v1551768752/themes/staging/nature/shutterstock_1279121206_ldzxaj.jpg",
      "http://assets.wego.com/image/upload/v1551768765/themes/staging/nature/shutterstock_1124664557_tmbnrd.jpg",
      "http://assets.wego.com/image/upload/v1551768773/themes/staging/nature/shutterstock_361751813_ohtnvy.jpg"
    ],
    "subKey": 11,
    "cheapestPrice": {
      "amount": 49.35,
      "amountUsd": 49.35,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "family-friendly_theme",
    "collectionName": "Family-friendly Destinations",
    "destinationCount": 12,
    "imageUrls": [
      "http://assets.wego.com/image/upload/v1551758881/themes/staging/family-friendly/shutterstock_1022608465_mym8wt.jpg"
    ],
    "subKey": 7,
    "cheapestPrice": {
      "amount": 49.35,
      "amountUsd": 49.35,
      "currencyCode": "USD"
    }
  },
  {
    "collectionKey": "beach_theme",
    "collectionName": "Beach Destinations",
    "destinationCount": 11,
    "imageUrls": [
      "http://assets.wego.com/image/upload/v1551768946/themes/staging/beach/shutterstock_675148510_dlrkdy.jpg",
      "http://assets.wego.com/image/upload/v1551768956/themes/staging/beach/shutterstock_623120348_mcmwys.jpg",
      "http://assets.wego.com/image/upload/v1551768963/themes/staging/beach/shutterstock_788218267_cmwa8z.jpg"
    ],
    "subKey": 3,
    "cheapestPrice": {
      "amount": 49.35,
      "amountUsd": 49.35,
      "currencyCode": "USD"
    }
  }
]
```

## Weekend Getaway Cities

```
GET  /places/cities/short_getaways
```

### Parameters

| Param               | Required? | Data Type | Description                                                                           |
| ------------------- | --------- | --------- | ------------------------------------------------------------------------------------- |
| departure_city_code | Yes       | String    | The departure city code                                                               |
| departure_date      | Yes       | String    | Queried departure date                                                                |
| return_date         | Yes       | String    | Queried return date                                                                   |
| language            | No        | String    | The language that the response will be in. `en` as default                            |
| currency_code       | No        | String    | The currency_code the response will be in. `USD` as default                           |
| per_page            | No        | Integer   | Number of cities in the response. 20 as default.                                      |
| page                | No        | Integer   | This is disable for now, will always return an empty array for any page that is not 1 |
| key_transform       | No        | String    | Format of json keys. `camelLower` or `underscore`                                     |

### Examples

- `/places/cities/short_getaways?departure_city_code=SIN&departure_date=2019-05-03&return_date=2019-05-05&currency_code=SGD&per_page=5`

### Response

The returned cities will be always sorted by cheapest fare price from lowest to highest

```
[
  {
    id: 3907,
    code: "KUL",
    name: "Kuala Lumpur",
    permalink: "kuala-lumpur",
    cityId: 3907,
    cityCode: "KUL",
    cityName: "Kuala Lumpur",
    cityPermalink: "kuala-lumpur",
    worldRegionId: 2,
    worldRegionName: "Asia",
    worldRegionPermalink: "asia",
    worldRegionCode: "i",
    countryId: 133,
    countryName: "Malaysia",
    countryPermalink: "malaysia",
    countryCode: "MY",
    regionId: 231,
    regionName: "Peninsular Malaysia",
    regionPermalink: "peninsular-malaysia",
    lat: 3.139,
    long: 101.687,
    type: "city",
    hotelCount: 1998,
    airportCount: 2,
    timeZone: "+08:00",
    stationType: "city",
    cheapestPriceUsd: 63.546394,
    ianaTimeZone: "Asia/Kuala_Lumpur",
    enName: "Kuala Lumpur",
    enPermalink: "kuala-lumpur",
    cityEnName: "Kuala Lumpur",
    cityEnPermalink: "kuala-lumpur",
    worldRegionEnName: "Asia",
    worldRegionEnPermalink: "asia",
    countryEnName: "Malaysia",
    countryEnPermalink: "malaysia",
    cheapestPrice: {
      amount: 86.01,
      amountUsd: 63.55,
      currencyCode: "SGD"
    }
  },
  {
    id: 5740,
    code: "PEN",
    name: "Penang",
    permalink: "penang-5740",
    cityId: 5740,
    cityCode: "PEN",
    cityName: "Penang",
    cityPermalink: "penang-5740",
    worldRegionId: 2,
    worldRegionName: "Asia",
    worldRegionPermalink: "asia",
    worldRegionCode: "i",
    countryId: 133,
    countryName: "Malaysia",
    countryPermalink: "malaysia",
    countryCode: "MY",
    regionId: 231,
    regionName: "Peninsular Malaysia",
    regionPermalink: "peninsular-malaysia",
    lat: 5.41635,
    long: 100.333,
    type: "city",
    hotelCount: 684,
    airportCount: 1,
    timeZone: "+08:00",
    stationType: "city",
    cheapestPriceUsd: 84.2506,
    ianaTimeZone: "Asia/Kuala_Lumpur",
    enName: "Penang",
    enPermalink: "penang-5740",
    cityEnName: "Penang",
    cityEnPermalink: "penang-5740",
    worldRegionEnName: "Asia",
    worldRegionEnPermalink: "asia",
    countryEnName: "Malaysia",
    countryEnPermalink: "malaysia",
    cheapestPrice: {
      amount: 114.03,
      amountUsd: 84.25,
      currencyCode: "SGD"
    }
  },
  {
    id: 835,
    code: "BKK",
    name: "Bangkok",
    permalink: "bangkok",
    cityId: 835,
    cityCode: "BKK",
    cityName: "Bangkok",
    cityPermalink: "bangkok",
    worldRegionId: 2,
    worldRegionName: "Asia",
    worldRegionPermalink: "asia",
    worldRegionCode: "i",
    countryId: 216,
    countryName: "Thailand",
    countryPermalink: "thailand",
    countryCode: "TH",
    regionId: 240,
    regionName: "Central Thailand",
    regionPermalink: "central-thailand",
    lat: 13.7563,
    long: 100.502,
    type: "city",
    hotelCount: 3306,
    airportCount: 2,
    timeZone: "+07:00",
    stationType: "city",
    cheapestPriceUsd: 119,
    ianaTimeZone: "Asia/Bangkok",
    enName: "Bangkok",
    enPermalink: "bangkok",
    cityEnName: "Bangkok",
    cityEnPermalink: "bangkok",
    worldRegionEnName: "Asia",
    worldRegionEnPermalink: "asia",
    countryEnName: "Thailand",
    countryEnPermalink: "thailand",
    cheapestPrice: {
      amount: 161.06,
      amountUsd: 119,
      currencyCode: "SGD"
    }
  },
  {
    id: 6617,
    code: "SGN",
    name: "Ho Chi Minh City",
    permalink: "ho-chi-minh-city",
    cityId: 6617,
    cityCode: "SGN",
    cityName: "Ho Chi Minh City",
    cityPermalink: "ho-chi-minh-city",
    worldRegionId: 2,
    worldRegionName: "Asia",
    worldRegionPermalink: "asia",
    worldRegionCode: "i",
    countryId: 237,
    countryName: "Vietnam",
    countryPermalink: "vietnam",
    countryCode: "VN",
    regionId: 220,
    regionName: "Southern Vietnam",
    regionPermalink: "southern-vietnam",
    lat: 10.8231,
    long: 106.63,
    type: "city",
    hotelCount: 2478,
    airportCount: 1,
    timeZone: "+07:00",
    stationType: "city",
    cheapestPriceUsd: 120.6705,
    ianaTimeZone: "Asia/Ho_Chi_Minh",
    enName: "Ho Chi Minh City",
    enPermalink: "ho-chi-minh-city",
    cityEnName: "Ho Chi Minh City",
    cityEnPermalink: "ho-chi-minh-city",
    worldRegionEnName: "Asia",
    worldRegionEnPermalink: "asia",
    countryEnName: "Vietnam",
    countryEnPermalink: "vietnam",
    cheapestPrice: {
      amount: 163.32,
      amountUsd: 120.67,
      currencyCode: "SGD"
    }
  },
  {
    id: 4752,
    code: "MNL",
    name: "Manila",
    permalink: "manila",
    cityId: 4752,
    cityCode: "MNL",
    cityName: "Manila",
    cityPermalink: "manila",
    worldRegionId: 2,
    worldRegionName: "Asia",
    worldRegionPermalink: "asia",
    worldRegionCode: "i",
    countryId: 174,
    countryName: "Philippines",
    countryPermalink: "philippines",
    countryCode: "PH",
    regionId: 289,
    regionName: "Luzon",
    regionPermalink: "luzon",
    lat: 14.5995,
    long: 120.984,
    type: "city",
    hotelCount: 2000,
    airportCount: 2,
    timeZone: "+08:00",
    stationType: "city",
    cheapestPriceUsd: 170.14339,
    ianaTimeZone: "Asia/Manila",
    enName: "Manila",
    enPermalink: "manila",
    cityEnName: "Manila",
    cityEnPermalink: "manila",
    worldRegionEnName: "Asia",
    worldRegionEnPermalink: "asia",
    countryEnName: "Philippines",
    countryEnPermalink: "philippines",
    cheapestPrice: {
      amount: 230.27,
      amountUsd: 170.14,
      currencyCode: "SGD"
    }
  }
]
```

## List Ongoing Featured Destination Campaigns

```
GET  /places/campaigns
```

### Parameters

| Param        | Required? | Data Type | Description                                                                                               |
| ------------ | --------- | --------- | --------------------------------------------------------------------------------------------------------- |
| city_code    | Yes       | String    | IATA city code. The departure city which the flights will be based on.                                    |
| site_code    | Yes       | String    | Site code                                                                                                 |
| language     | No        | String    | The language that the response will be in. <br /> `en` as default.                                        |
| currencyCode | No        | String    | Currency code which you want the price to be in. <br /> USD as default. Must be ISO currency code format. |

### Examples

- `/places/campaigns?site_code=SG&city_code=SIN`

### Response

- The returned ongoing campaigns will be always sorted by date of creation

```
[
  {
    "id": 1,
    "logoUrl": "https://assets.wego.com/image/upload/v1/featured_destination_partner_logo/campaign_1.png",
    "partnerUrl": "en_partner_url_1",
    "title": "en_title_1",
    "subtitle": "en_subtitle_1",
    "count": 3,
    "cheapestPrice": {
      "amount": 186.55,
      "amountUsd": 186.55,
      "currencyCode": "USD"
    },
    "cityImagesUrls": [
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/FOC.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/XMN.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/HFE.jpg"
    ]
  },
  {
    "id": 7,
    "logoUrl": "https://assets.wego.com/image/upload/v1/featured_destination_partner_logo/campaign_7.png",
    "partnerUrl": "en_partner_url_7",
    "title": "en_title_7",
    "subtitle": "en_subtitle_7",
    "count": 1077,
    "cheapestPrice": {
      "amount": 250.91,
      "amountUsd": 250.91,
      "currencyCode": "USD"
    },
    "cityImagesUrls": [
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/SYD.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/OOL.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/BNE.jpg"
    ]
  },
  {
    "id": 8,
    "logoUrl": "https://assets.wego.com/image/upload/v1/featured_destination_partner_logo/campaign_8.png",
    "partnerUrl": "en_partner_url_8",
    "title": "en_title_8",
    "subtitle": "en_subtitle_8",
    "count": 2477,
    "cheapestPrice": {
      "amount": 75.54,
      "amountUsd": 75.54,
      "currencyCode": "USD"
    },
    "cityImagesUrls": [
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/CAN.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/CKG.jpg",
      "https://assets.wego.com/image/upload/v1555363145/destinations/cities/HKG.jpg"
    ]
  }
]
```

## Get Featured Destination Campaign

```
GET  /places/campaigns/:id
```

### Parameters

| Param        | Required? | Data Type | Description                                                                                               |
| ------------ | --------- | --------- | --------------------------------------------------------------------------------------------------------- |
| city_code    | Yes       | String    | IATA city code. The departure city which the flights will be based on.                                    |
| site_code    | Yes       | String    | Site code                                                                                                 |
| language     | No        | String    | The language that the response will be in. <br /> `en` as default.                                        |
| currencyCode | No        | String    | Currency code which you want the price to be in. <br /> USD as default. Must be ISO currency code format. |
| per_page     | No        | Number    | Max number of recommended cities in the response. Defaults to 10                                          |
| page         | No        | Number    | The page of recommended cities to return for multiple page results. Defaults to 1                         |

### Examples

- `/places/campaigns/8?site_code=SG&city_code=SIN&per_page=2&page=2`

### Response

- The returned recommended cities will be always sorted by cheapest fare price from lowest to highest

```
{
  "id": 8,
  "logoUrl": "https://assets.wego.com/image/upload/v1/featured_destination_partner_logo/campaign_8.png",
  "partnerUrl": "en_partner_url_8",
  "title": "en_title_8",
  "subtitle": "en_subtitle_8",
  "recommendedCities": [
    {
      "id": 2890,
      "code": "HKG",
      "name": "Hong Kong",
      "permalink": "hong-kong",
      "lat": 22.3964,
      "long": 114.109,
      "cheapestPrice": {
        "amount": 113.4,
        "amountUsd": 113.4,
        "currencyCode": "USD"
      },
      "enName": "Hong Kong",
      "enPermalink": "hong-kong",
      "countryId": 45,
      "countryName": "China",
      "countryPermalink": "china",
      "countryCode": "CN"
    },
    {
      "id": 1610,
      "code": "CTU",
      "name": "Chengdu",
      "permalink": "chengdu",
      "lat": 30.5728,
      "long": 104.067,
      "cheapestPrice": {
        "amount": 118.43,
        "amountUsd": 118.43,
        "currencyCode": "USD"
      },
      "enName": "Chengdu",
      "enPermalink": "chengdu",
      "countryId": 45,
      "countryName": "China",
      "countryPermalink": "china",
      "countryCode": "CN"
    }
  ]
}
```

---

## Get city fares

```
GET  /places/countries/cities/fares
```

### Parameters

| Param                | Required? | Data Type          | Description                                                                                                  |
| -------------------- | --------- | ------------------ | ------------------------------------------------------------------------------------------------------------ |
| departure_city_code  | Yes       | String             | Code of departure city                                                                                       |
| arrival_country_code | Yes       | String             | Code of arrival country                                                                                      |
| trip_type            | Yes       | String             | 'oneway' or 'roundtrip'                                                                                      |
| departure_month      | No        | String(yyyy-mm)    | Filter on fare departure month                                                                               |
| trip_duration_min    | No        | Number             | Filter on minimum days of trip                                                                               |
| trip_duration_max    | No        | Number             | Filter on maximum days of trip                                                                               |
| departure_date       | No        | String(yyyy-mm-dd) | Filter on fixed departure_date                                                                               |
| return_date          | No        | String(yyyy-mm-dd) | Filter on fixed return_date                                                                                  |
| locale               | No        | String             | The language that the response will be in. <br /> `en` as default.                                           |
| currencyCode         | No        | String             | Currency code in which you want the price to be in. <br /> USD as default. Must be ISO currency code format. |
| page                 | No        | Number             | The page of recommended cities to return for multiple page results. Defaults to 1                            |
| per_page             | No        | Number             | The number of results that return in 1 page                                                                  |

### Examples

- `/places/countries/cities/fares?departure_city_code=SIN&page=1&per_page=2&locale=ar&arrival_country_code=IN&currency_code=SGD&trip_type=roundtrip`

### Response

- The returned recommended cities will be always sorted by cheapest fare price from lowest to highest

```
[
    {
        "id": 26941,
        "code": "CDP",
        "name": "كودابا",
        "permalink": "kadapa",
        "cityId": 26941,
        "cityCode": "CDP",
        "cityName": "كودابا",
        "cityPermalink": "kadapa",
        "worldRegionId": 2,
        "worldRegionName": "آسيا",
        "worldRegionPermalink": "asia",
        "worldRegionCode": "i",
        "countryId": 101,
        "countryName": "الهند",
        "countryPermalink": "india",
        "countryCode": "IN",
        "lat": 14.4674,
        "long": 78.8241,
        "type": "city",
        "hotelCount": 16,
        "airportCount": 1,
        "timeZone": "+05:30",
        "stationType": "city",
        "ianaTimeZone": "Asia/Calcutta",
        "enName": "Cuddapah",
        "enPermalink": "kadapa",
        "cityEnName": "Cuddapah",
        "cityEnPermalink": "kadapa",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "India",
        "countryEnPermalink": "india",
        "cheapestPrice": {
            "amount": 15.44,
            "amountUsd": 11.25,
            "currencyCode": "SGD",
            "departureDate": "2020-02-06",
            "createdAt": "2019-09-21 01:39:35+0800"
        }
    },
    {
        "id": 2451,
        "code": "GAU",
        "name": "غاواهاتي",
        "permalink": "guwahati",
        "cityId": 2451,
        "cityCode": "GAU",
        "cityName": "غاواهاتي",
        "cityPermalink": "guwahati",
        "worldRegionId": 2,
        "worldRegionName": "آسيا",
        "worldRegionPermalink": "asia",
        "worldRegionCode": "i",
        "countryId": 101,
        "countryName": "الهند",
        "countryPermalink": "india",
        "countryCode": "IN",
        "regionId": 39,
        "regionName": "North East India",
        "regionPermalink": "north-east-india",
        "lat": 26.1445,
        "long": 91.7362,
        "type": "city",
        "hotelCount": 355,
        "airportCount": 1,
        "timeZone": "+05:30",
        "stationType": "city",
        "ianaTimeZone": "Asia/Kolkata",
        "enName": "Guwahati",
        "enPermalink": "guwahati",
        "cityEnName": "Guwahati",
        "cityEnPermalink": "guwahati",
        "worldRegionEnName": "Asia",
        "worldRegionEnPermalink": "asia",
        "countryEnName": "India",
        "countryEnPermalink": "india",
        "cheapestPrice": {
            "amount": 16.7,
            "amountUsd": 12.17,
            "currencyCode": "SGD",
            "departureDate": "2020-02-01",
            "createdAt": "2019-08-28 17:30:23+0800"
        }
    }
]
```

---

## Get Holiday Planner

```
GET  /places/v1/holiday_planner
```

### Parameters

| Param     | Required? | Data Type | Description |
| --------- | --------- | --------- | ----------- |
| site_code | Yes       | String    | Site Code   |

### Examples

- `/places/v1/holiday_planner?site_code=SG`

### Response

- Returned Public Holidays & Recommended Dates for SG

```
{
    "publicHolidays": [
        {
            "name": "Christmas Day",
            "key": "christmas_day",
            "startDate": "2019-12-25",
            "endDate": "2019-12-25"
        },
        {
            "name": "New Year's Day",
            "key": "new_years_day",
            "startDate": "2020-01-01",
            "endDate": "2020-01-01"
        },
        {
            "name": "Chinese Lunar New Year's Day",
            "key": "chinese_lunar_new_years_day",
            "startDate": "2020-01-25",
            "endDate": "2020-01-27"
        },
        {
            "name": "Good Friday",
            "key": "good_friday",
            "startDate": "2020-04-10",
            "endDate": "2020-04-10"
        },
        {
            "name": "Labour Day",
            "key": "labour_day",
            "startDate": "2020-05-01",
            "endDate": "2020-05-01"
        },
        {
            "name": "Vesak Day",
            "key": "vesak_day",
            "startDate": "2020-05-07",
            "endDate": "2020-05-07"
        },
        {
            "name": "Hari Raya Puasa",
            "key": "hari_raya_puasa",
            "startDate": "2020-05-24",
            "endDate": "2020-05-25"
        },
        {
            "name": "Hari Raya Haji",
            "key": "hari_raya_haji",
            "startDate": "2020-07-31",
            "endDate": "2020-07-31"
        },
        {
            "name": "National Day",
            "key": "national_day",
            "startDate": "2020-08-09",
            "endDate": "2020-08-10"
        },
        {
            "name": "Diwali/Deepavali",
            "key": "diwali_deepavali",
            "startDate": "2020-11-14",
            "endDate": "2020-11-14"
        }
    ],
    "recommendedDates": [
        {
            "start_date": "2019-12-25",
            "end_date": "2020-01-01"
        },
        {
            "start_date": "2020-01-25",
            "end_date": "2020-01-27"
        },
        {
            "start_date": "2020-04-10",
            "end_date": "2020-04-12"
        },
        {
            "start_date": "2020-05-01",
            "end_date": "2020-05-10"
        },
        {
            "start_date": "2020-05-23",
            "end_date": "2020-05-25"
        },
        {
            "start_date": "2020-07-31",
            "end_date": "2020-08-02"
        },
        {
            "start_date": "2020-08-08",
            "end_date": "2020-08-10"
        },
        {
            "start_date": "2020-11-14",
            "end_date": "2020-11-15"
        }
    ]
}
```

## GET Events

```
GET /places/events
```

### Logic

Sort by rating desc.

### Changelog

### Parameters

| Params              | Required? | Data Type | Description                                                              |
| ------------------- | --------- | --------- | ------------------------------------------------------------------------ |
| departure_city_code | Yes       | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| site_code           | Yes       | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale              | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page            | No        | Integer   | Number of Events to return. Default set to 10, minimum set to 1.         |
| page                | No        | Integer   | Page number for result.Default set 10, minimum set to 1.                 |
| showcase_only       | No        | Boolean   | Returns showcased events only for result.Default set false.              |

### Example

`/places/events?departure_city_code=SIN&site_code=SG`

### Response

- The returned Events will display the number of cities participating(cityCount) in the event with the cheapest price

```
[
  {
    id: 21,
    title: "English Malaysia International Jewellery Fair 2020",
    subtitle: "English subtitle Malaysia Jewellery Fair 2020",
    imageUrl: "https://assets.wego.com/image/upload/v1/places_events/staging/event_21.png",
    eventStart: "2020-01-10",
    eventEnd: "2020-01-13",
    eventCategory: "convention",
    cheapestPrice: {
      amount: 42.57,
      amountUsd: 42.57,
      currencyCode: "USD"
    },
    cityCount: 1
  },
  {
    id: 22,
    title: "English Neon Countdown Festival 2019",
    subtitle: "english Neon Countdown Festival subtitle",
    imageUrl: "https://assets.wego.com/image/upload/v1/places_events/staging/event_22.png",
    eventStart: "2019-12-30",
    eventEnd: "2019-12-31",
    eventCategory: "Music Festival",
    cheapestPrice: {
      amount: 78.97,
      amountUsd: 78.97,
      currencyCode: "USD"
    },
    cityCount: 1
  },
  {
    id: 24,
    title: "English Spring Festival Title 2020",
    subtitle: "English Spring Festival Title subtitle",
    imageUrl: "https://assets.wego.com/image/upload/v1/places_events/staging/event_24.png",
    eventStart: "2020-01-25",
    eventEnd: "2020-02-05",
    eventCategory: "Festival",
    cheapestPrice: {
    amount: 103.85,
    amountUsd: 103.85,
    currencyCode: "USD"
  },
    cityCount: 38
  }
]
```

## GET Event by id

```
GET /places/events/:id
```

### Changelog

### Parameters

| Params              | Required? | Data Type | Description                                                              |
| ------------------- | --------- | --------- | ------------------------------------------------------------------------ |
| departure_city_code | Yes       | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| site_code           | Yes       | String    | Format of json keys. `camelLower` or `underscore`. default is camelLower |
| locale              | No        | String    | langugage that you want to get translated in for description and name.   |
| per_page            | No        | Integer   | Number of Events to return. Default set to 10, minimum set to 1.         |
| page                | No        | Integer   | Page number for result.Default set 10, minimum set to 1.                 |

### Example

`/places/events/24?departure_city_code=SIN&site_code=SG&per_page=2`

### Response

- The returned Event will display the cities participating in the event with the cheapest price to each city if available

```
{
  id: 24,
  title: "English Spring Festival Title 2020",
  subtitle: "English Spring Festival Title subtitle",
  imageUrl: "https://assets.wego.com/image/upload/v1/places_events/staging/event_24.png",
  eventStart: "2020-01-25",
  eventEnd: "2020-02-05",
  eventCategory: "Festival",
  cities: [
    {
      id: 821,
      code: "BJS",
      name: "Beijing",
      permalink: "beijing",
      lat: 39.9042,
      long: 116.407,
      price: {
        amount: 103.85,
        amountUsd: 103.85,
        currencyCode: "USD"
      },
      enName: "Beijing",
      enPermalink: "beijing",
      countryId: 45,
      countryName: "China",
      countryPermalink: "china",
      countryCode: "CN"
    },
    {
      id: 1195,
      code: "CAN",
      name: "Guangzhou",
      permalink: "guangzhou",
      lat: 23.1291,
      long: 113.264,
      price: {
        amount: 107.56,
        amountUsd: 107.56,
        currencyCode: "USD"
        },
      enName: "Guangzhou",
      enPermalink: "guangzhou",
      countryId: 45,
      countryName: "China",
      countryPermalink: "china",
      countryCode: "CN"
    }
  ]
}
```

## GET Cities by Theme

```
GET /places/v1/themes/:id/cities
```

### Changelog

### Parameters

| Params   | Required? | Data Type | Description                                                            |
| -------- | --------- | --------- | ---------------------------------------------------------------------- |
| locale   | No        | String    | langugage that you want to get translated in for description and name. |
| per_page | No        | Integer   | Number of Events to return. Default set to 10, minimum set to 1.       |
| page     | No        | Integer   | Page number for result.Default set 10, minimum set to 1.               |

### Example

`/places/v1/themes/19/cities?per_page=3`

### Response

- List of Cities

```
{
  cities: [
    {
      id: 3907,
      code: "KUL",
      name: "Kuala Lumpur",
      permalink: "kuala-lumpur",
      cityId: 3907,
      cityCode: "KUL",
      cityName: "Kuala Lumpur",
      cityPermalink: "kuala-lumpur",
      worldRegionId: 2,
      worldRegionName: "Asia",
      worldRegionPermalink: "asia",
      worldRegionCode: "i",
      countryId: 133,
      countryName: "Malaysia",
      countryPermalink: "malaysia",
      countryCode: "MY",
      regionId: 231,
      regionName: "Peninsular Malaysia",
      regionPermalink: "peninsular-malaysia",
      lat: 3.139,
      long: 101.687,
      type: "city",
      hotelCount: 1986,
      airportCount: 2,
      timeZone: "+08:00",
      stationType: "city",
      ianaTimeZone: "Asia/Kuala_Lumpur",
      enName: "Kuala Lumpur",
      enPermalink: "kuala-lumpur",
      cityEnName: "Kuala Lumpur",
      cityEnPermalink: "kuala-lumpur",
      worldRegionEnName: "Asia",
      worldRegionEnPermalink: "asia",
      countryEnName: "Malaysia",
      countryEnPermalink: "malaysia"
    },
    {
      id: 5740,
      code: "PEN",
      name: "Penang",
      permalink: "penang",
      cityId: 5740,
      cityCode: "PEN",
      cityName: "Penang",
      cityPermalink: "penang",
      worldRegionId: 2,
      worldRegionName: "Asia",
      worldRegionPermalink: "asia",
      worldRegionCode: "i",
      countryId: 133,
      countryName: "Malaysia",
      countryPermalink: "malaysia",
      countryCode: "MY",
      regionId: 231,
      regionName: "Peninsular Malaysia",
      regionPermalink: "peninsular-malaysia",
      lat: 5.41635,
      long: 100.333,
      type: "city",
      hotelCount: 675,
      airportCount: 1,
      timeZone: "+08:00",
      stationType: "city",
      ianaTimeZone: "Asia/Kuala_Lumpur",
      enName: "Penang",
      enPermalink: "penang",
      cityEnName: "Penang",
      cityEnPermalink: "penang",
      worldRegionEnName: "Asia",
      worldRegionEnPermalink: "asia",
      countryEnName: "Malaysia",
      countryEnPermalink: "malaysia"
    },
    {
      id: 4113,
      code: "LGK",
      name: "Langkawi",
      permalink: "langkawi",
      cityId: 4113,
      cityCode: "LGK",
      cityName: "Langkawi",
      cityPermalink: "langkawi",
      worldRegionId: 2,
      worldRegionName: "Asia",
      worldRegionPermalink: "asia",
      worldRegionCode: "i",
      countryId: 133,
      countryName: "Malaysia",
      countryPermalink: "malaysia",
      countryCode: "MY",
      lat: 6.35,
      long: 99.8,
      type: "city",
      hotelCount: 458,
      airportCount: 1,
      timeZone: "+08:00",
      stationType: "city",
      ianaTimeZone: "Asia/Kuala_Lumpur",
      enName: "Langkawi",
      enPermalink: "langkawi",
      cityEnName: "Langkawi",
      cityEnPermalink: "langkawi",
      worldRegionEnName: "Asia",
      worldRegionEnPermalink: "asia",
      countryEnName: "Malaysia",
      countryEnPermalink: "malaysia"
    }
  ]
}
```
