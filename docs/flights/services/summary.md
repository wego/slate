# Summary Api
| Type | Endpoint                             | Description                                           |
| ---- | ------------------------------------ | ----------------------------------------------------- |
| GET  | [/flights/summaries](#get-summaries) | Get summary based on departure and arrival city code. |

## Get Summaries
Returns summary based on given departure and arrival city code.

```GET flights/summaries```

### Parameters

| Property            | Required? | Data Type | Description                                                   |
| ------------------- | --------- | --------- | ------------------------------------------------------------- |
| departure_city_code | Yes       | String    | 3-letter IATA code of departure city                          |
| arrival_city_code   | Yes       | String    | 3-letter IATA code of arrival city                            |
| language            | No        | String    | The language that the response will be in. English as default |


### Examples
  * `/flights/summaries?arrival_city_code=LON&departure_city_code=SIN`

  * `/flights/summaries?arrival_city_code=LON&departure_city_code=SIN&language=ar`

### Response
```
{
    "fastestTripDurationWithoutStop": 805,
    "averageTripDuration": 1111,
    "fastestTripDurationWithStop": 900,
    "earliestFlightDeparture": "00:05",
    "lastestFlightDeparture": "23:55",
    "shortestFlightDistance": 6776,
    "directAirlineCount": 3,
    "popularAirline": {
        "code": "QF",
        "name": "Qantas"
    },
    "arrivalTimeZone": "Europe/London",
    "departureTimeZone": "Asia/Singapore"
}
```