# Flights Api

| Type | Endpoint                              | Description                                            |
| ---- | ------------------------------------- | ------------------------------------------------------ |
| GET  | [/flights/v1/flights](#get-schedules) | Get schedule based on departure and arrival city code. |

## Get schedules

Returns schedules based on given departure and arrival city codes.

`GET flights/flights`

### Logic

1. Check if parameters are valid by `date`.If they are, queries will be narrowed to being valid by date.

    1. Furthermore, if both `departureCityCode` and `arrivalCityCode` are available, list of flights will be rendered and obtained by queries made with both city codes.
    2. If they are not available, we will attempt to get the city with the highest route count by the departure/arrival country code passed. Then,the list of flights will be rendered after the queries made with both departure and arrival list of city codes.

2. If not valid by `date`, list of flights will be rendered and obtained by queries made with both `departureCityCode` and `arrivalCityCode`.

3. A empty array will be rendered, if there are no flights found.

### Parameters

| Property          | Required? | Data Type | Description                                                                                          |
| ----------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| departureCityCode | Yes       | String    | 3-letter IATA code of departure city                                                                 |
| arrivalCityCode   | Yes       | String    | 3-letter IATA code of arrival city
| departureCountryCode | Yes       | String    | 2-letter IATA code of departure city                                                                 |
| arrivalCountryCode   | Yes       | String    | 2-letter IATA code of arrival city                                                         |
| airlineCode       | No        | String    | 2 or 3 letter airline code                                                                           |
| language          | No        | String    | The language that the response will be in. English as default                                        |
| siteCode          | No        | String    | Country Code of the user                                                                             |
| appType           | No        | String    | The application type of the originating request                                                      |
| deviceType        | No        | String    | The device type of the originating request                                                           |
| currencyCode      | No        | String    | Currency code in which you want the fares to be in. USD as default. Must be ISO currency code format |
| direct            | No        | Boolean   | To distinguish direct vs connecting flights. `direct` has precedence when used with `stops_count`    |
| validBy            | No        | String   | So far, valid value is `date`. This will filter schedules with only valid date relative to current date |
| order            | No        | String   | The attribute to be used in sorting the result |
| codeshareIndicator | No | String |
| maxTripDuration | No | String | The maximum trip duration of a given flight

### ExamplesS

* `/flights/flights?departureCityCode=SIN&arrivalCityCode=HAN&language=en&siteCode=sg&appType=web&deviceType=mobile&currencyCode=SGD`
* `/flights/flights?departureCityCode=SIN&arrivalCityCode=HAN&airlineCode=SQ`

### Response

```json
 {
    "id": 1061790,
    "outbound": {
      "departureTime": "14:55",
      "arrivalTime": "16:50",
      "durationTimeMinutes": 175,
      "departureAirportCode": "SIN",
      "arrivalAirportCode": "HAN",
      "airlineCodes": [
        "VJ"
      ],
      "stopoversCount": 0,
      "stopoverAirportCodes": [],
      "allicanceCodes": [],
      "marketingAirlineCode": "VJ",
      "stopoverDurationMinutes": 0,
      "duration": "2h 55m",
      "stopoverDuration": null,
      "arrivalDayTimeOffset": 0,
      "segments": [
        {
          "departureAirportCode": "SIN",
          "arrivalAirportCode": "HAN",
          "operatingAirlineCode": "VJ",
          "departureDayTime": "1455",
          "arrivalDayTime": "1650",
          "arrivalDayTimeOffset": "0",
          "duration": "175",
          "arrivalTime": "16:50",
          "departureTime": "14:55",
          "flightNumber": "916",
          "designatorCode": "VJ 916",
          "airlineCode": "VJ",
          "airlineName": "VietJet",
          "aircraftType": "320",
          "operatingFlightNumber": "916"
        }
      ]
    },
    "departure": {
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
    "arrival": {
      "city": {
        "code": "HAN",
        "name": "Hanoi",
        "permalink": "hanoi"
      },
      "country": {
        "code": "VN",
        "name": "Vietnam",
        "permalink": "vietnam"
      }
    },
    "schedules": [
      {
        "id": 43647426,
        "startDate": "2017-04-24",
        "endDate": "2017-04-30",
        "weekdays": [
          4,
          5,
          6,
          7
        ]
      },
      {
        "id": 43647427,
        "startDate": "2017-05-01",
        "endDate": "2017-10-08",
        "weekdays": [
          1,
          2,
          3,
          4,
          5,
          6,
          7
        ]
      }
    ]
  }
```
