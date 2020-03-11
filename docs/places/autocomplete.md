# Wego Autocomplete API

| Endpoint                                           | Description         |
| -------------------------------------------------- | ------------------- |
| [GET /places/search/nearest](#find-nearest-places) | Find nearest places |
| [GET /places/search](#search-places)               | Search places       |

## Find nearest places

### Purpose

Returns the nearest places based on given latitude and longitude.
Detects latitude and longitude from headers if not given through query params.

### Endpoint

```
GET /places/search/nearest
```

### Parameters

| Param         | Required? | Data Type | Default    | Description                                       |
| ------------- | --------- | --------- | ---------- | ------------------------------------------------- |
| latitude      | No        | Number    |            |                                                   |
| longitude     | No        | Number    |            |                                                   |
| radius        | No        | Number    | 20         | Radius (km) from the the latlong to search        |
| language      | No        | String    | en         | Language that the response will be in             |
| per_page      | No        | Number    | 20         | Number of results to return                       |
| page          | No        | Number    | 1          | Page to return for multiple page results          |
| key_transform | No        | String    | camelLower | Format of json keys. `camelLower` or `underscore` |
| min_airports  | No        | Number    |            | Filter places based on minimum airports count     |
| min_hotels    | No        | Number    |            | Filter places based on minimum hotels count       |
| types         | No        | Array of String(s) | [city, airport] | Type of place to search. Any combination of `city`, `airport`, `country`, `state`, `district`, or `hotel`. |

### Examples

* `/places/search/nearest`
* `/places/search/nearest?latitude=1.28873&longitude=103.854`
* `/places/search/nearest?latitude=13.740192&longitude=100.520889&language=en&radius=50`

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

## Search places

Search for places based on a given search term.

```
GET /places/search
```

### Parameters

| Param         | Required? | Data Type          | Default         | Description                                                                                                |
| ------------- | --------- | ------------------ | --------------- | ---------------------------------------------------------------------------------------------------------- |
| query         | Yes       | String             |                 | Term to search. Minimum number of characters is 2. Single characters will be ignored.                                                                                             |
| types         | No        | Array of String(s) | [city, airport] | Type of place to search. Any combination of `city`, `airport`, `country`, `state`, `district`, or `hotel`. |
| min_airports  | No        | Number             | 1               | Filter places based on minimum airports count. **Doesn't apply to type `hotel`**                           |
| min_hotels    | No        | Number             | 1               | Filter places based on minimum hotels count. **Doesn't apply to types other than `hotel`**                 |
| airline_code  | No        | String             |                 | Filter places that has route to the given IATA airline code.                                               |
| language      | No        | String             | en              | The language that the response will be in                                                                  |
| per_page      | No        | Number             | 20              | Number of results to return                                                                                |
| page          | No        | Number             | 1               | Page to return for multiple page results                                                                   |
| key_transform | No        | String             | camelLower      | Format of json keys. `camelLower` or `underscore`                                                          |

### Examples

* `/places/search?query=singa`
* `/places/search?query=singa&types[]=city&types[]=country`
* `/places/search?query=new&types[]=city&types[]=airport&min_airports=1`
* `/places/search?query=new&types[]=city&types[]=district&min_hotels=1`
* `/places/search?query=new&types[]=city&types[]=airport&min_airports=1&airline_code=AA`

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
