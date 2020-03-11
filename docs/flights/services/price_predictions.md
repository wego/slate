# Price Prediction Api

| Type  | Endpoint                                                 | Description            |
| ----- | -------------------------------------------------------- | ---------------------- |
| GET  | [/flights/price_predictions/by_exact_dates]                               | Query a matrix of best price for a route for oneway or roundtrip |
| GET  | [/flights/price_predictions/by_departure_dates]                               | Query best prices for a route and summary based on departure dates |
| GET  | [/flights/price_predictions/by_return_dates]                               | Query best prices for a route and summary based on return dates |
| GET  | [/flights/price_predictions/by_departure_months]                               | Query best price for a route and summary based on year_months |

## Collect Predicted Prices (matrix prices)

```GET flights/price_predictions/by_exact_dates```

#### Logic:

1. Query predicted prices as within matrix [departure_date from/to, return_date from/to] for a given route of today searches.
2. If departure/arrival_code are airports, returned price is its prices.
3. If departure code is city, returned price is the minimum among its airports to destination
4. Similarly, if arrival code is city, returned price is the minimum among its airports from source
5. Price will be converse from USD into the given currency code

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| departure_airport_code     | Yes if departure_city_code not present      | String    | A departure airport code |
| arrival_airport_code     | Yes if arrival_city_code not present      | String    | A arrival airport code |
| departure_city_code     | Yes if departure_airport_code not present      | String    | A departure city code |
| arrival_city_code     | Yes if arrival_airport_code not present    | String    | A arrival city code |
| trip_type             | Yes       | [oneway, roundtrip] | trip type |
| departure_date_from     | Yes       | String    | date string 'YYYY-MM-DD' for min departure date |
| departure_date_to     | Yes       | String    | date string 'YYYY-MM-DD' for max departure date |
| return_date_from     | if trip_type is roundtrip       | String    | date string 'YYYY-MM-DD' for min return date |
| return_date_to     | if trip_type is roundtrip       | String    | date string 'YYYY-MM-DD' for max return date |
| search_date       |  No |  String | date string 'YYYY-MM-DD' for search_date |
| site_code | Yes | String (Upper case) | site code |
| version | No | String (lower case) | version of the expected model, default is v1 |
| currency_code | No | String | expected currency |
| key_transform | No | ['camel', 'underscore'] | format for response json |

### Example
```/flights/price_predictions/by_exact_dates?departure_city_code=RUH&arrival_airport_code=CAI&departure_date_from=2019-05-02&departure_date_to=2019-05-04&return_date_from=2019-05-04&return_date_to=2019-05-05&trip_type=oneway&search_date=2019-03-11&site_code=SA&version=v1```


### Response
``` json
{
  "prices": [
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-02",
      "trip_type": "oneway",
      "site_code": "SA",
      "price_usd": 167.79867125835275,
      "error_rate": 21.3589,
      "currency_code": "USD",
      "price": 167.8,
      "price_bucket": 1
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-03",
      "trip_type": "oneway",
      "site_code": "SA",
      "price_usd": 167.79867125835275,
      "error_rate": 21.3589,
      "currency_code": "USD",
      "price": 167.8,
      "price_bucket": 1
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-04",
      "trip_type": "oneway",
      "site_code": "SA",
      "price_usd": 167.79867125835275,
      "error_rate": 21.3589,
      "currency_code": "USD",
      "price": 167.8,
      "price_bucket": 1
    }
  ],
  "indicator": {
    "buckets_usd": [115, 250, 385, 520],
    "buckets": [115, 250, 385, 520]
  }
}
```

## Collect Predicted Prices on departure dates

```GET flights/price_predictions/by_departure_dates```

#### Logic:
Similar with by_dates (always roundtrip) but be aggregated by departure_date

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| departure_airport_code     | Yes if departure_city_code not present      | String    | A departure airport code |
| arrival_airport_code     | Yes if arrival_city_code not present      | String    | A arrival airport code |
| departure_city_code     | Yes if departure_airport_code not present      | String    | A departure city code |
| arrival_city_code     | Yes if arrival_airport_code not present    | String    | A arrival city code |
| departure_date_from     | Yes       | String    | date string 'YYYY-MM-DD' for min departure date |
| departure_date_to     | Yes       | String    | date string 'YYYY-MM-DD' for max departure date |
| trip_duration_min     | Yes if trip_type is roundtrip      | String    | min of trip duration |
| trip_duration_max     | Yes if trip_type is roundtrip      | String    | max of trip duration |
| search_date       |  No |  String | date string 'YYYY-MM-DD' for search_date |
| site_code | Yes | String (Upper case) | site code |
| version | No | String (lower case) | version of the expected model, default as v1 |
| currency_code | No | String | expected currency |
| key_transform | No | ['camel', 'underscore'] | format for response json |

### Example
```/flights/price_predictions/by_departure_dates?departure_city_code=RUH&arrival_airport_code=CAI&departure_date_from=2019-05-02&departure_date_to=2019-05-04&trip_dration_min=1&trip_duration_max=10&search_date=2019-03-11&site_code=SA&version=v1```

