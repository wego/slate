# Wego Flights Metasearch API

The API returns live prices from all our providers for the requested search parameters. One-way, round-trip and multi-city (up to 6 legs) searches are suppported.

* [Create new flights search](#create-new-flights-search)
* [Fetch flights search results](#fetch-flights-search-results)
* [Get Trip Details](#get-trip-details)
* [Get flight deeplink V3](#get-flight-deeplink-v3)
* [Create new flight partner search](#create-new-flight-partner-search)
* [Fetch flight partner requests results](#fetch-flight-partner-requests-results)

## Create new flights search

```
POST metasearch/flights/searches
```

Input


| Property | Required? | Data Type | Description
| ------------- |-------------| -------------| -------------|
| siteCode | No | String | Country Code of the user. Must be in ISO country code format. <br /> If you are not able to set this, XX will be used and certain content might be unavailable
| locale | No | String |The language that the response will be in. <br /> en as default
| currencyCode | No | String | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format
| deviceType | Yes | String | The device type of the originating request
| appType | Yes | String | The application type of the originating request
| adultsCount | Yes | Integer | Must be a number greater than or equal to 1 and smaller than or equal to 10
| childrenCount | No | Integer | Must be a number greater than or equal to 0 and smaller than or equal to 10
| infantsCount | No | Integer | Must be a number greater than or equal to 0 and smaller than or equal to 2
| cabin | Yes | String | `economy` as default. Can be `economy`, `business`, `first`
| legs | Yes | Array | Must contain at least one Leg (oneway). A roundtrip request contains two legs. A multi-city request contains up to 6 legs.
| paymentMethodIds | Array |

**Leg Object**

A search request object must have at least 1 leg:

- 1 Leg - oneway
- 2 Legs - roundtrip (departure/arrival codes of the first leg = arrival/departure codes of the second leg)
- 2-6 Legs - multi-city trip (in case of 2 legs departure/arrival codes of the first leg are not necessarily equal to arrival/departure codes of the second leg)

A user can search for a specific airport or a specific city. This distinction is useful for cities with multiple airports, the user can search for a specific airport (CGK) for a given city, or all airports for a given city (JKT).

| Property | Required? | Data Type | Description
| ------------- |-------------| -------------| -------------|
| departureAirportCode* | Yes, if no `departureCityCode` | String | IATA Airport Code
| departureCityCode* | Yes, if no `departureAirporCode` | String | IATA City Code
| arrivalAirportCode* | Yes, if no `arrivalCityCode` | String | IATA Airport Code
| arrivalCityCode* | Yes, if no `arrivalAirportCode` | String | IATA City Code
| outboundDate | Yes | Date | Formatted as YYYY-mm-dd. This is assumed to be in departure time zone.

**A user can search for a specific airport or a specific city. This distinction is useful for cities with multiple airports, the user can search for a specific airport (CGK) for a given city, or all airports for a given city (JKT). Another example is searching only for JFK instead of NYC.*

**Validation**

In addition to all the `Required` fields above, we also apply the following validation on user request:

- Departure/arrival dates can not be in the past (need to be careful here because when it is "today" in some parts of the world, it is still "yesterday" in other parts). so maybe we can compare departure/arrival dates to the current date - 1 day.
- Departure/arrival dates also can not be more than current date + 365 days
- Departure/arrival date must have format `yyyy-MM-d`
- Total number of passengers can not be more than 9
- Number of infants can not be more than number of adults
- Number of legs must less than or equal 6

When the validation fails, server will return response with status `422 Unprocessable Entity` and body:

```
{
    "errors": [
        "error message here"
    ]
}
```

### Example (round-trip)

```
{
    "search": {
        "siteCode": "SG",
        "locale": "en",
        "currencyCode": "SGD",
        "deviceType": "DESKTOP",
        "cabin": "economy",
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "legs": [
            {
                "departureAirportCode": "SIN",
                "arrivalCityCode": "JKT",
                "outboundDate": "2017-04-09"
            },
            {
                "departureAirportCode": "JKT",
                "arrivalCityCode": "SIN",
                "outboundDate": "2017-04-20"
            }
        ]
    },
    "paymentMethodIds": []
}
```

### Response (round-trip)

* `count` should be used as an `offset` value in the next request, and it does not indicate a total number of fares in the response.

```
Status: 201 Created
```

```
{
  "count": 0,
  "search": {
    "id": "eNLyvo97obL",
    "cabin": "economy",
    "adultsCount": 1,
    "childrenCount": 0,
    "infantsCount": 0,
    "siteCode": "SG",
    "currencyCode": "SGD",
    "locale": "en",
    "deviceType": "desktop",
    "appType": "web",
    "createdAt": "2017-03-27T03:10:07.189Z",
    "legs": [
      {
        "id": "SIN:cJKT:2017-04-09",
        "outboundDate": "2017-04-09",
        "departureAirportCode": "SIN",
        "arrivalCityCode": "JKT",
        "departureCity": {
          "code": "SIN",
          "name": "Singapore",
          "enName": "Singapore",
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryEnName": "Singapore",
          "worldRegionCode": "I",
          "worldRegionName": "Asia",
          "worldRegionEnName": "Asia"
        },
        "arrivalCity": {
          "code": "JKT",
          "name": "Jakarta",
          "enName": "Jakarta",
          "countryCode": "ID",
          "countryName": "Indonesia",
          "countryEnName": "Indonesia",
          "worldRegionCode": "I",
          "worldRegionName": "Asia",
          "worldRegionEnName": "Asia"
        }
      },
      {
        "id": "cJKT:SIN:2017-04-20",
        "outboundDate": "2017-04-20",
        "departureCityCode": "JKT",
        "arrivalAirportCode": "SIN",
        "departureCity": {
          "code": "JKT",
          "name": "Jakarta",
          "enName": "Jakarta",
          "countryCode": "ID",
          "countryName": "Indonesia",
          "countryEnName": "Indonesia",
          "worldRegionCode": "I",
          "worldRegionName": "Asia",
          "worldRegionEnName": "Asia"
        },
        "arrivalCity": {
          "code": "SIN",
          "name": "Singapore",
          "enName": "Singapore",
          "countryCode": "SG",
          "countryName": "Singapore",
          "countryEnName": "Singapore",
          "worldRegionCode": "I",
          "worldRegionName": "Asia",
          "worldRegionEnName": "Asia"
        }
      }
    ]
  },
  "airlines": [],
  "airports": [],
  "cities": [],
  "providers": [],
  "countries": [],
  "trips": [],
  "fares": [],
  "routeSponsors": [],
  "scores": {},
  "paymentMethods": [],
  "fareConditions": [],
  "faresCount": {}
}

```

### Example (multi-city)

```
{
  "search": {
  	
    "cabin": "economy",
    "adultsCount": 1,
    "childrenCount": 0,
    "infantsCount": 0,
    "siteCode": "US",
    "currencyCode": "USD",
    "locale": "en",
    "legs": [
      {
        "departureCityCode": "SGN",
        "arrivalCityCode": "SIN",
        "outboundDate": "2017-11-30"
      },
      {
        "departureCityCode": "SIN",
        "arrivalCityCode": "LON",
        "outboundDate": "2017-12-05"
      },
      {
        "departureCityCode": "LON",
        "arrivalCityCode": "PAR",
        "outboundDate": "2017-12-10"
      }
    ]
  },
  "offset": 0
}
```

---

## Fetch flights search results

**Call the same endpoint with the same request, you will get more and more fares.**

Additional Input

- `offset` - use the value for the `count` from the  previous response for the next call, so that it will return only the delta.

```
{
    "search": {
        "siteCode": "SG",
        "locale": "en",
        "currencyCode": "SGD",
        "deviceType": "DESKTOP",
        "cabin": "economy",
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "legs": [
            {
                "departureAirportCode": "SIN",
                "arrivalCityCode": "JKT",
                "outboundDate": "2017-04-09"
            },
            {
                "departureAirportCode": "JKT",
                "arrivalCityCode": "SIN",
                "outboundDate": "2017-04-20"
            }
        ]
    },
    "paymentMethodIds": [],
    "offset": 0
}
```

1st Response
```
{
  "count": 0
}
```

2nd Response
```
{
  "count": 100
}
```

nth Response

```
{
  "count": 300
}
```

_You can stop polling when the count has not changed for 3 consecutive polls_

### Example Response Format

In response we return the following format:

| Property        | Data Type | Description                                                  |
| --------------- | --------- | ------------------------------------------------------------ |
| search          | Hash      | Full search request information                              |
| airlines        | Array     | List of airlines\*                                           |
| airports        | Array     | List of airports\*                                           |
| cities          | Array     | List of cities\*                                             |
| providers       | Array     | List of providers\*                                          |
| countries       | Array     | List of countries\*                                          |
| trips           | Array     | List of trips                                                |
| fares           | Array     | List of fares                                                |
| filters         | Hash      | All filters options                                          |
| routeSponsors   | Array     | List of route sponsors                                       |
| scores          | Hash      | Trip scores                                                  |
| paymentMethods  | Array     | List of paymentMethods\*                                     |
| fareConditions  | Array     | List of fareConditions\*                                     |
| legConditionIds | Hash      | ConditionIds of Legs                                         |
| faresCount      | Hash      | Fares count per trip                                         |
| count           | Integer   | Total fares count that will be used for next polling request |

\*_Collection of static data_

```
{
    "legs": [
        {
            "id": "SIN-DXB:9W11:9W544",
            "departureTime": "19:50",
            "arrivalTime": "21:20",
            "duration": "29h 30m",
            "departureAirportCode": "SIN",
            "arrivalAirportCode": "DXB",
            "airlineCodes": [
                "9W"
            ],
            "stopoverAirportCodes": [
                "BOM"
            ],
            "allianceCodes": [
                ""
            ],
            "stopoversCount": 1,
            "departureTimeMinutes": 1190,
            "arrivalTimeMinutes": 1280,
            "stopoverDurationMinutes": 1235,
            "durationMinutes": 1770,
            "overnight": true,
            "stopoverDuration": "20h 35m",
            "durationDays": 1,
            "longStopover": true,
            "segments": [
                {
                    "durationMinutes": 330,
                    "stopoverDurationMinutes": 1235,
                    "departureAirportCode": "SIN",
                    "arrivalAirportCode": "BOM",
                    "airlineCode": "9W",
                    "cabin": "economy"
                },
                {
                    "durationMinutes": 205,
                    "stopoverDurationMinutes": 0,
                    "departureAirportCode": "BOM",
                    "arrivalAirportCode": "DXB",
                    "airlineCode": "9W",
                    "cabin": "economy"
                }
            ],
            "operatingAirlineCodes": [],
            "stopoverCode": "ONE_STOP",
            "shortStopover": false,
            "earlyDeparture": false,
            "lateArrival": false,
            "newAircraft": false,
            "oldAircraft": true,
            "highlyRatedCarrier": false,
            "score": 536.17
        },
        {
            "id": "DXB-SIN:KE952:KE643",
            "departureTime": "22:55",
            "arrivalTime": "19:30",
            "duration": "16h 35m",
            "departureAirportCode": "DXB",
            "arrivalAirportCode": "SIN",
            "airlineCodes": [
                "KE"
            ],
            "stopoverAirportCodes": [
                "ICN"
            ],
            "allianceCodes": [
                "sky_team"
            ],
            "stopoversCount": 1,
            "departureTimeMinutes": 1375,
            "arrivalTimeMinutes": 1170,
            "stopoverDurationMinutes": 110,
            "durationMinutes": 995,
            "overnight": true,
            "stopoverDuration": "01h 50m",
            "durationDays": 1,
            "longStopover": false,
            "segments": [
                {
                    "durationMinutes": 515,
                    "stopoverDurationMinutes": 110,
                    "departureAirportCode": "DXB",
                    "arrivalAirportCode": "ICN",
                    "airlineCode": "KE",
                    "cabin": "economy"
                },
                {
                    "durationMinutes": 370,
                    "stopoverDurationMinutes": 0,
                    "departureAirportCode": "ICN",
                    "arrivalAirportCode": "SIN",
                    "airlineCode": "KE",
                    "cabin": "economy"
                }
            ],
            "operatingAirlineCodes": [],
            "stopoverCode": "ONE_STOP",
            "shortStopover": false,
            "earlyDeparture": false,
            "lateArrival": false,
            "newAircraft": false,
            "oldAircraft": true,
            "highlyRatedCarrier": false,
            "score": 680
        },
    ],
    "search": {
        "id": "5d8bc9d0f0a05fc3",
        "cabin": "economy",
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "siteCode": "AE",
        "currencyCode": "AED",
        "locale": "ar",
        "deviceType": "desktop",
        "appType": "WEB_APP",
        "createdAt": "2018-02-22T09:41:09.940Z",
        "key": "[cSIN:cDXB:2018-03-21-cDXB:cSIN:2018-03-29]~1~0~0~AE~economy~desktop~WEB_APP",
        "userCountryCode": "SG",
        "legs": [
            {
                "id": "cSIN:cDXB:2018-03-21",
                "outboundDate": "2018-03-21",
                "departureCityCode": "SIN",
                "arrivalCityCode": "DXB",
                "departureCity": {
                    "code": "SIN",
                    "name": "Singapore",
                    "enName": "Singapore",
                    "countryCode": "SG",
                    "countryName": "Singapore",
                    "countryEnName": "Singapore",
                    "worldRegionCode": "i",
                    "worldRegionName": "Asia",
                    "worldRegionEnName": "Asia"
                },
                "arrivalCity": {
                    "code": "DXB",
                    "name": "Dubai",
                    "enName": "Dubai",
                    "countryCode": "AE",
                    "countryName": "United Arab Emirates",
                    "countryEnName": "United Arab Emirates",
                    "worldRegionCode": "m",
                    "worldRegionName": "Middle East",
                    "worldRegionEnName": "Middle East"
                }
            },
            {
                "id": "cDXB:cSIN:2018-03-29",
                "outboundDate": "2018-03-29",
                "departureCityCode": "DXB",
                "arrivalCityCode": "SIN",
                "departureCity": {
                    "code": "DXB",
                    "name": "Dubai",
                    "enName": "Dubai",
                    "countryCode": "AE",
                    "countryName": "United Arab Emirates",
                    "countryEnName": "United Arab Emirates",
                    "worldRegionCode": "m",
                    "worldRegionName": "Middle East",
                    "worldRegionEnName": "Middle East"
                },
                "arrivalCity": {
                    "code": "SIN",
                    "name": "Singapore",
                    "enName": "Singapore",
                    "countryCode": "SG",
                    "countryName": "Singapore",
                    "countryEnName": "Singapore",
                    "worldRegionCode": "i",
                    "worldRegionName": "Asia",
                    "worldRegionEnName": "Asia"
                }
            }
        ]
    },
    "airlines": [
        {
            "name": "Air China",
            "code": "CA"
        },
    ],
    "airports": [
        {
            "name": "Addis Ababa Airport",
            "code": "ADD",
            "cityCode": "ADD"
        },
    ],
    "cities": [
        {
            "code": "ADD",
            "name": "Addis Ababa",
            "countryCode": "ET"
        },
    ],
    "providers": [
        {
            "code": "ae.via.com",
            "name": "ae.via.com",
            "type": "ota",
            "instant": false,
            "facilitatedBooking": false
        },
    ],
    "countries": [
        {
            "code": "BD",
            "name": "Bangladesh"
        },
    ],
    "trips": [
        {
            "id": "5d8bc9d0f0a05fc3:AI343-9W580=UL226-UL302",
            "code": "AI343-9W580=UL226-UL302",
            "legIds": [
                "SIN-DXB:AI343:9W580",
                "DXB-SIN:UL226:UL302"
            ]
        },
    ],
    "fares": [
        {
            "paymentFees": [],
            "id": "5d8bc9d0f0a05fc3:musafir.com:0",
            "price": {
                "totalAmount": 1626,
                "totalAmountUsd": 442.67087,
                "amount": 1626,
                "amountUsd": 442.67087,
                "originalAmount": 1626,
                "originalAmountUsd": 442.67087,
                "amountPerAdult": 1626,
                "amountPerChild": 0,
                "amountPerInfant": 0,
                "taxAmount": 0,
                "currencyCode": "AED",
                "paymentFeeAmountUsd": 0
            },
            "providerCode": "musafir.com",
            "handoffUrl": "http://handoff.wegostaging.com/flights/continue?currency=AED&url_locale=ar&site_code=AE&device_type=desktop&app_type=WEB_APP&domain=www.wego.ae&fare_id=5d8bc9d0f0a05fc3:musafir.com:0&placement_type=metasearch&route=SIN-DXB&search_id=5d8bc9d0f0a05fc3&trip_id=cSIN:cDXB:2018-03-21:cDXB:cSIN:2018-03-29&pwa=false&api_version=2",
            "ecpc": 0.77,
            "remainingSeatsCount": 0,
            "conditionIds": [],
            "legConditionIds": [],
            "tripId": "5d8bc9d0f0a05fc3:EK433=EK354"
        },
    ],
    "filters": {
        "minPrice": {...},
        "maxPrice": {...},
        "stops": [
            {
                "code": "ONE_STOP",
                "price": {...}
            },
            {
                "code": "MORE_THAN_ONE_STOP",
                "price": {...}
            },
            {
                "code": "DIRECT",
                "price": {...}
            }
        ],
        "airlines": [
            {
                "code": "KL",
                "price": {...}
            },
        ],
        "providers": [
            {
                "code": "ticketsandhotels.com",
                "price": {...}
            },
        ],
        "stopoverAirports": [
            {
                "code": "PVG",
                "price": {...}
            },
        ],
        "stopoverDurations": {
            "min": 0,
            "max": 1435
        },
        "originAirports": [
            {
                "code": "SIN",
                "price": {...}
            }
        ],
        "destinationAirports": [
            {
                "code": "DXB",
                "price": {...}
            }
        ],
        "tripDurations": {
            "min": 445,
            "max": 2115
        },
        "legs": [
            {
                "departureAirportCode": "SIN",
                "arrivalAirportCode": "DXB",
                "departureCityCode": "SIN",
                "arrivalCityCode": "DXB",
                "index": 0,
                "departureTimes": {
                    "min": 20,
                    "max": 1435
                },
                "arrivalTimes": {
                    "min": 5,
                    "max": 1405
                },
                "durations": {
                    "min": 445,
                    "max": 2055
                },
                "stops": [
                    {
                        "code": "ONE_STOP",
                        "price": {...}
                    },
                    {
                        "code": "MORE_THAN_ONE_STOP",
                        "price": {...}
                    },
                    {
                        "code": "DIRECT",
                        "price": {...}
                    }
                ],
                "stopoverDurations": {
                    "min": 0,
                    "max": 1395
                },
                "stopoverAirports": [
                    {
                        "code": "PVG",
                        "price": {...}
                    },
                ],
                "airlines": [
                    {
                        "code": "JL",
                        "price": {...}
                    },
                ]
            },
            {
                "departureAirportCode": "DXB",
                "arrivalAirportCode": "SIN",
                "departureCityCode": "DXB",
                "arrivalCityCode": "SIN",
                "index": 1,
                "departureTimes": {
                    "min": 5,
                    "max": 1420
                },
                "arrivalTimes": {
                    "min": 15,
                    "max": 1430
                },
                "durations": {
                    "min": 450,
                    "max": 2115
                },
                "stops": [
                    {
                        "code": "ONE_STOP",
                        "price": {...}
                    },
                    {
                        "code": "MORE_THAN_ONE_STOP",
                        "price": {...}
                    },
                    {
                        "code": "DIRECT",
                        "price": {...}
                    }
                ],
                "stopoverDurations": {
                    "min": 0,
                    "max": 1435
                },
                "stopoverAirports": [
                    {
                        "code": "PVG",
                        "price": {...}
                    },
                ],
                "airlines": [
                    {
                        "code": "JL",
                        "price": {...}
                    },
                ]
            }
        ],
        "alliances": [
            {
                "code": "oneworld",
                "price": {...}
            },
        ],
        "fareConditions": [
            {
                "code": "1",
                "price": {...}
            },
            {
                "code": "2",
                "price": {...}
            }
        ],
        "legConditions": [
            {
                "code": "4",
                "price": {...}
            }
        ]
    },
    "routeSponsors": [
        {
            "priority": 0,
            "fare": {
                "paymentFees": [],
                "id": "5d8bc9d0f0a05fc3:wego.com-altayyaronline.com:25",
                "price": {...},
                "providerCode": "wego.com-altayyaronline.com",
                "handoffUrl": "http://handoff.wegostaging.com/flights/continue?currency=AED&url_locale=ar&site_code=AE&device_type=desktop&app_type=WEB_APP&domain=www.wego.ae&fare_id=5d8bc9d0f0a05fc3:wego.com-altayyaronline.com:25&placement_type=metasearch&route=SIN-DXB&search_id=5d8bc9d0f0a05fc3&trip_id=cSIN:cDXB:2018-03-21:cDXB:cSIN:2018-03-29&pwa=false&api_version=2",
                "ecpc": 0,
                "remainingSeatsCount": 0,
                "conditionIds": [],
                "legConditionIds": [],
                "tripId": "5d8bc9d0f0a05fc3:9W19-9W588=9W541-9W12"
            }
        }
    ],
    "scores": {
        "5d8bc9d0f0a05fc3:CZ352-CZ383=9W543-9W10": 680.67,
        "5d8bc9d0f0a05fc3:EK433=9W541-AI342": 725.83,
    },
    "paymentMethods": [
        {
            "id": 3,
            "name": "American Express"
        },
        {
            "id": 8,
            "name": "MasterCard"
        },
    ],
    "fareConditions": [
        {
            "id": 1,
            "code": "REFUNDABLE",
            "name": "Refundable"
        },
        {
            "id": 2,
            "code": "NON_REFUNDABLE",
            "name": "Non-refundable"
        }
    ],
    "legConditionIds": {
        "DXB-SIN:EK404": [
            4
        ],
        "SIN-DXB:UL309:FZ551": [
            4
        ],
    },
    "legConditions": [
        {
            "id": 4,
            "code": "SCHEDULED",
            "name": "Scheduled"
        }
    ],
    "faresCount": {
        "5d8bc9d0f0a05fc3:AI343-9W580=UL226-UL302": 1,
        "5d8bc9d0f0a05fc3:EK433=9W541-AI342": 1,
    },
    "count": 2978
}
```

---

## Get Trip Details

Get the Trip

```
GET metasearch/flights/trips/:tripId
```

Parameters

| Property | Required? | Data Type | Description
| ------------- |-------------| -------------| -------------|
| paymentMethodIds | Yes | Array | Id of the payment methods that will be included on the fare.
| isShamsi | No | Boolean | Set this value to true to use Persian calendar on the dates.


Response:

`Trip` object contains list of `fares`. The `legs` inside contain all the information for this particular Trip, that are not included in the previous endpoint.


```
{
  "paymentMehods": {
    {
      "id": 15
      "name": "Visa"
    },
    {
      "id": 10
      "name": "Mastercard"
    }
  },
  "conditions": [
      {
          "id": 7,
          "code": "NON-REFUNDABLE",
          "name": "Non-refundable"
      },
      {
          "id": 6,
          "code": "REFUNDABLE",
          "name": "Refundable"
      }
  ],
  "trip": {
    "id": "o5PE1RKBPBX:UL309-UL364=UL365-UL306",
    "fares": [
      {
        "id": "o5PE1RKBPBX:hutchgo.com.sg:20",
        "searchId": "o5PE1RKBPBX",
        "price": {
          "totalAmount": 5560.3574,
          "totalAmountUsd": 5557.215,
          "amount": 5560.3574,
          "amountUsd": 5557.215,
          "originalAmount": 5560.3574,
          "originalAmountUsd": 5557.215,
          "amountPerAdult": 5560.3574,
          "amountPerChild": 0,
          "amountPerInfant": 0,
          "taxAmount": 0,
          "currencyCode": "USD"
        },
        "provider": {
          "code": "hutchgo.com.sg",
          "parentCode": "hutchgo.com.hk",
          "name": "hutchgo.com.sg",
          "type": "ota",
          "mobileFriendly": true,
          "facilitatedBooking": false
        },
        "paymentFees": [
          {
            "paymentMethodId": 15,
            "currencyCode": "SGD",
            "amount": 0,
            "amountUsd": 0
          },
          {
            "paymentMethodId": 10,
            "currencyCode": "SGD",
            "amount": 0,
            "amountUsd": 0
          }
        ],
        "handoffUrl": "https://www.wego.com.sg/flights/continue?currency=SGD&url_locale=en&device_type=mobile&domain=www.wego.com.sg&fare_id=o5PE1RKBPBX:hutchgo.com.sg:20&placement_type=metasearch&route=SIN-CGK&search_id=o5PE1RKBPBX&trip_id=SIN%3ACGK%3A2017-04-09%3A2017-04-10",
        "remainingSeatsCount": 2,
        "conditionIds": [ 1 ],
        "tripId": "o5PE1RKBPBX:UL309-UL364=UL365-UL306"
      }
    ],
    "legs": [
      {
        "departureTime": "20:05",
        "departureDateTime": "2017-04-09T20:05:00.000+08:00",
        "arrivalTime": "13:30",
        "departureDateTime": "2017-04-10T13:30:00.000+07:00",
        "duration": "18h 25m",
        "departureAirportCode": "SIN",
        "arrivalAirportCode": "CGK",
        "airlineCodes": [
          "UL"
        ],
        "stopoverAirportCodes": [
          "CMB"
        ],
        "allianceCodes": [],
        "stopoversCount": 1,
        "departureTimeMinutes": 1205,
        "arrivalTimeMinutes": 810,
        "stopoverDurationMinutes": 595,
        "durationMinutes": 1105,
        "overnight": true,
        "stopoverDuration": "09h 55m",
        "durationDays": 1,
        "longStopover": false,
        "departureDate": "Sun, 9 Apr",
        "arrivalDate": "Sun, 10 Apr",
        "segments": [
          {
            "departureAirportCode": "SIN",
            "departureAirportName": "Singapore Changi Airport",
            "departureDate": "9 Apr",
            "departureTime": "20:05",
            "duration": "03h 50m",
            "airlineName": "SriLankan Airlines",
            "designatorCode": "UL309",
            "arrivalAirportCode": "CMB",
            "arrivalAirportName": "Colombo Bandaranaike Airport",
            "arrivalDate": "9 Apr",
            "arrivalTime": "21:25",
            "stopoverDuration": "09h 55m"
          },
          {
            "departureAirportCode": "CMB",
            "departureAirportName": "Colombo Bandaranaike Airport",
            "departureDate": "10 Apr",
            "departureTime": "07:20",
            "duration": "04h 40m",
            "airlineName": "SriLankan Airlines",
            "designatorCode": "UL364",
            "arrivalAirportCode": "CGK",
            "arrivalAirportName": "Jakarta Soekarno-Hatta Airport",
            "arrivalDate": "10 Apr",
            "arrivalTime": "13:30"
          }
        ],
        "conditionIds": [ 3 ]
      },
      {
        "departureTime": "14:25",
        "departureDateTime": "2017-04-20T14:25:00.000+07:00",
        "arrivalTime": "08:35",
        "arrivalDateTime": "2017-04-21T08:35:00.000+08:00",
        "duration": "17h 10m",
        "departureAirportCode": "CGK",
        "arrivalAirportCode": "SIN",
        "airlineCodes": [
          "UL"
        ],
        "stopoverAirportCodes": [
          "CMB"
        ],
        "allianceCodes": [],
        "stopoversCount": 1,
        "departureTimeMinutes": 865,
        "arrivalTimeMinutes": 515,
        "stopoverDurationMinutes": 505,
        "durationMinutes": 1030,
        "overnight": true,
        "stopoverDuration": "08h 25m",
        "durationDays": 0,
        "longStopover": false,
        "segments": [
          {
            "departureAirportCode": "CGK",
            "departureAirportName": "Jakarta Soekarno-Hatta Airport",
            "departureDate": "2017-04-20",
            "departureTime": "14:25",
            "duration": "04h 35m",
            "airlineName": "SriLankan Airlines",
            "designatorCode": "UL365",
            "arrivalAirportCode": "CMB",
            "arrivalAirportName": "Colombo Bandaranaike Airport",
            "arrivalDate": "2017-04-20",
            "arrivalTime": "17:30",
            "stopoverDuration": "08h 25m"
          },
          {
            "departureAirportCode": "CMB",
            "departureAirportName": "Colombo Bandaranaike Airport",
            "departureDate": "2017-04-21",
            "departureTime": "01:55",
            "duration": "04h 10m",
            "airlineName": "SriLankan Airlines",
            "designatorCode": "UL306",
            "arrivalAirportCode": "SIN",
            "arrivalAirportName": "Singapore Changi Airport",
            "arrivalDate": "2017-04-21",
            "arrivalTime": "08:35"
          }
        ]
      }
    ]
  },
  "fareConditions": [
      {
          "id": 1,
          "code": "REFUNDABLE",
          "name": "Refundable"
      }
  ],
  "legConditions": [
      {
          "id": 3,
          "code": "CHARTERED",
          "name": "Chartered"
      },
      {
          "id": 4,
          "code": "SCHEDULED",
          "name": "Scheduled"
      }
  ]
}
```

## Get flight deeplink V3

Get flight deeplink V3. In V3 we will support multicity by replace `outbound_segments` and `inbound_segments` by list of `legs`. Each `leg` will have list of `segments`.

```
GET metasearch/flights/v3/deeplink
```

Parameters

| Property          | Required? | Data Type | Description       |
| ----------------- | --------- | --------- | ----------------- |
| search_id         | Yes       | String    | Search Id         |
| trip_id           | Yes       | String    | Trip Id           |
| fare_id           | Yes       | String    | Fare Id           |
| placement_type    | Yes       | String    | Placement type    |
| device_type       | Yes       | String    | Device type       |
| currency_code     | Yes       | String    | Currency code     |
| locale            | Yes       | String    | Locale            |
| country_site_code | Yes       | String    | Country site code |
| user_country_code | Yes       | String    | User country code |
| site_code         | Yes       | String    | Site code         |

Response:

| Property         | Data Type | Description                                                                   |
| ---------------- | --------- | ----------------------------------------------------------------------------- |
| analytics_params | Hash      | Analytics Params object contains full details of `search`, `fare` ( includes `trip`) and `flight_ecpc`. |
| deeplink         | Hash      | Deeplink object contains full details of `provider` and `deeplink` request    |

```
{
    "analytics_params": {
        "search": {
            "id": "688d36c90942faa9",
            "adults_count": 1,
            "children_count": 0,
            "infants_count": 0,
            "cabin": "economy",
            "created_at": "2018-02-02T09:08:42.533Z",
            "locale": "ar",
            "currency_code": "AED",
            "site_code": "AE",
            "legs": [
                {
                    "id": "cSIN:cMNL:2018-02-27",
                    "outbound_date": "2018-02-27",
                    "arrival_city_code": "MNL",
                    "arrival_city_name": "Manila",
                    "arrival_country_code": "PH",
                    "arrival_country_name": "Philippines",
                    "arrival_world_region_code": "i",
                    "arrival_world_region_name": "Asia",
                    "departure_city_code": "SIN",
                    "departure_city_name": "Singapore",
                    "departure_country_code": "SG",
                    "departure_country_name": "Singapore",
                    "departure_world_region_code": "i",
                    "departure_world_region_name": "Asia"
                },
                {
                    "id": "cMNL:cDXB:2018-03-15",
                    "outbound_date": "2018-03-15",
                    "arrival_city_code": "DXB",
                    "arrival_city_name": "Dubai",
                    "arrival_country_code": "AE",
                    "arrival_country_name": "United Arab Emirates",
                    "arrival_world_region_code": "m",
                    "arrival_world_region_name": "Middle East",
                    "departure_city_code": "MNL",
                    "departure_city_name": "Manila",
                    "departure_country_code": "PH",
                    "departure_country_name": "Philippines",
                    "departure_world_region_code": "i",
                    "departure_world_region_name": "Asia"
                },
                {
                    "id": "cDXB:cSGN:2018-03-19",
                    "outbound_date": "2018-03-19",
                    "arrival_city_code": "SGN",
                    "arrival_city_name": "Ho Chi Minh City",
                    "arrival_country_code": "VN",
                    "arrival_country_name": "Vietnam",
                    "arrival_world_region_code": "i",
                    "arrival_world_region_name": "Asia",
                    "departure_city_code": "DXB",
                    "departure_city_name": "Dubai",
                    "departure_country_code": "AE",
                    "departure_country_name": "United Arab Emirates",
                    "departure_world_region_code": "m",
                    "departure_world_region_name": "Middle East"
                }
            ]
        },
        "fare": {
            "id": "688d36c90942faa9:wego.com-cheapoair.com:8",
            "booking_params": "{\"ck\":\"8b13a72e-ed74-4dab-9e33-b6dc10e3273a\",\"cid\":\"8\"}",
            "params": "{\"ck\":\"8b13a72e-ed74-4dab-9e33-b6dc10e3273a\",\"cid\":\"8\"}",
            "created_at": "2018-02-02-09.08.49.449000+0000",
            "trip": {
                "id": "688d36c90942faa9:SQ910=CZ3092-CZ383=CZ384-CZ367",
                "legs": [
                    {
                        "id": "SIN-MNL:SQ910",
                        "segments": [
                            {
                                "designator_code": "SQ910",
                                "arrival_time": "0500",
                                "arrival_date_time": "2018-02-27T05:00:00.000Z",
                                "arrival_timezone": "+08:00",
                                "departure_time": "0120",
                                "departure_date_time": "2018-02-27T01:20:00.000Z",
                                "departure_timezone": "+08:00",
                                "arrival_airport": {
                                    "code": "MNL",
                                    "name": "Manila Ninoy Aquino International Airport",
                                    "city_code": "MNL",
                                    "city_name": "Manila",
                                    "country_code": "PH",
                                    "country_name": "Philippines",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "departure_airport": {
                                    "code": "SIN",
                                    "name": "Singapore Changi Airport",
                                    "city_code": "SIN",
                                    "city_name": "Singapore",
                                    "country_code": "SG",
                                    "country_name": "Singapore",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "airline": {
                                    "code": "SQ",
                                    "name": "Singapore Airlines",
                                    "alliance": {
                                        "code": "SQ"
                                    }
                                }
                            }
                        ]
                    },
                    {
                        "id": "MNL-DXB:CZ3092:CZ383",
                        "segments": [
                            {
                                "designator_code": "CZ3092",
                                "arrival_time": "0635",
                                "arrival_date_time": "2018-03-15T06:35:00.000Z",
                                "arrival_timezone": "+08:00",
                                "departure_time": "0400",
                                "departure_date_time": "2018-03-15T04:00:00.000Z",
                                "departure_timezone": "+08:00",
                                "arrival_airport": {
                                    "code": "CAN",
                                    "name": "Guangzhou Airport",
                                    "city_code": "CAN",
                                    "city_name": "Guangzhou",
                                    "country_code": "CN",
                                    "country_name": "China",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "departure_airport": {
                                    "code": "MNL",
                                    "name": "Manila Ninoy Aquino International Airport",
                                    "city_code": "MNL",
                                    "city_name": "Manila",
                                    "country_code": "PH",
                                    "country_name": "Philippines",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "airline": {
                                    "code": "CZ",
                                    "name": "China Southern Airlines",
                                    "alliance": {
                                        "code": "CZ"
                                    }
                                }
                            },
                            {
                                "designator_code": "CZ383",
                                "arrival_time": "2005",
                                "arrival_date_time": "2018-03-15T20:05:00.000Z",
                                "arrival_timezone": "+04:00",
                                "departure_time": "1030",
                                "departure_date_time": "2018-03-15T10:30:00.000Z",
                                "departure_timezone": "+08:00",
                                "arrival_airport": {
                                    "code": "DXB",
                                    "name": "Dubai International Airport",
                                    "city_code": "DXB",
                                    "city_name": "Dubai",
                                    "country_code": "AE",
                                    "country_name": "United Arab Emirates",
                                    "world_region_code": "m",
                                    "world_region_name": "Middle East"
                                },
                                "departure_airport": {
                                    "code": "CAN",
                                    "name": "Guangzhou Airport",
                                    "city_code": "CAN",
                                    "city_name": "Guangzhou",
                                    "country_code": "CN",
                                    "country_name": "China",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "airline": {
                                    "code": "CZ",
                                    "name": "China Southern Airlines",
                                    "alliance": {
                                        "code": "CZ"
                                    }
                                }
                            }
                        ]
                    },
                    {
                        "id": "DXB-SGN:CZ384:CZ367",
                        "segments": [
                            {
                                "designator_code": "CZ384",
                                "arrival_time": "0445",
                                "arrival_date_time": "2018-03-19T04:45:00.000Z",
                                "arrival_timezone": "+08:00",
                                "departure_time": "2155",
                                "departure_date_time": "2018-03-18T21:55:00.000Z",
                                "departure_timezone": "+04:00",
                                "arrival_airport": {
                                    "code": "CAN",
                                    "name": "Guangzhou Airport",
                                    "city_code": "CAN",
                                    "city_name": "Guangzhou",
                                    "country_code": "CN",
                                    "country_name": "China",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "departure_airport": {
                                    "code": "DXB",
                                    "name": "Dubai International Airport",
                                    "city_code": "DXB",
                                    "city_name": "Dubai",
                                    "country_code": "AE",
                                    "country_name": "United Arab Emirates",
                                    "world_region_code": "m",
                                    "world_region_name": "Middle East"
                                },
                                "airline": {
                                    "code": "CZ",
                                    "name": "China Southern Airlines",
                                    "alliance": {
                                        "code": "CZ"
                                    }
                                }
                            },
                            {
                                "designator_code": "CZ367",
                                "arrival_time": "1500",
                                "arrival_date_time": "2018-03-19T15:00:00.000Z",
                                "arrival_timezone": "+07:00",
                                "departure_time": "1215",
                                "departure_date_time": "2018-03-19T12:15:00.000Z",
                                "departure_timezone": "+08:00",
                                "arrival_airport": {
                                    "code": "SGN",
                                    "name": "Ho Chi Minh City Airport",
                                    "city_code": "SGN",
                                    "city_name": "Ho Chi Minh City",
                                    "country_code": "VN",
                                    "country_name": "Vietnam",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "departure_airport": {
                                    "code": "CAN",
                                    "name": "Guangzhou Airport",
                                    "city_code": "CAN",
                                    "city_name": "Guangzhou",
                                    "country_code": "CN",
                                    "country_name": "China",
                                    "world_region_code": "i",
                                    "world_region_name": "Asia"
                                },
                                "airline": {
                                    "code": "CZ",
                                    "name": "China Southern Airlines",
                                    "alliance": {
                                        "code": "CZ"
                                    }
                                }
                            }
                        ]
                    }
                ]
            },
            "price": {
                "totalAmount": 1905,
                "totalAmountUsd": 1905,
                "amount": 1905,
                "amountUsd": 1905,
                "originalAmount": 1905,
                "originalAmountUsd": 1905,
                "amountPerAdult": 1905.35,
                "amountPerChild": 0,
                "amountPerInfant": 0,
                "taxAmount": 0,
                "currencyCode": "USD",
                "paymentFeeAmountUsd": 0
            },
            "refundable": false,
            "remaining_seats_count": 0
        },
        "flight_ecpc": {
            "provider_code": "air-viva.com",
            "site_code": "SA",
            "cost": 0.62,
            "percent_mobile": 39.64,
            "percent_mobile_web": 29.43,
            "percent_mobile_ios": 58.85,
            "percent_mobile_android": 29.43,
            "agreement_term_id": 6644,
            "term_type": "CPA"
        }
    },
    "deeplink": {
        "provider_code": "wego.com-cheapoair.com",
        "provider_parent_code": "wego.com-cheapoair.com",
        "device_type": "mobile",
        "requests": [
            {
                "url": "https://secure.wegostaging.com/flights/bookings?fare_id=688d36c90942faa9:wego.com-cheapoair.com:8&locale=en&currency_code=SAR&api_version&search_key=[cSIN:cMNL:2018-02-27-cMNL:cDXB:2018-03-15-cDXB:cSGN:2018-03-19]~1~0~0~AE~economy~desktop~WEB_APP",
                "method": "GET",
                "delay": 0
            }
        ]
    }
}
```

## Create new flight partner search

Create new flights search for a specific provider code. New searchId in this response will be used in next polling requests to get list of partner's request/responses.

Request params and request body are exactly same as in [Create new flights search](#create-new-flights-search), except that we will include `provider_code` in the Url path.

```
POST metasearch/flights/partners/:provider_code/searches
```

Response:

| Property | Data Type | Description                               |
| -------- | --------- | ----------------------------------------- |
| search   | Hash      | Full search object that includes searchId |
| provider | Hash      | Provider details                          |

## Example:

Request:

```
POST metasearch/flights/partners/mytrip.com/searches?locale=ar&currencyCode=VND

{
    "search": {
        "cabin": "economy",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false,
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "siteCode": "AE",
        "currencyCode": "AED",
        "locale": "ar",
        "legs": [
            {
                "departureCityCode": "SIN",
                "arrivalCityCode": "DXB",
                "outboundDate": "2018-05-28"
            },
            {
                "departureCityCode": "DXB",
                "arrivalCityCode": "SIN",
                "outboundDate": "2018-05-30"
            }
        ]
    },
    "offset": 0,
    "paymentMethodIds": [
    ],
    "providerTypes": []
}
```

Response:

```
{
    "search": {
        "id": "689aff0e59eaacb2",
        "cabin": "economy",
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "siteCode": "AE",
        "currencyCode": "AED",
        "locale": "ar",
        "deviceType": "desktop",
        "appType": "WEB_APP",
        "createdAt": "2018-05-21T06:39:56.762Z",
        "key": "[cSIN:cDXB:2018-05-28-cDXB:cSIN:2018-05-30]~1~0~0~AE~economy~desktop~WEB_APP",
        "userCountryCode": "AE",
        "legs": [
            {
                "id": "cSIN:cDXB:2018-05-28",
                "outboundDate": "2018-05-28",
                "departureCityCode": "SIN",
                "arrivalCityCode": "DXB",
                "departureCity": {
                    "code": "SIN",
                    "name": "سنغافورة",
                    "enName": "Singapore",
                    "countryCode": "SG",
                    "countryName": "سنغافورة",
                    "countryEnName": "Singapore",
                    "worldRegionCode": "i",
                    "worldRegionName": "آسيا",
                    "worldRegionEnName": "Asia"
                },
                "arrivalCity": {
                    "code": "DXB",
                    "name": "دبي",
                    "enName": "Dubai",
                    "countryCode": "AE",
                    "countryName": "الإمارات العربية المتحدة",
                    "countryEnName": "United Arab Emirates",
                    "worldRegionCode": "m",
                    "worldRegionName": "الشرق الأوسط",
                    "worldRegionEnName": "Middle East"
                }
            },
            {
                "id": "cDXB:cSIN:2018-05-30",
                "outboundDate": "2018-05-30",
                "departureCityCode": "DXB",
                "arrivalCityCode": "SIN",
                "departureCity": {
                    "code": "DXB",
                    "name": "دبي",
                    "enName": "Dubai",
                    "countryCode": "AE",
                    "countryName": "الإمارات العربية المتحدة",
                    "countryEnName": "United Arab Emirates",
                    "worldRegionCode": "m",
                    "worldRegionName": "الشرق الأوسط",
                    "worldRegionEnName": "Middle East"
                },
                "arrivalCity": {
                    "code": "SIN",
                    "name": "سنغافورة",
                    "enName": "Singapore",
                    "countryCode": "SG",
                    "countryName": "سنغافورة",
                    "countryEnName": "Singapore",
                    "worldRegionCode": "i",
                    "worldRegionName": "آسيا",
                    "worldRegionEnName": "Asia"
                }
            }
        ]
    },
    "provider": {
        "code": "mytrip.com",
        "name": "mytrip.com",
        "type": "ota",
        "instant": false,
        "facilitatedBooking": false
    }
}
```

## Fetch flight partner requests results

Fetch flights partner requests results with the searchId that is created from [Create new flight partner search](#create-new-flight-partner-search)

Request url/params/body are same as [Create new flight partner search](#create-new-flight-partner-search), except that we will include the searchId from previous request into new search request body.

As a polling request we have to call this endpoint a few times and wait a few moment in order to fetch full response. Polling time depends on provider's response time, some provider might be slow and returns response after around 60s.

Some providers might send a lot of requests. Due to big response size, each time the api only returns maximum 3 partner request/response pairs. Set `offset` value in next polling request as the value of `requestsCount` from previous response to get new set of partner request/response pairs.

Incase of error, `errorMessages` or readable error message will be returned in response.

```
POST metasearch/flights/partners/:provider_code/searches
```

Response:

| Property        | Data Type | Description                               |
| --------------- | --------- | ----------------------------------------- |
| search          | Hash      | Full search object that includes searchId |
| provider        | Hash      | Provider details                          |
| partnerExchanges | List      | List of partner's request/response pairs  |

### Example:

Request:

```
POST metasearch/flights/partners/mytrip.com/searches?locale=ar&currencyCode=VND

{
    "search": {
        "id": "689aff0e59eaacb2",
        "cabin": "economy",
        "deviceType": "DESKTOP",
        "appType": "WEB_APP",
        "userLoggedIn": false,
        "adultsCount": 1,
        "childrenCount": 0,
        "infantsCount": 0,
        "siteCode": "AE",
        "currencyCode": "AED",
        "locale": "ar",
        "legs": [
            {
                "departureCityCode": "SIN",
                "arrivalCityCode": "DXB",
                "outboundDate": "2018-05-28"
            },
            {
                "departureCityCode": "DXB",
                "arrivalCityCode": "SIN",
                "outboundDate": "2018-05-30"
            }
        ]
    },
    "offset": 0,
    "paymentMethodIds": [
    ],
    "providerTypes": []
}
```

Response:

```
{
    "search": {...},
    "provider": {
        "code": "mytrip.com",
        "name": "mytrip.com",
        "type": "ota",
        "instant": false,
        "facilitatedBooking": false
    },
    "totalRequestsCount": 1,
    "requestsCount": 1,
    "partnerExchanges": [
        {
            "request": {
                "url": "http://turingery-proxy.bezurk.org/p/flights/mytrip/json/Search/",
                "method": "POST",
                "headers": {
                    "Accept": [
                        "application/json"
                    ]
                },
                "cookies": [],
                "contentLength": 0
            },
            "response": {
                "statusCode": 200,
                "statusText": "OK",
                "size": 361974,
                "headers": {},
                "cookies": [],
                "body": "{\"Journeys\":[{\"Adults\":1,\"Children\":0,\"Infants\":0,\"DeepLinkToken\":\"v1y0gJ6enyH2BJ-H2F3JU6sCzSVPbPKpCy4MUpKtkrVi1Yc-hv9lOoEaQ0Hd9v3sYyw9xKIJnN1OygG6Y1cEe-kaapg}]}................"
            }
        }
    ]
}
```
