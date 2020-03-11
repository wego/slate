# Airlines Api

| Type  | Endpoint                                                                                   | Description                                       |
| ----- | ------------------------------------------------------------------------------------------ | ------------------------------------------------- |
| GET   | [/flights/v1/airlines](#list-airlines)                                                     | List airlines                                     |
| POST  | [/flights/v1/airlines](#create-airlines)                                                   | Create airlines                                   |
| PATCH | [/flights/v1/airlines](#update-airlines)                                                   | Update airlines                                   |
| DEL   | [/flights/v1/airlines](#delete-airlines)                                                   | Delete airlines                                   |
| GET   | [/flights/v1/airlines/search](#search-airlines-by-letter)                                                   | Search airlines by letter                                   |
| GET   | [/flights/v1/airlines/:airline_code](#show-airline)                                        | Show individual airline                           |
| GET   | [/flights/v1/airlines/:airline_code/permalinks](#show-all-locales-airline-permalinks)      | Get all locales permalinks for airline     |
| GET   | [/flights/v1/airlines/:airline_code/news](#show-airline-news)                              | Get individual airline news                       |
| GET   | [/flights/v1/airlines/:airline_code/videos](#show-airline-videos)                          | Get individual airline videos                     |
| GET   | [/flights/v1/airlines/:airline_code/routes](#show-airline-routes)                          | Get individual airline routes                     |
| GET   | [/flights/v1/airlines/:airline_code/destination](#show-airline-destination)                | Get individual airline destination                |
| GET   | [/flights/v1/airlines/:airline_code/airline_redirections](#show-airline-redirections)      | Get individual airline old code                   |
| GET   | [/flights/v1/airlines/:airline_code/similar](#show-similar-airlines)                       | List top 20 similar airlines                      |
| GET   | [/flights/v1/airlines/popular](#popular-airlines)                                          | List popular airlines by country                  |
| GET   | [/flights/v1/airlines/featured](#list-of-sprite-image)                                     | List feature by site code                         |
| GET   | [/flights/v1/airlines/leaderboard](#list-of-airline-clicks)                                | List AirlineClicks by cities                      |
| GET   | [/flights/v1/airlines/:airline_id/airline_images](#list-airline-images-by-airline)         | List Airline Image by airline                     |
| GET   | [/flights/v1/airlines/:airline_id/airline_images](#airline-image-by-id)                    | Show Particular Airline Image by airline image id |
| POST  | [/flights/v1/airlines/:airline_id/airline_images](#create-airline-image)                   | Create airline image                              |
| DEL   | [/flights/v1/airlines/:airline_id/airline_images/:airline_image_id](#delete-airline-image) | Delete airline image                              |

## List Airlines

`GET flights/v1/airlines`

### Changelog

19/06/2018: hub object included city_code for airline static page, plotting of route.

### Logic

1. If airport code is passed in, it will return all airlines with routes departing from or arriving at that airport.
2. Else, it will try to look for other parameters parsed in such as code and return the list of airlines based on the parameters.
3. If none is found, empty array `[]` is returned.

### Parameters

| Property      | Required? | Data Type | Description                                                   |
| ------------- | --------- | --------- | ------------------------------------------------------------- |
| codes         | no        | Array     | airline code                                                  |
| airport_code  | no        | String    |                                                               |
| key_transform | no        | String    | accept underscore. default is camelCase                       |
| language      | Yes       | String    | The language that the response will be in. English as default |
| siteCode      | Yes       | String    | Country Code of the user                                      |
| appType       | Yes       | String    | The application type of the originating request               |
| deviceType    | yes       | String    | The device type of the originating request                    |

### Example with airport_code

`flights/v1/airlines?airport_code=SIN&codes[]=DE`
note that `codes[]=DE` will be ignored.

> Request

```http
GET /flights/v1/airlines?airport_code=SIN&codes[]=DE
```

returns list of airlines object, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "id": 1297,
        "code": "3K",
        "name": "Jetstar Asia Airways",
        "nameEn": "Jetstar Asia Airways",
        "permalink": "jetstar-asia-airways",
        "marketingAirlineCode": "JQ",
        "colorHexPrimary": "#e85212",
        "headquarters": "Singapore",
        "fleetSize": 18,
        "destinationsCount": 21,
        "commencedOperations": "2004",
        "alliance": {
            "code": "lcc"
        },
        "countryCode": "SG",
        "icaoCode": "JSA",
        "iataCode": "3K",
        "hubs": [
            {
                "code": "FAI",
                "name": "Fairbanks International Airport",
                "cityCode": "FAI"
            },
            {
                "code": "SIN",
                "name": "Singapore Changi Airport",
                "cityCode": "SIN"
            }
        ],
        "fees": [],
        "videos": [],
        "news": [
            {
                "title": "Thailand Boosts its Global Connectivity",
                "description": "Among these, Thai Airways, Qatar Airways and Turkish Airlines have already ... Meanwhile, Jetstar Asia Airways plans four weekly services ...",
                "source": "Travel Trade Daily",
                "url": "https://traveltradedaily.com/asia-pacific-air/item/1858-thailand-boosts-its-global-connectivity",
                "thumbnail": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSmG0cNR_PbZE0t6oYZxG7oW2Gma3TbuUDloIUi4CDU4macEo0rRQWMHU9quxuMLjmHj8TS5E8",
                "publishedAt": "2017-08-13 16:00:00"
            }
        ],
        "images": [],
        "subsidiaries": []
    },
    {
        "id": 730,
        "code": "5J",
        "name": "Cebu Pacific",
        "nameEn": "Cebu Pacific",
        "permalink": "cebu-pacific",
        "marketingAirlineCode": "5J",
        "colorHexPrimary": "#006033",
        "headquarters": "Pasay City, Philippines",
        "fleetSize": 52,
        "destinationsCount": 58,
        "commencedOperations": "1996",
        "iosaRegistered": false,
        "slogan": "Why everyone flies.",
        "alliance": {
            "code": "lcc"
        },
        "countryCode": "PH",
        "icaoCode": "CEB",
        "iataCode": "5J",
        "hubs": [
            {
                "code": "CEB",
                "name": "Cebu Airport"
            },
            {
                "code": "CRK",
                "name": "Clark International Airport"
            },
            {
                "code": "DVO",
                "name": "Davao Airport"
            },
            {
                "code": "ILO",
                "name": "Ilo-Ilo Airport"
            },
            {
                "code": "KLO",
                "name": "Kalibo Airport"
            },
            {
                "code": "MNL",
                "name": "Manila Ninoy Aquino International Airport"
            }
        ],
        "fees": [],
        "videos": [
            {
                "videoId": "_ZRTy7GUZ-I",
                "title": "Cebu Pacific Air A330 Flight Experience: 5J805 Manila to Singapore",
                "description": "Cebu Pacific Air low-cost flying experience from Manila to Singapore, onboard the Airbus A330-300 aircraft in mono-class configuration. The flight departs from ...",
                "channelTitle": "FlightTravels",
                "thumbnail": "https://i.ytimg.com/vi/_ZRTy7GUZ-I/hqdefault.jpg",
                "viewCount": 184428,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2015-07-16 07:00:01"
            },
            {
                "videoId": "7SEQQX0zS6w",
                "title": "Cebu Pacific Air 5J 110 Manila to Hong Kong on Airbus A330-300",
                "description": "Here's the updated video of Cebu Pacific flight 110 from Manila to Hong Kong on Airbus A330-300 Big Juan.",
                "channelTitle": "OwenTravels",
                "thumbnail": "https://i.ytimg.com/vi/7SEQQX0zS6w/hqdefault.jpg",
                "viewCount": 16606,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2015-06-08 03:44:51"
            },
            {
                "videoId": "x-dpMPgOCNI",
                "title": "Cebu Pacific A330 Flight Experience: 5J804 Singapore to Manila",
                "description": "A red eye flight with Cebu Pacific from Singapore to Manila onboard it's mono-class A330-300. Cebu Pacific is Philippines' low cost carrier and the second ...",
                "channelTitle": "Travelstar98 Gaudi",
                "thumbnail": "https://i.ytimg.com/vi/x-dpMPgOCNI/hqdefault.jpg",
                "viewCount": 16354,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2017-08-07 18:56:39"
            },
            {
                "videoId": "4ll5IYYVHK8",
                "title": "Cebu Pacific Air A330-300 Experience 5J 8564 Cebu to Manila",
                "description": "Owen's Travel Adventure ✈ Flight: 5J 8564 Cebu Pacific Air Airbus A330-300 Departure: 28 May 2014 / 8:40 AM Arrival: 28 May 2014 / 10:00 AM It was another ...",
                "channelTitle": "OwenTravels",
                "thumbnail": "https://i.ytimg.com/vi/4ll5IYYVHK8/hqdefault.jpg",
                "viewCount": 71878,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2014-07-07 03:07:08"
            },
            {
                "videoId": "l0eR-WQE8G0",
                "title": "New Cebu Pacific Airbus A330-300 Cabin by HourPhilippines.com",
                "description": "New Cebu Pacific Airbus A330-300 Cabin. On 25 September 2013 at the Aviation Expo China (Beijing Airshow), Airbus announced a new lower weight variant ...",
                "channelTitle": "Hour Philippines TV",
                "thumbnail": "https://i.ytimg.com/vi/l0eR-WQE8G0/hqdefault.jpg",
                "viewCount": 17183,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2014-06-20 04:45:42"
            },
            {
                "videoId": "ZuL5mtpNmRE",
                "title": "TRIPREPORT | Cebu Pacific (Economy) | Davao City to Manila | Airbus A330-343 |",
                "description": "Enjoy a trip report on board a Cebu Pacific flight from Davao to Manila, on their Airbus A330-300! Music by Chillhop: http://chillhop.com/listen Misrishi Records- ...",
                "channelTitle": "Universal Aviation",
                "thumbnail": "https://i.ytimg.com/vi/ZuL5mtpNmRE/hqdefault.jpg",
                "viewCount": 2816,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2017-09-14 00:05:14"
            },
            {
                "videoId": "l0eR-WQE8G0",
                "title": "New Cebu Pacific Airbus A330-300 Cabin by HourPhilippines.com",
                "description": "New Cebu Pacific Airbus A330-300 Cabin. On 25 September 2013 at the Aviation Expo China (Beijing Airshow), Airbus announced a new lower weight variant ...",
                "channelTitle": "Hour Philippines TV",
                "thumbnail": "https://i.ytimg.com/vi/l0eR-WQE8G0/hqdefault.jpg",
                "viewCount": 17544,
                "aircraftCode": "330",
                "aircraftName": "Airbus A330",
                "cabinClass": "economy",
                "publishedAt": "2014-06-20 04:45:42"
            }
        ],
        "news": [
            {
                "title": "Cebu Pacific flights cancelled",
                "description": "The Manila International Airport Authority (MIAA) said that as of 8 a.m., affected flights include Cebu Pacific 5J 506 (Manila-Tuguegarao) and ...",
                "source": "Inquirer.net",
                "url": "http://newsinfo.inquirer.net/928258/cebu-pacific-flights-cancelled",
                "thumbnail": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT72sfL2W7j5KRs-ok5BVfCqCfQqS8a8X3k6_-rnUex-_LknYxMTnmdGlgn8N_v2zG8FaMzBWPM",
                "publishedAt": "2017-09-04 16:00:00"
            },
            {
                "title": "Cebu Pacific waives fees for booking changes",
                "description": "MANILA - Cebu Pacific, the country's largest airline, said Friday it started waiving fees for rebooking and changes in flight details as long as ...",
                "source": "ABS-CBN News",
                "url": "http://news.abs-cbn.com/business/08/18/17/cebu-pacific-waives-fees-for-booking-changes",
                "thumbnail": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRB7tftXucUE2-8gtAovw1gQLwjXy6nmoI2w5jSOqKtxWJoseAVrMux0Rln59qOZhXHVXD57oI",
                "publishedAt": "2017-08-17 16:00:00"
            },
            {
                "title": "Cebu Pacific to add holiday season flights to Japan, Vietnam ...",
                "description": "HOLIDAY RUSH. Cebu Pacific will be adding flights to popular regional destinations in the next few months. File photo from Cebu Pacific.",
                "source": "Rappler",
                "url": "https://www.rappler.com/business/180751-cebu-pacific-flights-japan-vietnam-indonesia-q4-2017-q1-2018",
                "thumbnail": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS7bV-MswPJfexfiKsHTAUaGImeAChE25ogyItt6lyt7tcAGb2YlsNxiJGNGGgE_W7InXRDUpaH",
                "publishedAt": "2017-08-30 16:00:00"
            },
            {
                "title": "Cebu Pacific Boosts Davao Hub With Direct Route To Tagbilaran",
                "description": "Cebu Pacific continues to grow its domestic network, adding a new route that will directly link Davao City with Tagbilaran, Bohol. Starting ...",
                "source": "Aviation Tribune",
                "url": "http://aviationtribune.com/airlines/asia/cebu-pacific-boosts-davao-hub-direct-route-tagbilaran/",
                "thumbnail": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTkWoEsIVsch7kWRI2sWtzqSnWryzNSgLMg2-t_b5E_phKjPzH-OBj4GU7l5oHWf5U41PreGAo",
                "publishedAt": "2017-09-15 10:12:28"
            }
        ],
        "images": [
            {
                "imageUrl": "https://res.cloudinary.com/wego/image/upload/v1508760851/flights/airlines_hero/5J_1.jpg"
            }
        ],
        "subsidiaries": []
    }
```

### Example with codes

`flights/v1/airlines?codes[]=DE`

> Request

```http
GET /flights/v1/airlines?codes[]=DE
```

returns list of airlines, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "id": 819,
    "code": "DE",
    "name": "Condor Flugdienst",
    "nameEn": "Condor Flugdienst",
    "permalink": "condor-flugdienst",
    "marketingAirlineCode": "DE",
    "colorHexPrimary": "#000000",
    "headquarters": "Frankfurt, Germany",
    "fleetSize": 35,
    "commencedOperations": "1956",
    "slogan": "Wir lieben Fliegen.",
    "alliance": {
      "code": null
    },
    "countryCode": "DE",
    "icaoCode": "CFG",
    "iataCode": "DE",
    "hubs": [
      {
        "code": "FRA",
        "name": "Frankfurt International Airport",
        "cityCode": "FRA"
      }
    ],
    "fees": [],
    "videos": [
      {
        "videoId": "jpklvWeAmtA",
        "title":
          "Condor | Premium Economy | Fortaleza - Frankfurt | Boeing 767-300",
        "description":
          "(Scroll down for english) Ponto de Embarque - instagram.com/pontodeembarque Vídeo do voo da Condor Flugdienst entre Fortaleza (FOR) e Frankfurt (FRA), ...",
        "channelTitle": "Ponto de Embarque",
        "thumbnail": "https://i.ytimg.com/vi/jpklvWeAmtA/hqdefault.jpg",
        "viewCount": 32671,
        "aircraftCode": "767",
        "aircraftName": "Boeing 767",
        "cabinClass": "economy",
        "publishedAt": "2016-10-02 13:47:40"
      }
    ],
    "news": [
      {
        "title": "Deals Rumor Mill: Toshiba, Air Berlin, JBF RAK",
        "description":
          "... in buying at least some of Air Berlin's assets, including Condor Flugdienst GmbH, INTRO-Verwaltungs GmbH and Deutsche Lufthansa AG.",
        "source": "Law360 (subscription)",
        "url":
          "https://www.law360.com/articles/958174/deals-rumor-mill-toshiba-air-berlin-jbf-rak",
        "publishedAt": "2017-08-27 16:00:00"
      },
      {
        "title": "Condor bekräftigt Interesse an Niki",
        "description":
          "Diese Condor-Retro-Maschine trägt den Namen Achim, jedoch zu Ehren ... definitiv nicht (Foto: Condor Flugdienst GmbH, Stefan Rebscher).",
        "source": "Austrian Aviation Net",
        "url":
          "http://www.austrianaviation.net/detail/condor-bekraeftigt-interesse-an-niki/",
        "thumbnail":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRD3wVDm3U1r1DZkkDJAWVOU0vTzMITgs1fcdUbGBTVb3A8WhDsywgGOTmyYILdU4Uo0v1PzMf-",
        "publishedAt": "2017-08-24 16:00:00"
      },
      {
        "title": "Condor appoints new MD",
        "description":
          "Condor Flugdienst appointed (14-Sep-2017) Christian Schmitt as accountable and managing director, succeeding Uwe Balser. Mr Schmitt ...",
        "source": "CAPA - Centre for Aviation",
        "url":
          "https://centreforaviation.com/news/wechsel-an-der-spitze-von-condor-715189",
        "publishedAt": "2017-09-15 08:51:45"
      },
      {
        "title": "Neuer Vorstand bei Condor",
        "description":
          "Christian Schmitt (41) wurde heute vom Condor Aufsichtsrat in die Gesch?ftsf?hrung der Condor Flugdienst berufen und verantwortet ab sofort ...",
        "source": "aeroTELEGRAPH",
        "url": "http://www.aerotelegraph.com/neuer-vorstand-bei-condor",
        "thumbnail":
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSu82EUu_ow2EOGLTNrOq5o4VBRDfobhNdzIDkLsp4pk4Yb8KvVIxqPDsLO9wQr6tbV9xvq7dU",
        "publishedAt": "2017-09-14 11:51:45"
      },
      {
        "title": "New charter flights from Europe",
        "description":
          "Thomas Cook Airlines Belgium, founded in 2002 and based at Brussels Airport, and low-cost carrier Condor Flugdienst plan to operate flights ...",
        "source": "Phuket Gazette",
        "url":
          "https://www.phuketgazette.net/phuket-news/New-charter-flights-Europe",
        "publishedAt": "2017-08-21 16:00:00"
      }
    ],
    "images": [],
    "subsidiaries": []
  }
]
```

## Create Airlines

`POST flights/v1/airlines`

### Logic

1. Passing in `hub_codes` will be checking for valid airline code in `Airport` table.
2. if `airline` is successfully created, `airline_hubs` table will create records based on `hub_codes`.
3. `Airline translations` may also create records based on translations_attributes parsed.
4. `Airline Redirection` table will delete its record if the newly created code exist in `Airline Redirection` table.
    > Airline redirection table is for routing of webpages. It exist old_code of airline, if a url hits the old_code, it can redirect the url to the new code.

### Parameters

| Property               | Required? | Data Type | Description                                                                |
| ---------------------- | --------- | --------- | -------------------------------------------------------------------------- |
| name                   | Yes       | Array     | airline code                                                               |
| code                   | Yes       | String    |                                                                            |
| star_rating            | no        | Float     |                                                                            |
| hub_codes              | Yes       | String    | Must be a valid airline code. Comma separated value, minimum 1, maximum 3. |
| country_code           | No        | String    | 3 Letter Code                                                              |
| color_hex_primary      | No        | String    |                                                                            |
| marketing_airline_code | No        | String    |                                                                            |
| alliance               | No        | String    |                                                                            |
| website_id             | No        | String    |                                                                            |
| icao                   | No        | String    |                                                                            |
| routes_count           | No        | Integer   |                                                                            |
| headquarters           | No        | String    |                                                                            |
| fleet_size             | No        | Integer   |                                                                            |
| destination_counts     | No        | Integer   |                                                                            |
| commenced_operations   | No        | String    |                                                                            |
| iosa_registered        | No        | Boolean   |                                                                            |
| slogan                 | No        | String    |                                                                            |
| subsidiary_codes       | No        | String    |                                                                            |
| direct                 | No        | Boolean   |                                                                            |
| translation_attributes | No        | String    |                                                                            |
| excluded_direct_pos    | No        | Array     |                                                                            |  |
| siteCode               | Yes       | String    | Country Code of the user                                                   |
| appType                | Yes       | String    | The application type of the originating request                            |
| deviceType             | yes       | String    | The device type of the originating request                                 |

### Example

`POST /flights/airlines/`

> Request

```http
POST /flights/airlines/
```

```json
{
  "name": "KAI",
  "code": "rw1",
  "hub_codes": "SIN,AAL",
  ...
}
```

returns object request, status 201 Created

> Response

```http
HTTP 201
```

```json
{
  "name": "KAI",
  "code": "rw1",
  "country_code": "SG",
  "color_hex_primary": "#c60119",
  "marketing_airline_code": "AB",
  "alliance": "star_alliance",
  "website_id": "aircanada_com",
  "iosa_registered": "1",
  "icao": "ABC",
  "commenced_operations": "2011-12-25",
  "slogan": "slogan",
  "star_rating": 20,
  "whodunnit": 3,
  "hub_codes": "SIN,AAL",
  "direct": false,
  "translations_attributes": [
    {
      "locale": "AR",
      "name": "AR text"
    }
  ]
}
```

## Update Airlines

`PATCH flights/v1/airlines/:id`

### Logic

1. if hub_codes is specified, the previous `airline_hubs` based on the `airline_id` will be deleted and create new ones.
2. if you update a code, `airline_redirection` table will create a new row to store old_code.

### Parameters

| Property               | Required? | Data Type | Description                                                                |
| ---------------------- | --------- | --------- | -------------------------------------------------------------------------- |
| name                   | No        | Array     | airline code                                                               |
| code                   | No        | String    |                                                                            |
| star_rating            | No        | Float     |                                                                            |
| hub_codes              | No        | String    | Must be a valid airline code. Comma separated value, minimum 1, maximum 3. |
| country_code           | No        | String    | 3 Letter Code                                                              |
| color_hex_primary      | No        | String    |                                                                            |
| marketing_airline_code | No        | String    |                                                                            |
| alliance               | No        | String    |                                                                            |
| website_id             | No        | String    |                                                                            |
| icao                   | No        | String    |                                                                            |
| routes_count           | No        | Integer   |                                                                            |
| headquarters           | No        | String    |                                                                            |
| fleet_size             | No        | Integer   |                                                                            |
| destination_counts     | No        | Integer   |                                                                            |
| commenced_operations   | No        | String    |                                                                            |
| iosa_registered        | No        | Boolean   |                                                                            |
| slogan                 | No        | String    |                                                                            |
| subsidiary_codes       | No        | String    |                                                                            |
| direct                 | No        | Boolean   |                                                                            |
| translation_attributes | No        | String    |                                                                            |
| excluded_direct_pos    | No        | Array     |                                                                            |

### Example

`PATCH /flights/airlines/1`

> Request

```http
PATCH /flights/airlines/1
```

returns updated object, status 200 OK

> Response

```http
HTTP 200
```

```json
{
  "code": "ABC",
  "hub_codes": "TSA"
}
```

## Delete Airline

`DELETE /flights/v1/routes/:id`

### Logic

Return status 200 ok if delete successful

### Example

`DELETE /flights/v1/routes/:id`

> Request

```http
DELETE /flights/v1/routes/200
```

returns empty body, status 200 OK

> Response

```http
HTTP 200
```

## Show Airline

`GET /flights/v1/airlines/:airline_code`

### Example

`GET /flights/v1/airlines/SQ`

> Request

```http
GET /flights/v1/airlines/SQ
```

returns object requested, status 200 OK

> Response

```http
HTTP 200
```

```json
{
  "id": 1907,
  "code": "SQ",
  "name": "Singapore Airlines",
  "nameEn": "Singapore Airlines",
  "permalink": "singapore-airlines",
  "marketingAirlineCode": "SQ",
  "colorHexPrimary": "#0c1645",
  "headquarters": "Singapore",
  "fleetSize": 113,
  "destinationsCount": 64,
  "commencedOperations": "1972",
  "iosaRegistered": false,
  "slogan": "A Great Way to Fly",
  "alliance": {
    "code": "star_alliance"
  },
  "countryCode": "SG",
  "icaoCode": "SIA",
  "iataCode": "SQ",
  "hubs": [
    {
      "code": "SIN",
      "name": "Singapore Changi Airport"
    }
  ],
  "fees": [],
  "videos": [
    {
      "videoId": "4zCndmK_540",
      "title":
        "Singapore Airlines SQ 319 LHR - SIN B777-300ER First Class Flight Report",
      "description":
        "Welcome onboard my LHR - SIN leg of my trip. I was very fortunate to have been upgraded from business class to first class. I was already excited that I could try out the new (and by new I...",
      "channelTitle": "Flying Higher",
      "thumbnail": "https://i.ytimg.com/vi/4zCndmK_540/hqdefault.jpg",
      "viewCount": 34280,
      "aircraftCode": "319",
      "aircraftName": "Airbus A319",
      "cabinClass": "business",
      "publishedAt": "2017-04-12 16:30:34"
    }
  ],
  "news": [
    {
      "title":
        "Singapore Airlines is bringing back a nonstop flight from Newark to ...",
      "description":
        "Singapore Airlines this week announced it would revive its non-stop flight from the New York City area this fall. The 18-hour and 45 minute flight ...",
      "source": "CNBC",
      "url":
        "https://www.cnbc.com/2018/06/02/singapore-airlines-is-bringing-back-the-worlds-longest-flight.html",
      "thumbnail":
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSrSKvXM3zJ5xfTJzURRICwHtEeto1z9TuSkA_g_HPiL0juQ1OCJkJysyTdhJ474QmDhEp5RhYG",
      "publishedAt": "2018-06-02 16:14:40"
    }
  ],
  "images": [],
  "subsidiaries": [
    {
      "id": 1901,
      "code": "MI",
      "name": "SilkAir",
      "nameEn": "SilkAir",
      "permalink": "silkair",
      "marketingAirlineCode": "MI",
      "colorHexPrimary": "#00584f",
      "headquarters": "Singapore",
      "fleetSize": 31,
      "destinationsCount": 54,
      "commencedOperations": "1992",
      "iosaRegistered": false,
      "slogan": "A joy to fly",
      "alliance": {
        "code": ""
      },
      "countryCode": "SG",
      "icaoCode": "SLK",
      "iataCode": "MI"
    }
  ]
}
```

## Search airlines by letter

`GET /flights/v1/airlines/search`

### Parameters

| Property      | Required? | Data Type | Description                          |
| ------------- | --------- | --------- | ------------------------------------ |
| locale        | Yes        | String    |                                      |
| letter | Yes        | String    | Letter that wants to be search. If searching for airlines starting with numerics, input '0' |

### Example

`GET /flights/v1/airlines/search?locale=vi&letter=0`

> Request

```http
GET /flights/v1/airlines/search?locale=vi&letter=0
```

returns list of airlines, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "id": 3,
        "name": "40 Mile Air",
        "code": "Q5",
        "permalink": "40-mile-air"
    },
    {
        "id": 5611,
        "name": "9G Rail",
        "code": "9G",
        "permalink": "9g-rail"
    }
]
```

## Show All Locales Airline Permalinks

`GET flights/airlines/:airline_code/permalinks`

### Parameters

| Property      | Required? | Data Type | Description                          |
| ------------- | --------- | --------- | ------------------------------------ |
| airline_code  | Yes       | String    | Airline Code                         |

### Example

`GET flights/airlines/EI/permalinks`

> Request

```http
GET flights/airlines/EI/permalinks?airline_code
```

returns object requested, status 200 OK

> Response

```http
HTTP 200
```

```json
{
    "code": "SV",
    "permalinks": {
        "en": "saudi-airlines-saudia",
        "zh-cn": "saudi-airlines-saudia",
        "ar": "saudi-airlines-saudia",
        "fr": "saudi-airlines",
        "id": "saudi-arabian-airlines",
        "fa": "saudi-airlines-saudia",
        "zh-hk": "saudi-airlines-saudia",
        "zh-tw": "saudi-airlines-saudia",
        "ja": "saudi-airlines-saudia",
        "ko": "saudi-airlines-saudia",
        "th": "saudi-airlines-saudia",
        "tr": "saudi-airlines-saudia"
    }
}
```

## Show Airline News

`GET /flights/v1/airlines/:airline_code/news`

### Parameters

| Property      | Required? | Data Type | Description                          |
| ------------- | --------- | --------- | ------------------------------------ |
| locale        | No        | String    |                                      |
| key_transform | No        | String    | default camelCase. can be underscore |

### Example

`GET /flights/v1/airlines/SQ/news?key_transform=underscore&locale=ar`

> Request

```http
GET /flights/v1/airlines/SQ/news?key_transform=underscore&locale=ar
```

returns list of news objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "title":
      "الخطوط الجوية السنغافورية ستطلق أطول رحلة طيران في العالم خلال أكتوبر",
    "description":
      "أعلنت الخطوط الجوية السنغافورية عن إطلاق أطول رحلة طيران تجارية ... كانت أطول الرحلات على مستوى العالم، وفقاً لمزودة بيانات خطوط الطيران “أو إيه جي”.",
    "source": "اخبار الامارات العاجلة",
    "url": "https://www.emaratyah.ae/908440.html",
    "thumbnail":
      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQK6z0JhcC_tEE8T150aRU0OxPd5bBT2yDsXlRsq6FMpHmBjQ9L5EYQgUVLvVL_z40hBUzRZGce",
    "published_at": "2018-06-03 00:14:51"
  },
  {
    "title":
      "الخطوط الجوية السنغافورية ستطلق أطول رحلة طيران تجارية في العالم ...",
    "description":
      "ستطلق الخطوط الجوية السنغافورية أطول رحلة طيران تجارية بالعالم في ... وقالت خطوط الطيران السنغافورية الأربعاء إنها تخطط لتقديم رحلة من دون توقف ...",
    "source": "أرقام",
    "url": "https://www.argaam.com/ar/article/articledetail/id/551619",
    "published_at": "2018-05-31 08:14:51"
  }
]
```

## Show Airline Videos

`GET /flights/v1/airlines/:airline_code/videos`

### Parameters

| Property        | Required? | Data Type | Description                                       |
| --------------- | --------- | --------- | ------------------------------------------------- |
| aircraft_code   | No        | String    |                                                   |
| locale          | No        | String    |                                                   |
| cabin_class     | No        | String    | "business", "economy", "first", "premium-economy" |
| min_views_count | No        | Integer   |                                                   |
| key_transform   | No        | String    | default camelCase. can be underscore              |

### Example

`GET /flights/v1/airlines/SQ/videos?key_transform=underscore&aircraft_code=319&min_views_count=3000&aircraft_code=319`

> Request

```http
GET /flights/v1/airlines/SQ/videos?key_transform=underscore&aircraft_code=319&min_views_count=3000&aircraft_code=319
```

returns list of video objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "video_id": "4zCndmK_540",
    "title":
      "Singapore Airlines SQ 319 LHR - SIN B777-300ER First Class Flight Report",
    "description":
      "Welcome onboard my LHR - SIN leg of my trip. I was very fortunate to have been upgraded from business class to first class. I was already excited that I could try out the new (and by new I...",
    "channel_title": "Flying Higher",
    "thumbnail": "https://i.ytimg.com/vi/4zCndmK_540/hqdefault.jpg",
    "view_count": 34280,
    "aircraft_code": "319",
    "aircraft_name": "Airbus A319",
    "cabin_class": "business",
    "published_at": "2017-04-12 16:30:34"
  }
]
```

## Show Airline Routes

`GET /flights/v1/airlines/:airline_code/routes`

### Logic

1. Go to `Route` table query by airline code with status active and sort by popularity.
2. Note: if more than one params among countryCode/cityCode/airportCode are given, the favor will be in the following order airportCode > cityCode > countryCode

### Parameters

| Property    | Required? | Data Type | Description                                                                                          |
| ----------- | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
| airlineCode | Yes       | String    | Airline IATA code                                                                                    |
| countryCode | No        | String    | Departure/arrival country code (if specified, the method will return routes from/to a given country) |
| cityCode    | No        | String    | Departure/arrival city code (if specified, the method will return routes from/to a given city)       |
| airportCode | No        | String    | Departure/arrival airport code (if specified, the method will return routes from/to a given airport) |

### Example

* `/flights/v1/airlines/AA/routes?perPage=200&countryCode=US&cityCode=NYC&airportCode=DFW` => query using airportCode

* `/flights/v1/airlines/AA/routes?perPage=200&countryCode=US&cityCode=NYC` => query using cityCode

* `/flights/v1/airlines/AA/routes?perPage=200&countryCode=US` => query using countryCode

> Request

```http
GET /flights/v1/airlines/SQ/routes
```

returns list of airline route objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "departure": {
      "code": "SYD",
      "name": "Sydney",
      "lat": -33.8688,
      "long": 151.209
    },
    "arrival": {
      "code": "LON",
      "name": "London",
      "lat": 51.5074,
      "long": -0.127758
    }
  },
  {
    "departure": {
      "code": "SYD",
      "name": "Sydney",
      "lat": -33.8688,
      "long": 151.209
    },
    "arrival": {
      "code": "SEL",
      "name": "Seoul",
      "lat": 37.5665,
      "long": 126.978
    }
  },
  ...
]
```

## Show Airline Destination

`GET /flights/v1/airlines/:airline_code/destinations`

### Parameters

| Property | Required? | Data Type | Description        | Default      |
| -------- | --------- | --------- | ------------------ | ------------ |
| order    | No        | String    | "popularity"       | alphabetical |
| page     | No        | String    | Offset number      | 1            |
| per_page | No        | String    | number to return   | 10           |
| locale   | No        | String    | language of result | en           |

### Example

`GET /flights/v1/airlines/SQ/destinations?per_page=100`

> Request

```http
GET /flights/v1/airlines/SQ/destinations?per_page=100
```

returns list of airline destination objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "code": "ADL",
    "name": "Adelaide"
  },
  {
    "code": "AKL",
    "name": "Auckland"
  },
  {
    "code": "AMD",
    "name": "Ahmedabad"
  },
  {
    "code": "AMS",
    "name": "Amsterdam"
  },
  {
    "code": "BCN",
    "name": "Barcelona"
  },
  {
    "code": "BJS",
    "name": "Beijing"
  },
  {
    "code": "BKK",
    "name": "Bangkok"
  },
  {
    "code": "BLR",
    "name": "Bangalore"
  },
  {
    "code": "BNE",
    "name": "Brisbane"
  },
  ...
]
```

### Example

`GET /flights/v1/airlines/SQ/destinations?per_page=100&order=popularity`

> Request

```http
GET /flights/v1/airlines/SQ/destinations?per_page=100&order=popularity`
```

returns list of airline destination objects, status 200

> Response

```http
HTTP 200
```

```json
[
  {
    "code": "SIN",
    "name": "Singapore",
    "permalink": "singapore",
    "countryCode": "SG",
    "countryName": "Singapore",
    "countryPermalink": "singapore"
  },
  {
    "code": "MAN",
    "name": "Manchester",
    "permalink": "manchester",
    "countryCode": "GB",
    "countryName": "United Kingdom",
    "countryPermalink": "united-kingdom"
  },
  {
    "code": "FRA",
    "name": "Frankfurt",
    "permalink": "frankfurt",
    "countryCode": "DE",
    "countryName": "Germany",
    "countryPermalink": "germany"
  }
  ...
]
```

## Show Airline Redirections

`GET /flights/v1/airlines/:airline_code/airline_redirections`

### Logic

1. airline code in the params is the old code
2. will return new code together with permalink

### Example

`GET /flights/v1/airlines/fad/airline_redirections`

> Request

```http
GET /flights/v1/airlines/fad/airline_redirections
```

returns object requested, status 200 OK

> Response

```http
HTTP 200
```

```json
{
  "code": "F3",
  "permalink": "flyadeal"
}
```

## Show Similar Airlines

`GET /flights/v1/airlines/:airline_code/similar`

### Logic

Return the top 20 similar airline of a given airline_code. The similarity take account of the number of common routes.

1. Query similar airline table and order by rank

### Example

`GET /flights/v1/airlines/SQ/similar`

> Request

```http
GET /flights/v1/airlines/SQ/similar
```

returns list of airlines object, status 200 OK


> Response

```http
HTTP 200
```

```json
[
  {
    "code": "TG",
    "name": "Thai Airways",
    "permalink": "thai-airways"
  },
  {
    "code": "CX",
    "name": "Cathay Pacific",
    "permalink": "cathay-pacific"
  },
  {
    "code": "EK",
    "name": "Emirates",
    "permalink": "emirates"
  },
  {
    "code": "MH",
    "name": "Malaysia Airlines",
    "permalink": "malaysia-airlines"
  },
  ...
]
```

## Popular Airlines

`GET /flights/v1/airlines/popular`

### Logic

1. Goes to route table to search for popular airline by country code.
    > Popular logic is by setting departure_code as the airline hub, with status being active and a direct flight and sorted by the most number of flights.

### Parameters

| Property     | Required? | Data Type | Description |
| ------------ | --------- | --------- | ----------- |
| country_code | Yes       | String    |             |

### Example

`GET /flights/v1/airlines/popular?country_code=SG`

> Request

```http
GET /flights/v1/airlines/popular?country_code=SG
```

returns list of airline objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "id": 2095,
        "code": "TR",
        "name": "Scoot",
        "nameEn": "Scoot",
        "permalink": "scoot",
        "marketingAirlineCode": "TR",
        "colorHexPrimary": "#fee104",
        "headquarters": "Singapore",
        "fleetSize": 37,
        "destinationsCount": 59,
        "commencedOperations": "2012",
        "iosaRegistered": true,
        "slogan": "Get Outta Here!",
        "alliance": {
            "code": "lcc"
        },
        "countryCode": "SG",
        "contacts": "Changi Airport Post Office PO Box 89 Singapore, Singapore 918143<br>\r\nTelephone Number: +65 3157 6434<br>",
        "policies": "http://www.flyscoot.com/images/COC/scoot_conditions_of_carriage_final.pdf",
        "icaoCode": "SCO",
        "iataCode": "TR",
        "description": "Scoot have a two letter IATA code that is TR, and currently also promote the sales, services and operations of the newly merged Tigerair (Singapore) as if they were one and the same carrier. Both of which currently have their main hubs from T2 in Changi Airport Singapore.  ",
        "hubs": [
            {
                "code": "SIN",
                "name": "Singapore Changi Airport"
            }
        ],
        "fees": [],
        "videos": [],
        "news": [
            {
                "title": "CEO of Scoot: Bridging China and Singapore",
                "description": "Having managed both Scoot and Tigerair, Lee said the new, bigger Scoot plans to add more destinations in the long run. The average load ...",
                "source": "AsiaOne",
                "url": "http://www.asiaone.com/business/ceo-scoot-bridging-china-and-singapore",
                "thumbnail": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRh4PMkBL0kt5RabnKfe0MPfvVG6XIUoYw1lLpeV71EluG1RPWYHUtRuMmjDMO2n9m-Z7DgA07-",
                "publishedAt": "2017-08-26 16:00:00"
            }
        ],
        "images": [
            {
                "imageUrl": "https://res.cloudinary.com/wego/image/upload/v1508760935/flights/airlines_hero/TR_1.jpg"
            }
        ],
        "subsidiaries": []
    },
    ...
```

## List of Sprite Image

`GET /flights/v1/airlines/featured`

### Logic

1. Query on `Featured Airline Logo` table

### Parameters

| Property     | Required? | Data Type | Description                 |
| ------------ | --------- | --------- | --------------------------- |
| country_code | No        | String    | Required if no site code    |
| site_code    | No        | String    | Required if no country code |

### Example

`GET /flights/v1/airlines/featured?site_code=SG`

> Request

```http
GET /flights/v1/airlines/featured?site_code=SG
```

returns list of logo objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "code": "SQ",
        "name": "Singapore Airlines",
        "permalink": "singapore-airlines",
        "spriteImage": {
            "width": 40,
            "height": 40,
            "x": 0,
            "y": 504,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_40,q_auto,w_40/v1517373708/featured-airline-logo-SG.png"
        }
    },
    {
        "code": "AK",
        "name": "AirAsia",
        "permalink": "airasia",
        "spriteImage": {
            "width": 40,
            "height": 40,
            "x": 0,
            "y": 168,
            "imageUrl": "http://assets.wego.com/image/sprite/c_pad,f_auto,fl_lossy,h_40,q_auto,w_40/v1517373708/featured-airline-logo-SG.png"
        }
    },
    ...
```

## List of Airline Clicks

`GET /flights/v1/airlines/leaderboard`

### Logic

1. Query on `AirlineClick` table by its params and order it by its rank1.

### Parameters

| Property            | Required? | Data Type | Description                 |
| ------------------- | --------- | --------- | --------------------------- |
| departure_city_code | No        | String    | Required if routes_type not provided    |
| departure_country_code | No        | String    | Required when necessary   |
| arrival_city_code   | No        | String    | Required if routes_type not provided |
| arrival_country_code   | No        | String    | Required when necessary |
| routes_type         | No        | String    | Required if not performing city-to-city search |

### Example 1

`GET /flights/v1/airlines/leaderboard?departure_city_code=SIN&arrival_city_code=BKK`

> Request

```http
GET /flights/v1/airlines/leaderboard?departure_city_code=SIN&arrival_city_code=BKK
```

returns list of airline rank objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "airlineCode": "SL",
        "rank1": 1,
        "rank2": 2
    },
    {
        "airlineCode": "TR",
        "rank1": 2,
        "rank2": 1
    },
    {
        "airlineCode": "3K",
        "rank1": 3,
        "rank2": 3
    },
    ...
]
```

### Example 2

`GET /flights/v1/airlines/leaderboard?departure_city_code=SIN&arrival_country_code=ID&routesType=city_to_country`

> Request

```http
GET /flights/v1/airlines/leaderboard?departure_city_code=SIN&arrival_country_code=ID&routesType=city_to_country
```

returns list of airline rank objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "airlineCode": "CI",
        "rank1": 5,
        "rank2": 3,
        "name": "China Airlines",
        "permalink": "china-airlines"
    },
    {
        "airlineCode": "BI",
        "rank1": 6,
        "rank2": 6,
        "name": "Royal Brunei Airlines",
        "permalink": "royal-brunei-airlines"
    },
    {
        "airlineCode": "KL",
        "rank1": 6,
        "rank2": 8,
        "name": "KLM",
        "permalink": "klm"
    },
    {
        "airlineCode": "ID",
        "rank1": 7,
        "rank2": 8,
        "name": "Batik Air",
        "permalink": "batik-air"
    },
    {
        "airlineCode": "JQ",
        "rank1": 8,
        "rank2": 8,
        "name": "Jetstar Airways",
        "permalink": "jetstar-airways"
    }
]
```

## List Airline Images by Airline

`GET /flights/v1/airlines/:airline_id/airline_images`

### Example

`GET /flights/v1/airlines/950/airline_images`

> Request

```http
GET /flights/v1/airlines/950/airline_images
```

returns list of airline image objects, status 200 OK

> Response

```http
HTTP 200
```

```json
[
  {
    "id": 12,
    "airlineId": 950,
    "imageUrl":
      "https://res.cloudinary.com/wego/image/upload/v1508756606/flights/airlines_hero/EK_1.png"
  },
  {
    "id": 64,
    "airlineId": 950,
    "imageUrl":
      "https://res.cloudinary.com/wego/image/upload/v1506655503/flights/airlines_hero/EK_1.png"
  },
  {
    "id": 65,
    "airlineId": 950,
    "imageUrl":
      "https://res.cloudinary.com/wego/image/upload/v1506655538/flights/airlines_hero/EK_2.png"
  }
]
```

## Airline Image By Id

`GET /flights/v1/airlines/:airline_id/airline_images/:airline_images_id`

### Example

`GET /flights/v1/airlines/950/airline_images/12`

> Request

```http
GET /flights/v1/airlines/950/airline_images/12
```

returns requested airline image object, status 200 OK


> Response

```http
HTTP 200
```

```json
{
  "id": 12,
  "airlineId": 950,
  "imageUrl":
    "https://res.cloudinary.com/wego/image/upload/v1508756606/flights/airlines_hero/EK_1.png"
}
```

## Create Airline Image

`POST /flights/v1/airlines/:airline_id/airline_images`

### Parameters

| Property  | Required? | Data Type | Description |
| --------- | --------- | --------- | ----------- |
| image_url | Yes       | String    |             |

### Example

`POST flights/v1/airlines/950/airline_images`

> Request

```http
POST flights/v1/airlines/950/airline_images
```

```json
{
  "imageUrl":
    "https://res.cloudinary.com/wego/image/upload/v1508756606/flights/airlines_hero/EK_1.png"
}
```

returns request airline image object, status 201 Created

> Response

```http
HTTP 201
```

```json
{
  "id": 66,
  "airlineId": 950,
  "imageUrl":
    "https://res.cloudinary.com/wego/image/upload/v1508756606/flights/airlines_hero/EK_1.png"
}
```

## Delete Airline Image

`DELETE /flights/v1/airlines/:airline_id/airline_images/:airline_image_id`

### Example

`DELETE /flights/v1/airlines/950/airline_images/66`

> Request

```http
DELETE /flights/v1/airlines/950/airline_images/66
```

returns empty body, status 200 OK

> Response

```http
HTTP 200
```