### Response
``` json
{
  "prices": [
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-02",
      "return_date": "2019-05-05",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 295.7471179680954,
      "error_rate": 5.33262,
      "currency_code": "USD",
      "price": 295.75,
      "price_bucket": 2
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-03",
      "return_date": "2019-05-05",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 293.25503438922976,
      "error_rate": 5.33262,
      "currency_code": "USD",
      "price": 293.26,
      "price_bucket": 2
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-04",
      "return_date": "2019-05-05",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 285.7276268339122,
      "error_rate": 5.33262,
      "currency_code": "USD",
      "price": 285.73,
      "price_bucket": 2
    }
  ],
  "indicator": {
    "buckets_usd": [115, 250, 385, 520],
    "buckets": [115, 250, 385, 520]
  }
}
```

## Collect Predicted Prices on return dates

```GET flights/price_predictions/by_return_dates```

#### Logic:
Similar with by_dates (always roundtrip) but be aggregated by return_date

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| departure_airport_code     | Yes if departure_city_code not present      | String    | A departure airport code |
| arrival_airport_code     | Yes if arrival_city_code not present      | String    | A arrival airport code |
| departure_city_code     | Yes if departure_airport_code not present      | String    | A departure city code |
| arrival_city_code     | Yes if arrival_airport_code not present    | String    | A arrival city code |
| return_date_from     | Yes       | String    | date string 'YYYY-MM-DD' for min departure date |
| return_date_to     | Yes       | String    | date string 'YYYY-MM-DD' for max departure date |
| trip_duration_min     | Yes if trip_type is roundtrip      | String    | min of trip duration |
| trip_duration_max     | Yes if trip_type is roundtrip      | String    | max of trip duration |
| search_date       |  No |  String | date string 'YYYY-MM-DD' for search_date |
| site_code | Yes | String (Upper case) | site code |
| version | No | String (lower case) | version of the expected model, default as v1 |
| currency_code | No | String | expected currency |
| key_transform | No | ['camel', 'underscore'] | format for response json |

### Example
```/flights/price_predictions/by_return_dates?departure_city_code=RUH&arrival_airport_code=CAI&return_date_from=2019-05-02&return_date_to=2019-05-04&trip_type=roundtrip&search_date=2019-03-11&trip_duration_min=1&trip_duration_max=10&site_code=SA&version=v1```

### Response
``` json
{
  "prices": [
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-01",
      "return_date": "2019-05-02",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 301.1644520824526,
      "error_rate": 17.0496,
      "currency_code": "USD",
      "price": 301.16,
      "price_bucket": 2
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-02",
      "return_date": "2019-05-03",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 301.1644520824526,
      "error_rate": 17.0496,
      "currency_code": "USD",
      "price": 301.16,
      "price_bucket": 2
    },
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-05-03",
      "return_date": "2019-05-04",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 301.1644520824526,
      "error_rate": 17.0496,
      "currency_code": "USD",
      "price": 301.16,
      "price_bucket": 2
    }
  ],
  "indicator": {
    "buckets_usd": [115,250,385,520],
    "buckets": [115,250,385,520]
  }
}
```

## Collect Predicted Prices on departure month

```GET flights/price_predictions/by_departure_months```

#### Logic:
Similar with by_dates (always roundtrip) but be aggregated by departure month

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| departure_airport_code     | Yes if departure_city_code not present      | String    | A departure airport code |
| arrival_airport_code     | Yes if arrival_city_code not present      | String    | A arrival airport code |
| departure_city_code     | Yes if departure_airport_code not present      | String    | A departure city code |
| arrival_city_code     | Yes if arrival_airport_code not present    | String    | A arrival city code |
| year_months     | Yes      | Array[String]    | list of months in format 'YYYY-MM' |
| trip_duration_min     | Yes      | String    | min of trip duration |
| trip_duration_max     | Yes       | String    | max of trip duration |
| search_date       |  No |  String | date string 'YYYY-MM-DD' for search_date |
| site_code | Yes | String (Upper case) | site code |
| version | No | String (lower case) | version of the expected model, default as v1 |
| currency_code | No | String | expected currency |
| key_transform | No | ['camel', 'underscore'] | format for response json |

### Example
```/flights/price_predictions/by_departure_months?departure_city_code=RUH&arrival_airport_code=CAI&search_date=2019-03-11&site_code=SA&version=v1&trip_duration_min=1&trip_duration_max=5&year_months[]=2019-06```

### Response
``` json
{
  "prices": [
    {
      "departure_airport_code": "RUH",
      "arrival_airport_code": "CAI",
      "departure_city_code": "RUH",
      "arrival_city_code": "CAI",
      "departure_date": "2019-06-01",
      "return_date": "2019-06-02",
      "trip_type": "roundtrip",
      "site_code": "SA",
      "price_usd": 357.25495472400513,
      "error_rate": 17.0496,
      "currency_code": "USD",
      "price": 357.25,
      "price_bucket": 2
    }
  ],
  "indicator": {
    "buckets_usd": [115,250,385,520],
    "buckets": [115,250,385,520]
  }
}
```
