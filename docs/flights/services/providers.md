# Providers Api

| Type  | Endpoint                                                     | Description                                                                                |
| ----- | ------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| GET   | [/flights/providers](#list-providers)                        | List all providers by all parameters                                                       |
| POST  | [/flights/providers](#create-provider )                      | Create provider                                                                            |
| PATCH | [/flights/providers/:id](#update-provider )                  | Update provider                                                                            |
| DEL   | [/flights/providers/:id](#delete-provider )                  | Delete provider                                                                            |
| GET   | [/flights/providers/leaderboard](#get-top-clicked-providers) | List of top clicked providers based on the given departure city code and arrival city code |
| GET   | [/flights/v1/providers/featured](#get-featured-providers)    | List the information of the featured providers                                             |

# List providers

```GET flights/providers```

#### Logic:

1. Checks if status is given as a parameter. Returns a list of providers according to parameters specified.

### Parameters
| Property | Required? | Data Type | Description                                                   |
| -------- | --------- | --------- | ------------------------------------------------------------- |
| status   | No        | String    | Status of the providers to be listed                          |
| page     | No        | Integer   | Start page of providers                                       |
| per_page | No        | Integer   | Returns the number of results specified. Default value is 11. |

### Example
```/flights/?page=10&per_page=3&status=production```


### Response
```
 {
        "id": 76,
        "posCode": "budgetair.fr",
        "code": "budgetair.nl",
        "siteCodes": "[\"*\"]",
        "locales": "[\"fr\"]",
        "status": "production"
    },
    {
        "id": 77,
        "posCode": "vayama.ie",
        "code": "budgetair.nl",
        "siteCodes": "[\"IE\"]",
        "locales": "[\"en\"]",
        "status": "production"
    },
    {
        "id": 78,
        "posCode": "budgetair.co.uk",
        "code": "budgetair.nl",
        "siteCodes": "[\"GB\"]",
        "locales": "[\"en\"]",
        "status": "production"
    }
```



___

## Create Provider

```POST flights/providers```

#### Logic
1. Note for callback to save in `provider_terms_conditions`
2. Note for callback to save in `provider_supports`


### Parameters
| Property          | Required? | Data Type | Description                                                                                 |
| ----------------- | --------- | --------- | ------------------------------------------------------------------------------------------- |
| name              | Yes       | String    | The language that the response will be in. English as default. Has to be unique.            |
| provider_type     | Yes       | String    | Types of Providers                                                                          |
| provider_code     | Yes       | String    | Provider's code                                                                             |
| pos_provider_code | Yes       | String    | Provider's code for point of sales. Has to be unique.                                       |
| status            | Yes       | String    | Type of status of Provider. Only accepts : <li>production</li><li>staging</li><li>down</li> |
| status_in_sem     | Yes       | String    | Type of status of Provider. Only accepts : <li>active</li><li>inactive</li>                 |
| rank_by_ecpc      | No        | Integer   | Rank of provider by ecpc                                                                    |
| ecpc              | No        | Integer   | Ecpc of Provider                                                                            |
| site_codes        | No        | Array     | List of countries of provider with site codes                                               |
| no_site_codes     | No        | Array     | List of countries of provider without site codes                                            |
| device_types      | No        | Array     | Type of devices accepted by providers                                                       |
| app_types         | No        | Array     | Type of applications accepted by providers                                                  |
| passenger_types   | No        | Array     | Type of passengers accepted by Provider                                                     |
| locales           | No        | Array     | Type of language available from provider                                                    |
| currency_codes    | No        | Array     | Type of currencies                                                                          |
| cabins            | No        | Array     | Type of cabins provided by provider                                                         |
| departure_codes   | No        | Array     | Departure codes available from provider                                                     |


### Example
```/flights/providers```

### Request Body
``` json
{
  "name": "Meow airways",
  "provider_type": "airline",
  "provider_code": "meow.airways.com",
  "pos_provider_code": "meowairways.com",
  "status": "staging",
  "status_in_sem": "active",
  "app_types": ["ANDROID_APP", "ANDROID_TABLET_APP", "IOS_APP", "IOS_TABLET_APP", "WEB_APP", "MOBILE_WEB_APP"],
  "passenger_types": ["adults", "children", "infants"]
}
```
### Response
returns the object created
```  json
{
    "id": 1102,
    "posCode": "meowairways.com",
    "code": "meow.airways.com",
    "status": "staging"
}
```

___
## Update Provider

```PATCH flights/providers/:id```
### Logic
1. Note for callback to save in `provider_terms_conditions`
2. Note for callback to save in `provider_supports` 

### Parameters
| Property          | Required? | Data Type | Description                                                                                 |
| ----------------- | --------- | --------- | ------------------------------------------------------------------------------------------- |
| id                | Yes       | Integer   | Id of the provider to be updated.                                                           |
| name              | No        | String    | The language that the response will be in. English as default. Has to be unique.            |
| provider_type     | No        | String    | Types of Providers                                                                          |
| provider_code     | No        | String    | Provider's code                                                                             |
| pos_provider_code | No        | String    | Provider's code for point of sales. Has to be unique.                                       |
| status            | No        | String    | Type of status of Provider. Only accepts : <li>production</li><li>staging</li><li>down</li> |
| status_in_sem     | No        | String    | Type of status of Provider. Only accepts : <li>active</li><li>inactive</li>                 |
| rank_by_ecpc      | No        | Integer   | Rank of provider by ecpc                                                                    |
| ecpc              | No        | Integer   | Ecpc of Provider                                                                            |
| site_codes        | No        | Array     | List of countries of provider with site codes                                               |
| no_site_codes     | No        | Array     | List of countries of provider without site codes                                            |
| device_types      | No        | Array     | Type of devices accepted by providers                                                       |
| app_types         | No        | Array     | Type of applications accepted by providers                                                  |
| passenger_types   | No        | Array     | Type of passengers accepted by Provider                                                     |
| locales           | No        | Array     | Type of language available from provider                                                    |
| currency_codes    | No        | Array     | Type of currencies                                                                          |
| cabins            | No        | Array     | Type of cabins provided by provider                                                         |
| departure_codes   | No        | Array     | Departure codes available from provider                                                     |  |

### Example
```/flights/providers/1107```

### Request Body
``` json
{
  "name": "Meow airways",
  "provider_type": "airline",
  "provider_code": "meow.airways.com",
  "pos_provider_code": "meowairways.com",
  "status": "staging",
  "status_in_sem": "active",
  "app_types": ["ANDROID_APP", "ANDROID_TABLET_APP", "IOS_APP", "IOS_TABLET_APP", "WEB_APP", "MOBILE_WEB_APP"],
  "passenger_types": ["adults", "children","infants"],
  "cabins": ["economy","business","first"]
}
```
### Response
returns the object created
```  json
{
    "id": 1107,
    "posCode": "meowairways.com",
    "code": "meow.airways.com",
    "status": "staging"
}
```
___

## Delete Provider

```delete flights/providers/:id```

### Example
```/flights/providers/10```

### Response
status 200 ok
___

### Get top clicked providers

```
GET /flights/providers/leaderboard
```
#### Logic:

Retrieve the list of top clicked providers based on the given departure city code and arrival city code through big query, where queries were made with the city codes and limited by `per_page`.

### Parameters
| Property            | Required? | Data Type | Description                                                                                      |
| ------------------- | --------- | --------- | ------------------------------------------------------------------------------------------------ |
| departure_city_code | Yes       | String    | The code of the departure city                                                                   |
| arrival_city_code   | Yes       | String    | The code of the arrival city                                                                     |
| per_page            | No        | Integer   | Returns the number of results specified. Default value is `5`.                                   |
| key_transform       | No        | String    | Format of json keys. can be either `camel_lower` or `underscore`. Default value is `camel_lower` |

### Example
`/flights/providers/leaderboard?departure_city_code=SIN&arrival_city_code=SGN&key_transform=underscore&per_page=5`

### Response
```
[
    {
        "provider_code": "vietjetair.com",
        "rank1": 1,
        "rank2": 4
    },
    {
        "provider_code": "flyscoot.com",
        "rank1": 2,
        "rank2": 1
    },
    {
        "provider_code": "tiket.com",
        "rank1": 3,
        "rank2": 2
    },
    {
        "provider_code": "english.ctrip.com",
        "rank1": 4,
        "rank2": 6
    },
    {
        "provider_code": "vivavivu.com",
        "rank1": 5,
        "rank2": 1
    }
]
```
---
### Get featured providers

```
GET flights/v1/providers/featured
```

#### Logic:

Retrieve the list of featured providers based on the given site code.

### Parameters

| Property | Required? | Data Type | Description              |
| -------- | --------- | --------- | ------------------------ |
| siteCode | Yes       | String    | Country Code of the user |
| app      | No        | String    | flight                   |



### Example
  * `https://srv.wego.com/flights/v1/providers/featured?&siteCode=IN&page=0&perPage=12&app=flight`

### Response
```
[  
   {
        "providerCode": "wego.com-easemytrip.com",
        "providerName": "Easemytrip via Wego",
        "spriteImage": {
            "width": 80,
            "height": 48,
            "x": 0,
            "y": 350,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_48,q_auto,w_80/v1527500227/featured-provider-logo-IN-flight.png"
        }
    },
    {
        "providerCode": "in.musafir.com",
        "providerName": "in.musafir.com",
        "spriteImage": {
            "width": 80,
            "height": 48,
            "x": 0,
            "y": 200,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_48,q_auto,w_80/v1527500227/featured-provider-logo-IN-flight.png"
        }
    },
    {
        "providerCode": "akbartravels.com",
        "providerName": "akbartravels.com",
        "spriteImage": {
            "width": 80,
            "height": 48,
            "x": 0,
            "y": 0,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_48,q_auto,w_80/v1527500227/featured-provider-logo-IN-flight.png"
        }
    },
    {
        "providerCode": "cheapticket.in",
        "providerName": "cheapticket.in",
        "spriteImage": {
            "width": 80,
            "height": 48,
            "x": 0,
            "y": 50,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_48,q_auto,w_80/v1527500227/featured-provider-logo-IN-flight.png"
        }
    }
]
```