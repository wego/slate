# Wego Redis Live Data

### [Flights](#flights)

* [Search Object](#flight-search-object)
* [List of All Fare Ids](#list-of-all-fare-ids)
* [Set of Fare Ids for a given Flight](#set-of-fare-ids-for-a-given-flight)
* [Map of Fares](#map-of-fares)
* [List of Flight Ids](#list-of-flight-ids)
* [Map of Flights](#map-of-flights)

___

### [Hotels](#hotels)

* [Search Object](#hotel-search-object)
* [List of All Rate Ids](#list-of-all-rate-ids)
* [Set of Rate Ids for a given Hotel](#set-of-rate-ids-for-a-given-hotel)
* [Rates Map](#rates-map)

___

### Flight Search Object

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:search:< searchId >"     | String    | A serialized Flight Search Object |

Example

```json
  {
    "flights:search:203d904b61c6d7e2": {
      "id":"203d904b61c6d7e2",
      "cabin":"economy",
      "adultsCount":1,
      "childrenCount":0,
      "infantsCount":0,
      "siteCode":"SG",
      "currencyCode":"SGD",
      "locale":"en",
      "createdAt":"2017-08-02T11:53:56.026+08:00[Asia/Singapore]",
      "key":"[cSIN:cMNL:2017-10-04]~1~0~0~SG~economy~desktop~web",
      "userCountryCode":"SG",
      "trips":[{
        "departureAirportCode":null,
        "departureCityCode":"SIN",
        "arrivalAirportCode":null,
        "arrivalCityCode":"MNL",
        "outboundDate":"2017-10-04[UTC]",
        "inboundDate":null
      }],
      "deviceType":"desktop",
      "appType":"web"
    }
  }
```

### List of All Fare IDs

List of all Fare Ids for a given search. This serves as a reference for faster lookups.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:search:< searchId >:fareids` | List    | A list of Fare Ids |

Example:

```
  "flight:search:7921330d44d084e2:fareids": [
    "7921330d44d084e2:sg.edreams.com:0",
    "7921330d44d084e2:sg.edreams.com:1",
    "7921330d44d084e2:sg.edreams.com:2",
    "7921330d44d084e2:sg.edreams.com:3",
    "7921330d44d084e2:sg.edreams.com:4",
    "7921330d44d084e2:sg.edreams.com:9"
  ]
```

*A fare ID is a combination of `Search ID, Provider Code and Index` delimited by colon.

---

### Set of Fare Ids for a given Flight

Set of all Fare Ids for a given Flight. This serves as a reference for faster lookups.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:< searchId >:< flightId >:fareids` | Set    | A set of Fare Ids for the given Flight |

Example:

```
  "flight:7921330d44d084e2:PR502-PR1809=PR2820-PR507:fareids": [
    "7921330d44d084e2:bravofly.com.sg:5",
    "7921330d44d084e2:sg.skygate-global.com:203"
  ]

```

---

### Map of Fares

Contains all fares for a given Search.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:search:< searchId >:faremap` | Hash    | Key = fareId, Value: Serialized Fare object |

Example:

```
  "flight:search:7921330d44d084e2:faremap": {

    "7921330d44d084e2:travel2be.com:51":  "{\"id\":\"7921330d44d084e2:travel2be.com:51\",\"searchKey\":\"[cSIN:cDVO:2017-10-07:2017-10-23]~1~0~0~SG~economy~desktop~web\",\"searchId\":\"7921330d44d084e2\",\"flightId\":\"7921330d44d084e2:PR502-PR2823=PR2808-PR507\",\"tripCode\":\"PR502-PR2823=PR2808-PR507\",\"params\":\"{\\\"optionCode\\\":\\\"9@Efw@!@Pc@5BVV9c@2bs@3@!@P6EQ@0@8@!@Pc@5BS@_Z@8@3tu@0@!GPY@4@0@!wy@.@7B@_E6cggx@8@!GRFH@1@!kv@0@8BSGP@2@1ks@!m@O63T@2@9@!s@9m1Y@S@I@Nu@V@O@0@7CTEZ@1@0kq@0\\\"}\",\"bookingParams\":null,\"deepLinkUrl\":null,\"createdAt\":null,\"price\":{\"amount\":380.0,\"currencyCode\":\"SGD\",\"totalAmount\":0.0,\"totalAmountUsd\":0.0,\"amountUsd\":279.12924,\"amountPerAdult\":379.91998,\"amountPerChild\":0.0,\"amountPerInfant\":0.0,\"originalAmount\":380.0,\"originalAmountUsd\":279.12924,\"taxAmount\":0.0,\"description\":null},\"providerCode\":\"travel2be.com\",\"paymentFees\":[{\"paymentMethodId\":15,\"currencyCode\":\"SGD\",\"amount\":0.0,\"amountUsd\":0.0},{\"paymentMethodId\":12,\"currencyCode\":\"SGD\",\"amount\":0.0,\"amountUsd\":0.0},{\"paymentMethodId\":4,\"currencyCode\":\"SGD\",\"amount\":0.0,\"amountUsd\":0.0},{\"paymentMethodId\":3,\"currencyCode\":\"SGD\",\"amount\":8.0,\"amountUsd\":5.632595}],\"promotionId\":0,\"routeSponsorId\":0,\"ecpc\":0.25}",

    "7921330d44d084e2:gotogate.sg:381":  "{\"id\":\"7921330d44d084e2:gotogate.sg:381\",\"searchKey\":\"[cSIN:cDVO:2017-10-07:2017-10-23]~1~0~0~SG~economy~desktop~web\",\"searchId\":\"7921330d44d084e2\",\"flightId\":\"7921330d44d084e2:PR502-PR2819=PR2364-PR922-CX711\",\"tripCode\":\"PR502-PR2819=PR2364-PR922-CX711\",\"params\":null,\"bookingParams\":null,\"deepLinkUrl\":\"https://www.gotogate.sg/from/wego/air/SINDVO07OCT23OCT/1/-/-/c:Y?entrytype=metasearch&selectionKey=PR502-07Oct17-E_PR2819-07Oct17-E_PR2364-23Oct17-U_PR922-23Oct17-X_CX711-23Oct17-Y%2C11opor2%2Ca_HI.SW.G4.KK.RS-b_7S-c_88-d_2151b0&ibe.ot=215280&ibe.cot=2.127SX11OBV\",\"createdAt\":null,\"price\":{\"amount\":2153.0,\"currencyCode\":\"SGD\",\"totalAmount\":0.0,\"totalAmountUsd\":0.0,\"amountUsd\":1581.6736,\"amountPerAdult\":2152.8,\"amountPerChild\":0.0,\"amountPerInfant\":0.0,\"originalAmount\":2153.0,\"originalAmountUsd\":1581.6736,\"taxAmount\":0.0,\"description\":null},\"providerCode\":\"gotogate.sg\",\"paymentFees\":[{\"paymentMethodId\":15,\"currencyCode\":\"SGD\",\"amount\":107.0,\"amountUsd\":78.885704},{\"paymentMethodId\":10,\"currencyCode\":\"SGD\",\"amount\":107.0,\"amountUsd\":78.885704}],\"promotionId\":0,\"routeSponsorId\":0,\"ecpc\":0.28}"
  }

```

---

### List of Flight Ids

List of Flight Ids for a given search ID. This serves as a reference for faster lookups.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:search:< searchId >:flightids` | List    | List of Flight Ids |

Example:

```
  "flight:search:7921330d44d084e2:flightids": [
    "7921330d44d084e2:PR518-PR2365=Z2522-Z27236",
    "7921330d44d084e2:PR510-PR1811=Z2522-Z27236",
    "7921330d44d084e2:PR510-PR2815=Z2522-Z27236",
    "7921330d44d084e2:PR510-PR1817=Z2522-Z27236",
    "7921330d44d084e2:PR510-PR2819=Z2522-Z27236",
  ]
 ```

* A flight ID is a combination of Search ID, and Leg ID(s). Whereas, Leg ID is a combination of Segments' Flight Number

---

### Map of Flights

Flights for a given search.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `flights:search:< searchId >:flightmap` | Hash    | Key = flightId, Value: Serialized Flight object |

```
"flight:search:7921330d44d084e2:flightmap": {
  "7921330d44d084e2:MH628-PR528-PR2825=PR1810-MH807-MH607": "{\"id\":\"7921330d44d084e2:MH628-PR528-PR2825=PR1810-MH807-MH607\",\"searchKey\":\"[SIN:DVO:2017-10-07:2017-10-23]~1~0~SG~SG\",\"searchId\":\"7921330d44d084e2\",\"createdAt\":null,\"outboundSegments\":[{\"id\":\"MH628-0712\",\"departureAirportCode\":\"SIN\",\"arrivalAirportCode\":\"KUL\",\"airlineCode\":\"MH\",\"departureTime\":\"2017-10-07T12:15:00.000+08:00[Asia/Singapore]\",\"arrivalTime\":\"2017-10-07T13:15:00.000+08:00[Asia/Kuala_Lumpur]\",\"designatorCode\":null,\"aircraftName\":\"Boeing 737-800\",\"aircraftCode\":\"738\",\"operatingAirlineCode\":null,\"flightNumber\":\"628\",\"cabin\":null},{\"id\":\"PR528-0716\",\"departureAirportCode\":\"KUL\",\"arrivalAirportCode\":\"MNL\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-07T16:00:00.000+08:00[Asia/Kuala_Lumpur]\",\"arrivalTime\":\"2017-10-07T19:30:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"528\",\"cabin\":null},{\"id\":\"PR2825-0721\",\"departureAirportCode\":\"MNL\",\"arrivalAirportCode\":\"DVO\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-07T21:00:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-07T22:50:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"2825\",\"cabin\":null}],\"inboundSegments\":[{\"id\":\"PR1810-2306\",\"departureAirportCode\":\"DVO\",\"arrivalAirportCode\":\"MNL\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-23T06:30:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-23T08:20:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"1810\",\"cabin\":null},{\"id\":\"MH807-2312\",\"departureAirportCode\":\"MNL\",\"arrivalAirportCode\":\"KUL\",\"airlineCode\":\"MH\",\"departureTime\":\"2017-10-23T12:50:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-23T16:25:00.000+08:00[Asia/Kuala_Lumpur]\",\"designatorCode\":null,\"aircraftName\":null,\"aircraftCode\":null,\"operatingAirlineCode\":null,\"flightNumber\":\"807\",\"cabin\":null},{\"id\":\"MH607-2319\",\"departureAirportCode\":\"KUL\",\"arrivalAirportCode\":\"SIN\",\"airlineCode\":\"MH\",\"departureTime\":\"2017-10-23T19:25:00.000+08:00[Asia/Kuala_Lumpur]\",\"arrivalTime\":\"2017-10-23T20:25:00.000+08:00[Asia/Singapore]\",\"designatorCode\":null,\"aircraftName\":null,\"aircraftCode\":null,\"operatingAirlineCode\":null,\"flightNumber\":\"607\",\"cabin\":null}],\"experienceScore\":695.33}",

  "7921330d44d084e2:PR512-PR1811=PR2820-PR501": "{\"id\":\"7921330d44d084e2:PR512-PR1811=PR2820-PR501\",\"searchKey\":\"[SIN:DVO:2017-10-07:2017-10-23]~1~0~SG~SG\",\"searchId\":\"7921330d44d084e2\",\"createdAt\":null,\"outboundSegments\":[{\"id\":\"PR512-0719\",\"departureAirportCode\":\"SIN\",\"arrivalAirportCode\":\"MNL\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-07T19:45:00.000+08:00[Asia/Singapore]\",\"arrivalTime\":\"2017-10-07T23:55:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"512\",\"cabin\":null},{\"id\":\"PR1811-0807\",\"departureAirportCode\":\"MNL\",\"arrivalAirportCode\":\"DVO\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-08T07:15:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-08T08:50:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A330\",\"aircraftCode\":\"330\",\"operatingAirlineCode\":null,\"flightNumber\":\"1811\",\"cabin\":null}],\"inboundSegments\":[{\"id\":\"PR2820-2319\",\"departureAirportCode\":\"DVO\",\"arrivalAirportCode\":\"MNL\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-23T19:50:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-23T21:30:00.000+08:00[Asia/Manila]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"2820\",\"cabin\":null},{\"id\":\"PR501-2415\",\"departureAirportCode\":\"MNL\",\"arrivalAirportCode\":\"SIN\",\"airlineCode\":\"PR\",\"departureTime\":\"2017-10-24T15:10:00.000+08:00[Asia/Manila]\",\"arrivalTime\":\"2017-10-24T18:50:00.000+08:00[Asia/Singapore]\",\"designatorCode\":null,\"aircraftName\":\"Airbus A321\",\"aircraftCode\":\"321\",\"operatingAirlineCode\":null,\"flightNumber\":\"501\",\"cabin\":null}],\"experienceScore\":639.33}"
}

```

---

## Hotels

### Hotel Search Object

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `hotels:search:< searchId >`     | String    | A serialized Hotel Search Object |

Example:

```
 "hotel:search:983138899accf3f2": "{\"id\":\"983138899accf3f2\",\"searchType\":\"CITY\",\"hotelId\":null,\"cityCode\":\"MNL\",\"districtId\":null,\"roomsCount\":1,\"guestsCount\":1,\"checkIn\":\"2017-10-07T00:00:00.000Z\",\"checkOut\":\"2017-10-21T00:00:00.000Z\",\"locale\":\"en\",\"siteCode\":\"PH\",\"currencyCode\":\"PHP\",\"userCountryCode\":\"SG\",\"deviceType\":\"DESKTOP\",\"appType\":\"WEB_APP\",\"key\":\"MNL~CITY~2017-10-07~2017-10-21~1~1~PH~en~DESKTOP~WEB_APP\",\"createdAt\":null}"

```

---
### List of All Rate Ids

List of all Rate Ids for a given search

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `hotels:search:< searchId >:rateids` | List    | A list of Rate Ids |

Example:

```
  "hotel:search:a6e93b97c3c9f6c6:rateids": [
    "a6e93b97c3c9f6c6:zenrooms.com:1354747:5",
    "a6e93b97c3c9f6c6:zenrooms.com:1354747:7",
    "a6e93b97c3c9f6c6:zenrooms.com:1288226:15",
    "a6e93b97c3c9f6c6:zenrooms.com:1354790:2",
    "a6e93b97c3c9f6c6:zenrooms.com:1354407:8",
    "a6e93b97c3c9f6c6:zenrooms.com:1354407:10",
    "a6e93b97c3c9f6c6:zenrooms.com:1354407:19",
    "a6e93b97c3c9f6c6:zenrooms.com:1337760:21",
    "a6e93b97c3c9f6c6:zenrooms.com:1337760:28",
    "a6e93b97c3c9f6c6:zenrooms.com:1354370:18",
    "a6e93b97c3c9f6c6:zenrooms.com:1354754:9"
  ]
 ```

---

### Set of Rate Ids for a given Hotel


Set of all Rate Ids for a given Hotel for a specific search

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `hotels:search:< searchId >:rateids` | Set    | A Set of Rate Ids |

Example:

```
 "hotel:693292:search:a6e93b97c3c9f6c6:rateids": [
   "a6e93b97c3c9f6c6:english.ctrip.com:693292:392",
   "a6e93b97c3c9f6c6:english.ctrip.com:693292:326",
   "a6e93b97c3c9f6c6:english.ctrip.com:693292:314",
   "a6e93b97c3c9f6c6:english.ctrip.com:693292:311"
  ]
```

---

### Rates Map

Flights for a given search.

| Key format                      | Value type| Description |
|---------------------------------|-----------|-------------|
| `hotels:search:< searchId >:ratemap` | Hash    | Key = rateId , Value: Serialized Rate object |

Example:

```
  "hotel:search:a6e93b97c3c9f6c6:ratemap": {
    "a6e93b97c3c9f6c6:english.ctrip.com:1576583:327":  "{\"createdAt\":\"2017-08-07T08:52:21.897Z\",\"rateAmenityCodes\":[\"BREAKFAST_INCLUDED\"],\"occupancy\":0,\"params\":{\"promo\":\"&promo=edm\",\"room_type_id\":\"71003838\",\"code\":null,\"bucket\":\"0\",\"agreement_term_id\":\"4737\"},\"provideCode\":\"english.ctrip.com\",\"id\":\"a6e93b97c3c9f6c6:english.ctrip.com:1576583:327\",\"hotelId\":1576583,\"providerHotelId\":\"4625157\",\"price\":{\"amount\":3514.1345,\"currencyCode\":\"PHP\",\"amountUsd\":69.76642,\"taxAmount\":629.3972,\"taxAmountUsd\":12.495478,\"taxInclusive\":true,\"ecpc\":0.26,\"localTaxAmount\":0.0,\"totalAmount\":49197.883,\"totalAmountUsd\":976.72986},\"providerCode\":\"english.ctrip.com\",\"deeplinkUrl\":\"https://english.ctrip.com/hotels/redirect?hotelid=4625157&city=364&Allianceid=2539&Sid=3094&checkin=2017-10-07&checkout=2017-10-21&shoppingid=013faa1b1d7e44a28222f4b37a06cb88&occupancy=2\",\"description\":\"Room Two Bedrooms  (Capacity: 2)\",\"searchKey\":\"MNL~CITY~2017-10-07~2017-10-21~1~1~PH~en~DESKTOP~WEB_APP\",\"searchId\":\"a6e93b97c3c9f6c6\",\"remainingRoomsCount\":null}",
    "a6e93b97c3c9f6c6:english.ctrip.com:640514:409": "{\"createdAt\":\"2017-08-07T08:52:21.897Z\",\"rateAmenityCodes\":[\"FREE_CANCELLATION\",\"BREAKFAST_INCLUDED\"],\"occupancy\":0,\"params\":{\"promo\":\"&promo=edm\",\"room_type_id\":\"49548818\",\"code\":null,\"bucket\":\"0\",\"agreement_term_id\":\"4737\"},\"provideCode\":\"english.ctrip.com\",\"id\":\"a6e93b97c3c9f6c6:english.ctrip.com:640514:409\",\"hotelId\":640514,\"providerHotelId\":\"2196948\",\"price\":{\"amount\":1813.2633,\"currencyCode\":\"PHP\",\"amountUsd\":35.998875,\"taxAmount\":329.68423,\"taxAmountUsd\":6.54525,\"taxInclusive\":true,\"ecpc\":0.26,\"localTaxAmount\":-1.0,\"totalAmount\":25385.686,\"totalAmountUsd\":503.98425},\"providerCode\":\"english.ctrip.com\",\"deeplinkUrl\":\"https://english.ctrip.com/hotels/redirect?hotelid=2196948&city=364&Allianceid=2539&Sid=3094&checkin=2017-10-07&checkout=2017-10-21&shoppingid=dc5736315cd24d03b2a093bc42c06707&occupancy=2\",\"description\":\"King Bed Room (Super Saver Promo) (Capacity: 2)\",\"searchKey\":\"MNL~CITY~2017-10-07~2017-10-21~1~1~PH~en~DESKTOP~WEB_APP\",\"searchId\":\"a6e93b97c3c9f6c6\",\"remainingRoomsCount\":null}"
  }
```
