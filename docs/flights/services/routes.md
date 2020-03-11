# Routes Api

| Type  | Endpoint                                                                         | Description                                       |
| ----- | -------------------------------------------------------------------------------- | ------------------------------------------------- |
| GET   | [/flights/v1/routes/popular](#list-popular-routes-by-airline-and-departure-city) | List Popular Routes by Airline and Departure City |
| GET   | [/flights/v1/routes/trend](#list-popular-routes-by-airline-and-departure-city)   | List Trend Routes                                 |
| GET   | [/flights/v1/routes/multistop](#multistop-routes-by-airline)                     | Multistop Routes By Airline                       |
| GET   | [/flights/v1/routes](#popular-routes-by-route-type)                              | Popular Routes by Different Route Type            |
| POST  | [/flights/v1/routes](#create-route )                                             | Create Route                                      |
| PATCH | [/flights/v1/routes/:id](#update-route )                                         | Update Route                                      |
| DEL   | [/flights/v1/routes/:id](#delete-route )                                         | Delete Route                                      |

## List Popular Routes by Airline and Departure city

```GET flights/v1/routes/popular```


#### Logic:

1.  Attempts to find the route in `monthly airline route table` by `airline_code` & `departure_city_code`
    If found, returns the routes sorted by lowest monthly price. 

    > Monthly Airline Route table shows all routes of an airline with its cheapest monthly price by month (monthly_price column in db) and cheapeast yearly price (best_monthly_price column in db).

2.  If not found, departure_city_code wil be replace with airline hub city code and look up Monthly Airline Route table again.

3.  If airline or airline hub city code is not found, returns empty array `[]` with `status: 200`


### Parameters
| Property          | Required? | Data Type | Description                                                         |
| ----------------- | --------- | --------- | ------------------------------------------------------------------- |
| airlineCode       | Yes       | String    |
| departureCityCode | Yes       | String    |
| language          | Yes       | String    | The language that the response will be in. English as default       |
| siteCode          | Yes       | String    | Country Code of the user                                            |
| appType           | Yes       | String    | The application type of the originating request                     |
| deviceType        | yes       | String    | The device type of the originating request                          |
| currencyCode      | yes       | String    | Currency code in which you want the fares to be in. USD as default. |

### Example
```/flights/v1/routes/popular?airlineCode=TR&departureCityCode=MNL&language=en&siteCode=sg&appType=web&deviceType=mobile&currencyCode=SGD```

#### Sample response body
```json
[
   {
    "departure": {
      "city": {
        "code": "MNL",
        "name": "Manila",
        "permalink": "manila"
      },
      "country": {
        "code": "PH",
        "name": "Philippines",
        "permalink": "philippines"
      }
    },
    "arrival": {
      "city": {
        "code": "SIN",
        "name": "Singapore",
        "permalink": "singapore"
      },
      "country": {
        "code": "SG",
        "name": "Singapore",
        "permalink": "singapore"
      }
    },
    "price": {
      "currencyCode": "SGD",
      "amount": "91.16",
      "amountUsd": 65.346344,
      "display": "S$91"
    }
  }
]
```

___

## List Trend Routes by Departure City and Arrival City 

```GET flights/v1/routes/trend```

#### Logic:

1.  Attempts to find the route in `monthly route table` by `departure_city_code` & `arrival_city_code`.

    If found, returns the routes with monthly prices in trend key. 

    > Monthly Airline Route table shows routes with its cheapest monthly price by month (monthly_price column in db) and cheapest yearly price (best_monthly_price column in db).

2.  If route not found, returns `status: 404 not found`


### Parameters

| Property          | Required? | Data Type | Description                                                                                          |
| ----------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| departureCityCode | Yes       | String    |
| arrivalCityCode   | Yes       | String    |
| language          | Yes       | String    | The language that the response will be in. English as default                                        |
| siteCode          | Yes       | String    | Country Code of the user                                                                             |
| appType           | Yes       | String    | The application type of the originating request                                                      |
| deviceType        | yes       | String    | The device type of the originating request                                                           |
| currencyCode      | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |

### Examples
```/flights/v1/routes/trend?departureCityCode=LON&arrivalCityCode=SGN&language=ar&siteCode=sg&appType=web&deviceType=mobile&currencyCode=SGD```

### Response
``` json
{
  "departure": {
    "city": {
      "code": "LON",
      "name": "لندن",
      "permalink": "london"
    },
    "country": null
  },
  "arrival": {
    "city": {
      "code": "SGN",
      "name": "مدينة هوشي منه",
      "permalink": "ho-chi-minh-city"
    },
    "country": null
  },
  "trend": [
    [
      7,
      {
        "currencyCode": "SGD",
        "amount": "859.91",
        "amountUsd": 614,
        "display": "S$860"
      }
    ],
    [
      12,
      {
       "currencyCode": "SGD",
        "amount": "1123.47",
        "amountUsd": 838,
        "display": "S$1,123"
      }
    ]
  ]
}
```
___

## Multistop Routes By Airline

```GET flights/v1/routes/multistop```

#### Logic:

1. Query `MultiStopRoute` table based on parameters parsed in. It will return the leg objects. `departure_city_code` allows string and array due to front end requirement.
> MultiStopRoute data comes from bigquery. Contains all routes of an airline.
2. Based on leg object, get cities and airlines. 
3. If airline_code or any params not found, returns hash with empty values. Example: ```{
    "legs": [],
    "cities": [],
    "airlines": []
}```

### Parameters

| Property            | Required? | Type           | Description                                            | Default |
| ------------------- | --------- | -------------- | ------------------------------------------------------ | ------- |
| airline_code        | Yes       | String         | Airline code                                           |         |
| departure_city_code | No        | String / Array | Departure city code                                    |         |
| arrival_city_code   | No        | String         | Arrival city code                                      |         |
| page                | No        | String         | Offset number                                          | 1       |
| per_page            | No        | String         | number to return                                       | 10      |
| language/locale     | No        | String         | language of result                                     | en      |
| localized_time      | No        | String         | Set to true to return translated time in HH:MM format  | false   |

### Changelog

**06/07/2018**: Add ```localized_time``` params to allow users to change the format and translate ```tripDuration``` from minutes to hours and minutes. For example, if ```localized_time``` set to ```true``` and:
  - ```language == en```: ```tripDuration``` will be ```5h``` instead of ```300```
  - ```language == ar```: ```tripDuration``` will be ```07ساعة 30دقيقة``` instead of ```450```

### Example 1:
```/flights/v1/routes/multistop?airline_code=SQ&page=1&perPage=1000&language=en&departure_city_code=HAN```

### Response
``` json
{
    "legs": [
      {
        "stopsCount": 0,
        "tripDuration": 175,
        "segments": [
            {
                "departureCityCode": "HAN",
                "arrivalCityCode": "SIN",
                "airlineCode": "SQ"
            }
        ]
      },
      {
        "stopsCount": 1,
        "tripDuration": 300,
        "segments": [
            {
                "departureCityCode": "HAN",
                "arrivalCityCode": "BKK",
                "airlineCode": "QR"
            },
            {
                "departureCityCode": "BKK",
                "arrivalCityCode": "SIN",
                "airlineCode": "SQ"
            }
        ]
        }
    ],
    "cities": [
      {
        "name": "Hanoi",
        "code": "HAN",
        "lat": 21.0278,
        "long": 105.834,
        "timeZone": "GMT+07:00"
      },
      {
        "name": "Singapore",
        "code": "SIN",
        "lat": 1.35208,
        "long": 103.82,
        "timeZone": "GMT+08:00"
      },
      {
        "name": "Bangkok",
        "code": "BKK",
        "lat": 13.7563,
        "long": 100.502,
        "timeZone": "GMT+07:00"
      }
    ],
    "airlines": [
      {
        "name": "Qatar Airways",
        "code": "QR"
      },
      {
        "name": "Singapore Airlines",
        "code": "SQ"
      }
    ]
}
```

### Example 2:
```/flights/v1/routes/multistop?airline_code=SQ&page=1&perPage=1000&language=ar&departure_city_code=HAN&localized_time=true```

### Response
``` json
{
    "legs": [
      {
        "stopsCount": 0,
        "tripDuration": 06ساعة 55دقيقة",,
        "segments": [
            {
                "departureCityCode": "HAN",
                "arrivalCityCode": "SIN",
                "airlineCode": "SQ"
            }
        ]
      },
      {
        "stopsCount": 1,
        "tripDuration": 05ساعة",,
        "segments": [
            {
                "departureCityCode": "HAN",
                "arrivalCityCode": "BKK",
                "airlineCode": "QR"
            },
            {
                "departureCityCode": "BKK",
                "arrivalCityCode": "SIN",
                "airlineCode": "SQ"
            }
        ]
        }
    ],
    "cities": [
      {
        "name": "Hanoi",
        "code": "HAN",
        "lat": 21.0278,
        "long": 105.834,
        "timeZone": "GMT+07:00"
      },
      {
        "name": "Singapore",
        "code": "SIN",
        "lat": 1.35208,
        "long": 103.82,
        "timeZone": "GMT+08:00"
      },
      {
        "name": "Bangkok",
        "code": "BKK",
        "lat": 13.7563,
        "long": 100.502,
        "timeZone": "GMT+07:00"
      }
    ],
    "airlines": [
      {
        "name": "Qatar Airways",
        "code": "QR"
      },
      {
        "name": "Singapore Airlines",
        "code": "SQ"
      }
    ]
}
```  
___

## Popular Routes By Route Type

```GET /flights/v1/routes```

#### Logic:
1. check for routes_type. returns empty array `[]` if invalid `routes_type`. results return are gotten from `monthly routes` table. Sorted by price in ascending order.

2. Point to note: For country_to_city,  if no `arrival_city_code` is parsed, it gets popular cities instead. 

### Parameters

| Property             | Required? | Data Type | Description                                                                                                                            |
| -------------------- | --------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| routesType           | Yes       | String    | Accepts one of the following values: `country_to_city`, `country_to_country`, `cities_to_country`, `city_to_country`, `cities_to_city` |
| departureCityCode    | No        | String    | Mandatory if routesType is `country_to_country`, `city_to_country`                                                                     |
| arrivalCityCode      | No        | String    | Mandatory if routesType is `country_to_country`, `cities_to_city`                                                                      |
| departureCountryCode | No        | String    | Mandatory if routesType is `country_to_city`                                                                                           |
| arrivalCountryCode   | No        | String    | Mandatory if routesType is `cities_to_country`, `city_to_country`                                                                      |
| currencyCode         | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format                                   |
| language             | Yes       | String    | The language that the response will be in. English as default                                                                          |
| siteCode             | Yes       | String    | Country Code of the user                                                                                                               |
| appType              | Yes       | String    | The application type of the originating request                                                                                        |
| deviceType           | yes       | String    | The device type of the originating request                                                                                             |

### Example
```/flights/v1/routes?routesType=country_to_city&departureCountryCode=SG&language=en&siteCode=sg&appType=web&deviceType=mobile&currencyCode=USD```

### Response
``` json
    {
        "departure": {
            "city": null,
            "country": {
                "code": "SG",
                "name": "Singapore",
                "permalink": "singapore"
            }
        },
        "arrival": {
            "city": {
                "code": "TPE",
                "name": "Taipei",
                "permalink": "taipei"
            },
            "country": null
        },
        "price": {
            "currencyCode": "USD",
            "amount": "10.16094",
            "amountUsd": "10.16094",
            "display": "US$10"
        }
    },
    {
        "departure": {
            "city": null,
            "country": {
                "code": "SG",
                "name": "Singapore",
                "permalink": "singapore"
            }
        },
        "arrival": {
            "city": {
                "code": "KHH",
                "name": "Kaohsiung",
                "permalink": "kaohsiung"
            },
            "country": null
        },
        "price": {
            "currencyCode": "USD",
            "amount": "11.96809",
            "amountUsd": "11.96809",
            "display": "US$12"
        }
    }
]
```
## Create Route
`POST /flights/v1/routes`

### Logic
1. Required parameters are by database level validation. Not application validation.
2. departure_code, arrival_code, airline_code has to be unique combination.

### Parameters
| Property       | Required? | Data Type | Description                                  |
| -------------- | --------- | --------- | -------------------------------------------- |
| departure_code | Yes       | String    | 3 letter city code                           |
| arrival_code   | Yes       | String    | 3 letter city code                           |
| airline_code   | Yes       | String    |                                              |
| source         | Yes       | String    | Where is the information from                |
| status         | No        | String    | "active", "codeshare" "inactive", "outdated" |
| popularity     | No        | Integer   |                                              |
| direct         | No        | Integer   |                                              |

### Example Request Body
``` json 
{
	"departure_code": "BKK",
	"arrival_code": "SIN",
	"airline_code": "AC",
	"source": "neo"
}
```

### Response
``` json
{
    "departure": {
        "city": null,
        "country": null
    },
    "arrival": {
        "city": null,
        "country": null
    }
}
```
___

## Update Route

`PATCH /flights/v1/routes/:id`

### Parameters
| Property       | Required? | Data Type | Description                                  |
| -------------- | --------- | --------- | -------------------------------------------- |
| departure_code | No        | String    | 3 letter city code                           |
| arrival_code   | No        | String    | 3 letter city code                           |
| airline_code   | No        | String    |                                              |
| source         | No        | String    | Where is the information from                |
| status         | No        | String    | "active", "codeshare" "inactive", "outdated" |
| popularity     | No        | Integer   |                                              |
| direct         | No        | Integer   |                                              |

### Example Request Body
``` json 
{
  "departure_code": "BKK", 
  "status": "inactive"
}
```

### Response
``` json
  {
    "departure": {
        "city": null,
        "country": null
    },
    "arrival": {
        "city": null,
        "country": null
    },
    "popularity": 1
}
```

___

## Delete Route
`DEL /flights/v1/routes/:id`
### Logic
Return status 200 ok if delete successful
___

