# Wego Flights Services API

**<span style="color:	#7cb9e8"> [Routes](/flights/services/routes.md) </span>** <br />
Get popular, trend routes or multistop routes by airline or departure code.
API documentation for create, update, delete of routes.

**<span style="color:	#7cb9e8	">[Flights](/flights/services/flights.md)</span>**<br />
Get flights schedules by departure or arrival city/country codes.

**<span style="color:	#7cb9e8	">[Logos](/flights/services/logos.md)</span>**<br />
Get logos by logo type, site code, departure and arrival city codes.

**<span style="color:	#7cb9e8	">[Payment Methods](/flights/services/payment_methods.md)</span>** <br />
Get, update and delete from `payment_method` and `available_payment_method` tables. Shows which country accepts which payment method and what is popular there.

**<span style="color:	#7cb9e8	">[Payment Fees](/flights/services/payment_fees.md)</span>**<br />
To be use in calculating the fares based on the payment method by provider_code, site_code, currency_code.

**<span style="color:	#7cb9e8	">[Aircrafts](/flights/services/aircrafts.md)</span>**<br />
Get, create, update, delete aircrafts.

**<span style="color:	#7cb9e8	">[Airlines](/flights/services/airlines.md)</span>**<br />
Get, create, update, delete airlines.

**<span style="color:	#7cb9e8	">[Providers](/flights/services/providers.md)</span>**<br />
Get, create, update and delete from `provider`, `provider_supports` and `provider_terms_conditions` tables. Shows top clicked providers based on the given departure/arrival city code and the information of the featured providers.

**<span style="color:	#7cb9e8	">[Provider Profiles](/flights/services/provider_profiles.md)</span>**<br />
Create, update and delete from `provider_profiles` tables. `Provider_profiles_contacts` and `provider_profiles_links` tables will be updated as well.

**<span style="color:	#7cb9e8	">[Provider Badges](/flights/services/provider_badges.md)</span>**<br/>
Create, update and delete from `provider_badges`table.

**<span style="color:	#7cb9e8	">[Provider Scripts](/flights/services/provider_scripts.md)</span>**<br/>
Get flights provider scripts by provider_code, site_code and locale.

**<span style="color:	#7cb9e8	">[Provider Routes](/flights/services/provider_routes.md)</span>**<br/>
Create, update and delete from `provider_routes`table.

**<span style="color:	#7cb9e8	">[Settings](/flights/services/settings.md)</span>**<br />
This is calculate experience score and show info on flight detail page in meta search.

**<span style="color:#7cb9e8	">[Fares](/flights/services/fares.md)</span>**<br />
Weekend Fares Api and Flexible Fares

**<span style="color:#7cb9e8	">[Pages](/flights/services/pages.md)</span>**<br />
API for static and seo pages.

**<span style="color:#7cb9e8	">[Price Prediction](/flights/services/price_predictions.md)</span>**<br />
API for price prediction.

**<span style="color:#7cb9e8	">[Summary](/flights/services/summary.md)</span>**<br />
Flight schedule summary for city to city.

# Aircrafts Api

| Type  | Endpoint                                        | Description     |
| ----- | ----------------------------------------------- | --------------- |
| GET   | [/flights/v1/aircrafts](#list-aircrafts)        | List Aircrafts  |
| POST  | [/flights/v1/aircrafts](#create-aircrafts )     | Create Aircraft |
| PATCH | [/flights/v1/aircrafts/:id](#update-aircrafts ) | Update Aircraft |
| DEL   | [/flights/v1/aircrafts/:id](#delete-aircrafts ) | Delete Aircraft |

## List Aircrafts

`GET flights/v1/aircrafts`

### Parameters

| Property      | Required? | Data Type | Description                             |
| ------------- | --------- | --------- | --------------------------------------- |
| codes         | no        | Array     | aircraft code                           |
| key_transform | no        | String    | accept underscore. default is camelCase |

### Example

`GET flights/v1/aircrafts?codes[]=ANF`

> Request

```http
GET /flights/v1/aircrafts?codes[]=ANF
```

returns object, status 200 OK

> Response

```http
HTTP 200
```

```json
[
    {
        "id": 9,
        "code": "ANF",
        "name": "Antonov An-12",
        "planeType": "turboprop",
        "bodyType": "narrow_body",
        "starRating": 2
    }
]
```

## Create Aircrafts

`POST flights/v1/aircrafts`

### Parameters

| Property    | Required? | Data Type | Description                                                             |
| ----------- | --------- | --------- | ----------------------------------------------------------------------- |
| code        | Yes       | String    |                                                                         |
| name        | Yes       | String    |                                                                         |
| body_type   | Yes       | String    | Accepts: boat, bus, limousine, narrow_body, train, wide_body            |  |
| plane_type  | Yes       | String    | Accepts: amphibious, ground_service, helipcoter, jet, piston, turboprop |  |
| star_rating | No        | Float     |                                                                         |  |

### Example

`GET /flights/v1/aircrafts`

> Request

```http
GET /flights/v1/aircrafts
```

```json
{
    "code": "abc",
    "body_type": "narrow_body",
    "plane_type": "helicopter",
    "star_rating": 4.0,
    "translations_attributes": [
          {
            "locale": "en",
            "name": "12f"
          }
     ]
}
```

returns object created, status 201 created

> Response

```http
HTTP 200
```

```json
{
    "id": 2056,
    "code": "abc",
    "name": "12f",
    "planeType": "helicopter",
    "bodyType": "narrow_body",
    "starRating": 4
}
```

## Update Aircrafts

`PATCH flights/v1/aircrafts/:id`

### Parameters

| Property    | Required? | Data Type | Description                                                             |
| ----------- | --------- | --------- | ----------------------------------------------------------------------- |
| code        | No        | String    |                                                                         |
| name        | No        | String    |                                                                         |
| body_type   | No        | String    | Accepts: boat, bus, limousine, narrow_body, train, wide_body            |  |
| plane_type  | No        | String    | Accepts: amphibious, ground_service, helipcoter, jet, piston, turboprop |  |
| star_rating | No        | Float     |                                                                         |  |

### Example

`PATCH /flights/v1/aircrafts`

> Request

```http
PATCH /flights/v1/aircrafts
```

```json
{
    "body_type": "wide_body",
    "translations_attributes": [
        {
            "locale": "ar",
            "name": "arab"
          },
          {
            "locale": "en",
            "name": "change en"
         }
     ]
}
```

returns object updated, status 200 OK

> Response

```http
HTTP 200
```

```json
{
    "id": 2056,
    "code": "abc",
    "name": "change en",
    "planeType": "helicopter",
    "bodyType": "wide_body",
    "starRating": 4
}
```

## Delete Aircrafts

`DELETE flights/v1/aircrafts/:id`

### Example

`DELETE /flights/aircrafts/2056`

> Request

```http
DELETE /flights/aircrafts/2056
```

returns status 200 OK

> Response

```http
HTTP 200
```

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

# Fares

Please follow [this document](https://github.com/wego/wego-docs/wiki/Flights:-Fares) to understand Flexs concepts and usages

## Fares Api

| Type | Endpoint                                                    | Description        |
| ---- | ----------------------------------------------------------- | ------------------ |
| GET  | [/flights/v1/fares/aggs/routes-dates](#get-weekend-routes ) | Get weekend routes |
| GET  | [/flights/v1/fares](#flex-fares )                           | Flexible Fares     |

## Get Weekend Routes

`GET /flights/v1/fares/aggs/routes-dates`

### Logic

1. if departure_city_code or departure_city_name exist, gets popular destination which will be the arrival codes
2. site code is gotten either passed in by the ip or latitude, longitude. It then query the `search` api.
3. it will return the popular search fares.

### Parameters

| Property            | Required? | Data Type | Description        |
| ------------------- | --------- | --------- | ------------------ |
| departure_city_code | No        | String    |                    |
| dates_limit         | No        | String    |                    |
| trip_purpose        | No        | String    |                    |
| source              | No        | String    |                    |
| limit               | No        | String    |                    |
| locale              | No        | String    |                    |
| latitude            | No        | String    |                    |
| longitude           | No        | String    |                    |
| site_code           | No        | String    |                    |
| currency_code       | No        | String    |                    |
| ip                  | No        | String    | ip address of user |
| departure_city_name | No        | String    |                    |

### Example Request Body without params. It will take lat long based on browser

`GET /flights/v1/fares/aggs/routes-dates`

> Request

```http
GET /flights/v1/fares/aggs/routes-dates
```

returns route dates object, status 200 OK

> Response

```http
HTTP 200
```

```json
{  
   "site_code":"SG",
   "locale":"en",
   "routes":[  
      {  
         "departure_city_code":"SIN",
         "departure_city_name":"Singapore",
         "departure_country_name":"Singapore",
         "arrival_city_code":"DPS",
         "arrival_city_name":"Bali",
         "arrival_country_name":"Indonesia",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"224.47",
                  "amount_usd":168.11,
                  "currency_code":"SGD"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/DPS.jpg"
      },
      {  
         "departure_city_code":"SIN",
         "departure_city_name":"Singapore",
         "departure_country_name":"Singapore",
         "arrival_city_code":"BKK",
         "arrival_city_name":"Bangkok",
         "arrival_country_name":"Thailand",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"142.58",
                  "amount_usd":106.78,
                  "currency_code":"SGD"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/BKK.jpg"
      },
      ...
   ]
}
```

### Example Request Body with params.

`GET flights/v1/fares/aggs/routes-dates?departure_city_code=BKK`

> Request

```http
GET flights/v1/fares/aggs/routes-dates?departure_city_code=BKK
```

returns route dates object, status 200 OK

> Response

```http
HTTP 200
```

``` json
{  
   "site_code":"SG",
   "locale":"en",
   "routes":[  
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"HKG",
         "arrival_city_name":"Hong Kong",
         "arrival_country_name":"China",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"6293.64",
                  "amount_usd":196.87,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/HKG.jpg"
      },
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"CNX",
         "arrival_city_name":"Chiang Mai",
         "arrival_country_name":"Thailand",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"1158.22",
                  "amount_usd":36.230000000000004,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/CNX.jpg"
      },
      {  
         "departure_city_code":"BKK",
         "departure_city_name":"Bangkok",
         "departure_country_name":"Thailand",
         "arrival_city_code":"SIN",
         "arrival_city_name":"Singapore",
         "arrival_country_name":"Singapore",
         "dates":[  
            {  
               "departure_date":"2018-06-08",
               "arrival_date":"2018-06-10",
               "fare":{  
                  "price":"3466.66",
                  "amount_usd":108.44,
                  "currency_code":"THB"
               }
            }
         ],
         "arrival_city_image":"https://res.cloudinary.com/wego/w_360,h_200,c_fill,f_auto,fl_lossy,q_80/destinations/cities/SIN.jpg"
      }
   ]
}
```

## Flex Fares

`GET /flights/v1/fares`

*Flexs APIs implicit 2 default parameters: `fare_age_friction=1` and `max_fare_age=60`. The 2 parameters are used to detemine if data is not outdated by this formula:*

```ruby
fare_age = today - fare.departure_date
lead_time = fare.departure - today
is_valid_fare = fare_age <= lead_time * fare_age_friction & fare_age <= max_fare_age
```

## Purpose

Everyday our metasearch backend system imports millions and millions flight fares from different providers to serve the searches coming from users. While this amount of data is huge and accumulated day by day, there has always been a need to get a semantic insight into it. For example, if you are into budget travelling, you must have wandered, between two given cities, which airline to choose, or which day of the week to go, or even what period of time in a day to depart to get the most attractive price. Or you want to travel but not sure yet where to go and want to compare fare prices to different destinations from where you are. The information from our daily fares might answer all these questions.

As its name suggested, flexible fares API is meant to query our metasearch fares (downloaded from BQ and cached on Elasticsearch), flexibly aggregate them accordingly to different contexts. It can accept query params (either by exact match, by range match or even by excluding) to filter fares and allow grouping by different attributes to aggregate them before returning. Following is the list of query params that can be past in to filter fares.

## Parameters

**Note:** The API support passing params in both type of camelCase and snake_key, meaining passing `airline_code=SG` would be the same as passing `airlineCode=SG`. However, same is not applied for params values, they should always be in snake_key. For example, `groupBy=airline_code` will work but `groupBy=airlineCode` will not.

### Params for exact filters

| No  | Property               | Required | Type            | Description                             |
| --- | ---------------------- | -------- | --------------- | --------------------------------------- |
| 1   | departure_date         | No       | String          | Date of deparure (format: YYYY-MM-DD)   |
| 2   | return_date            | No       | String          | Date of return (format: YYYY-MM-DD)     |
| 3   | departure_airport_code | No       | Array of String | Departure Airport Code                  |
| 4   | arrival_airport_code   | No       | Array of String | Arrival Airport Code                    |
| 5   | departure_city_code    | No       | Array of String | Departure City Code                     |
| 6   | arrival_city_code      | No       | Array of String | Arrival City Code                       |
| 7   | departure_country_code | No       | Array of String | Departure Country Code                  |
| 8   | arrival_country_code   | No       | Array of String | Arrival Country Code                    |
| 9   | departure_continent*   | No       | Array of String | Departure continent                     |
| 10  | arrival_continent*     | No       | Array of String | Arrival Continent                       |
| 11  | departure_city_theme** | No       | Array of String | Departure city theme                    |
| 12  | arrival_city_theme**   | No       | Array of String | Arrival city theme                      |
| 13  | airline_code           | No       | Array of String | Markerting Airline Code                 |
| 14  | airline_alliance***    | No       | Array of String | Allience of Markerting Airline Code     |
| 15  | airline_codes          | No       | Array of String | List of Operating Airline Codes         |
| 16  | adults_count           | No       | Integer         | Number of Adults                        |
| 17  | children_count         | No       | Integer         | Number of Children                      |
| 18  | infants_count          | No       | Integer         | Number of Infants                       |
| 19  | cabin_class            | No       | Array of String | Cabin Class                             |
| 20  | stops_count            | No       | Array of Integer| Number of Stops                         |
| 21  | price_usd              | No       | Float           | Price in USD                            |
| 22  | trip_duration          | No       | Integer         | Number of Days of The Whole Trip        |
| 23  | flight_duration        | No       | Float           | Number of Minutes of the Whole flight   |
| 24  | trip_type              | No       | Array of String | oneway or roundtrip                     |
| 25  | departure_day_of_week  | No       | Array of String | Day of departure data (Monday...Sunday) |
| 26  | site_code              | No       | String          | site_code in which fares are found      |
| 27  | fare_age_friction      | No       | Float           | Default as 1.0                          |
| 28  | max_fare_age           | No       | Float           | Default as 60                           |

*Possible continents: africa, asia, australia-and-pacific, europe, north-america, south-america, islands-of-the-southern-ocean, antarctica, middle-east

**Possible themes: active, adventure, beach, budget, culture, entertainment, family, food, lgbt-friendly, luxury, nature, relaxation, romantic, senior, shopping, street-markets, historical

***Possible airline alliances: star_alliance, sky_team, oneworld, icc

### Params for range filters

| No  | Property            | Required | Type    | Description                                             |
| --- | ------------------- | -------- | ------- | ------------------------------------------------------- |
| 1   | departure_date_from | No       | String  | Deparure after this date                                |
| 2   | departure_date_to   | No       | String  | Deparure after before this date                         |
| 3   | created_at_from     | No       | String  | Fare created after this date                            |
| 4   | created_at_to       | No       | String  | Fare created before this date                           |
| 5   | price_usd_min       | No       | Float   | Price in USD greater than or equal to this price        |
| 6   | price_usd_max       | No       | Float   | Price in USD less than or equal to this price           |
| 7   | trip_duration_min   | No       | Integer | Travel more than this number of days                    |
| 8   | trip_duration_max   | No       | Integer | Travel less than this number of days                    |
| 9   | flight_duration_min | No       | Float   | Total flight time more than this number of hours        |
| 10  | flight_duration_max | No       | Float   | Total flight time less than this number of hours        |
| 11  | departure_time_min  | No       | String  | Departure after this point of time (format: '17:00:00') |
| 12  | departure_time_max  | No       | String  | Departure before this point of time                     |
| 13  | arrival_time_min    | No       | String  | Arrival after this point of time                        |
| 14  | arrival_time_max    | No       | String  | Arrival before this point of time                       |

### Params for exclude filters

| No  | Property                 | Required | Type            | Description                                                 |
| --- | ------------------------ | -------- | --------------- | ----------------------------------------------------------- |
| 1   | exclude_airline_code     | No       | Array of String | Exclude fares from these certain airlines                   |
| 2   | exclude_airline_alliance | No       | Array of String | Exclude fares from airlines that belongs to these alliences |

### Configuration params

| No  | Property      | Required | Type            | Description                                            | Default         |
| --- | ------------- | -------- | --------------- | ------------------------------------------------------ | --------------- |
| 1   | group_by      | No       | Array of String | Group fares based on these params                      |                 |
| 2   | agg_on        | No       | String          | Pick out the one fare with min/max value on this field | price_usd       |
| 3   | agg_metric    | No       | min/max         | To pick out min or max value of the agg_on field       | min             |
| 4   | sort_by       | No       | Boolean         | Sort final fares based on this attributes              | Number of fares |
| 5   | order         | No       | desc/asc        | Order for the sort made from sort_by                   | asc             |
| 6   | per_page      | No       | Integer         | Number of fares to be returned in the response         | 10              |
| 7   | currency_code | No       | String          | To be past to get price in the a given currency code   |                 |  |
| 8   | locale        | No       | String          | Language applied to the response                       | en              |
| 9   | language      | No       | String          | Language applied to the response                       | en              |
| 10  | key_transform | No       | String          | Response keys to be in underscore or camelCase form    | camelCase       |

## List of some typical aggregations

| No  | Usecase description                                               | Description                                                 |
| --- | ----------------------------------------------------------------- | ----------------------------------------------------------- |
| 1   | [No aggregation](#no-aggregation)                                 | Just return filtered fares without any aggregations         |
| 2   | [Aggregated by destinations](#aggregated-by-destinations)         | Filter fares and aggregated by departure and arrival cities |
| 3   | [Aggregated by departure cities](#aggregated-by-departure-cities) | Filter fares and aggregated by departure cities             |
| 4   | [Aggregated by airlines](#aggregated-by-airlines)                 | Filter fares and aggregated by airlines                     |
| 5   | [Aggregated by months](#aggregated-by-months)                     | Filter fares and aggregated by months (not months of year)  |
| 6   | [Aggregated by days of week](#aggregated-by-days-of-week)         | Filter fares and aggregated by days of week (Mon-Sun)       |
| 7   | [Aggregated by hours of day](#aggregated-by-days-of-week)         | Filter fares and aggregated by hours of day (0 - 23)        |

### No aggregation

Return a list of filtered fares without any aggregations. By default, fares are sorted by price in ascending order.

### Example

`GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currencyCode=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25`

> Request

```http
GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currencyCode=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25
```

return three cheapest fares from Hanoi to Singapore with departure date from 2018-05-20 to 2018-05-25.

> Response

```http
HTTP 200
```

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 136,
    "price": "3096212.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 143.21947,
    "price": "3260585.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 0,
    "airlineCode": "MI",
    "airlineName": "SilkAir",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 202.76624,
    "price": "4616316.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "18"
  }
]
```

To get fares in the descending order, just need to set `order` param to `desc`:

`GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currency_code=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25&order=desc`

> Request

```http
GET /flights/fares?departureCityCode[]=HAN&arrivalCityCode[]=SIN&perPage=3&currency_code=VND&departureDateFrom=2018-05-20&departureDateTo=2018-05-25&order=desc
```

return three most expensive fares from Hanoi to Singapore with departure date from 2018-05-20 to 2018-05-25

> Response

```http
HTTP 200
```

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-21",
    "returnDate": "2018-05-24",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1867,
    "price": "42504617.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 1,
    "airlineCode": "OZ",
    "airlineName": "Asiana Airlines",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1556.4697,
    "price": "35435009.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "23"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SIN",
    "arrivalCityName": "Singapore",
    "arrivalCityLat": 1.35208,
    "arrivalCityLong": 103.82,
    "arrivalCountryCode": "SG",
    "arrivalCountryName": "Singapore",
    "departureDate": "2018-05-25",
    "returnDate": "2018-06-24",
    "stopsCount": 1,
    "airlineCode": "JL",
    "airlineName": "Japan Airlines",
    "createdAt": "2018-03-04",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1432.9524,
    "price": "32622920.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "00"
  }
]
```

### Aggregated by destinations

Return a list of filtered fares aggregated by departure and arrival cities. By default it:

- picks the min price fare of all pairs of departure and arrival city and
- sorts all those min fare in descending order based on popularity (number of fares) between a pair of destinations

**Query:** *Return minimum price fares for three most popular destinations departing from Hanoi*

`GET /flights/fares?groupBy[]=departure_city_code&groupBy[]=arrival_city_code&departureCityCode[]=HAN&currencyCode=VND&perPage=3`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "BKK",
    "arrivalCityName": "Bangkok",
    "arrivalCityLat": 13.7563,
    "arrivalCityLong": 100.502,
    "arrivalCountryCode": "TH",
    "arrivalCountryName": "Thailand",
    "departureDate": "2018-09-20",
    "stopsCount": 0,
    "airlineCode": "FD",
    "airlineName": "Thai AirAsia",
    "createdAt": "2018-03-06",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 38.463352,
    "price": "875591.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  }
]
```

The default behaviors can be changed by:

- setting `metric` to `max` so that maximum (not minimum) fare between a given pair of destinations is picked
- setting `sortBy` to `price` so that fares are sorted by price for all pairs of departure and arrival cities, not by counts anymore. For when sorting is by price, order can be specified by setting `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three minimum price fares which departure city is Hanoi*

`GET /flights/fares?groupBy[]=arrival_city_code&departureCityCode[]=HAN&currencyCode=VND&perPage=3&sortBy=price`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "NHA",
    "arrivalCityName": "Nha Trang",
    "arrivalCityLat": 12.2388,
    "arrivalCityLong": 109.197,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-14",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 30.215538,
    "price": "687997.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  }
]
```

___

### Aggregated by departure cities

Return a list of filtered fares aggregated by departure cities. By default it:

- picks the min price fare for all departure cities and
- sorts all those min fare in descending order based on the number of fares for a departure city

**Query:** *Return min fares for three most popular departure cities in Vietnam*

`GET /flights/fares?groupBy[]=departure_city_code&departureCountryCode[]=VN&perPage=3&currencyCode=VND`

```json
[
  {
    "departureCityCode": "SGN",
    "departureCityName": "Ho Chi Minh City",
    "departureCityLat": 10.8231,
    "departureCityLong": 106.63,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-21",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 11.076746,
    "price": "252250.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-28",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.999744,
    "price": "364260.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "DAD",
    "departureCityName": "Da Nang",
    "departureCityLat": 16.0544,
    "departureCityLong": 108.202,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-10",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.720513,
    "price": "357886.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "22"
  }
]
```

The default behaviors can be changed by:

- setting `metric` to max so that maximum (not minimum) fare of a departure city is picked
- setting `sortBy` to `price` so that fares are sorted by price for all departure cities, not by counts. For when sorting is by price, order can be specified by set `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three minimum fares for departure cities in Vietnam*

`GET /flights/fares?groupBy[]=departure_city_code&departureCountryCode[]=VN&perPage=3&currency_code=VND&sortBy=price`

```json
[
  {
    "departureCityCode": "SGN",
    "departureCityName": "Ho Chi Minh City",
    "departureCityLat": 10.8231,
    "departureCityLong": 106.63,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "DAD",
    "arrivalCityName": "Da Nang",
    "arrivalCityLat": 16.0544,
    "arrivalCityLong": 108.202,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-21",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 11.076746,
    "price": "252250.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "NHA",
    "departureCityName": "Nha Trang",
    "departureCityLat": 12.2388,
    "departureCityLong": 109.197,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-14",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 12.3230715,
    "price": "280480.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "23"
  },
  {
    "departureCityCode": "DLI",
    "departureCityName": "Dalat",
    "departureCityLat": 11.9404,
    "departureCityLong": 108.458,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-29",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-05",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 15.703173,
    "price": "357430.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "23"
  }
]
```

___

### Aggregated by airlines

Return a list of filtered fares aggregated by airlines. By default it:

- picks the min price fare for all airlines and
- sorts all those min fares in descending order based on the number of fares for each airline

**Query:** *Return min fares for three most popular airlines between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=airline_code&departureCityCode[]=HAN&arrivalCityCode[]=SGN&perPage=3&currencyCode=VND`

```json
[
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-03-31",
      "stopsCount": 0,
      "airlineCode": "VN",
      "airlineName": "Vietnam Airlines",
      "createdAt": "2018-03-08",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 57.38771,
      "price": "1306556.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Saturday",
      "departureHourOfDay": "06"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-09-11",
      "stopsCount": 0,
      "airlineCode": "VJ",
      "airlineName": "VietJet Air",
      "createdAt": "2018-03-11",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 31.999605,
      "price": "728520.0",
      "departureMonth": "2018-09",
      "departureDayOfWeek": "Tuesday",
      "departureHourOfDay": "07"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "departureCountryCode": "VN",
      "departureCountryName": "Vietnam",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "arrivalCountryCode": "VN",
      "arrivalCountryName": "Vietnam",
      "departureDate": "2018-05-16",
      "stopsCount": 0,
      "airlineCode": "BL",
      "airlineName": "Jetstar Pacific Airlines",
      "createdAt": "2018-03-01",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 41.148087,
      "price": "936832.0",
      "departureMonth": "2018-05",
      "departureDayOfWeek": "Wednesday",
      "departureHourOfDay": "15"
  }
]

```

The default behaviors can be changed by:

- setting `metric` to max so that maximum (not minimum) fare of an airline is picked
- setting `sortBy` to `price` so that fares are sorted by price for all airlines, not by counts. For when sorting is by price, order can be specified by set `order` params to `asc` or `desc` (it is `asc` by default)

**Query:** *Return three airlines with cheapest fare between Hanoi and Ho Chi Minh city*

`GET /flights/fares?group_by[]=airline_code&departureCityCode[]=HAN&arrivalCityCode[]=SGN&perPage=3&currency_code=VND&sortBy=price`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-09-11",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 31.999605,
    "price": "728520.0",
    "departureMonth": "2018-09",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-05-16",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-01",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 41.148087,
    "price": "936832.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "departureCountryCode": "VN",
    "departureCountryName": "Vietnam",
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "arrivalCountryCode": "VN",
    "arrivalCountryName": "Vietnam",
    "departureDate": "2018-03-31",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-08",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 57.38771,
    "price": "1306556.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "06"
  }
]

```

___

### Aggregated by months

Return a list of filtered fares aggregated by months. Note that this is all the available months, not months of a year, so it will display something like `12-2017`, `01-2018` and all the way to `12-2018` (if available), not `January`, `February` or so. By default it picks the min price fare for a month.

**Query:** *Return min fare by months between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 97.33583,
    "price": "2216068.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 68.082695,
    "price": "1549927.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-06-18",
    "returnDate": "2018-06-23",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 364,
    "price": "8286921.0",
    "departureMonth": "2018-06",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "15"
  }
]
```

The `metric` param can be set to `max` to return maximum price of a month.

**Query:** *Return maximum fare by months between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24&priceMetric=max`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2261.2888,
    "price": "51481128.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 1,
    "airlineCode": "SQ",
    "airlineName": "Singapore Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2634.643,
    "price": "59980913.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "TG",
    "airlineName": "Thai Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 310,
    "price": "7057542.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1346.8707,
    "price": "30663200.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-06-18",
    "returnDate": "2018-06-23",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1257.1665,
    "price": "28621066.0",
    "departureMonth": "2018-06",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  }
]
```

___

### Aggregated by days of week

Return a list of filtered fares aggregated by day of week (Mon, Tue...Sun). By default, it picks the min price fare for a day.

**Query:** *Return min fare by days of week between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_day_of_week&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 85.08738,
    "price": "1937182.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 107.0756,
    "price": "2437812.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-16",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 64,
    "price": "1457041.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 83.69128,
    "price": "1905309.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-24",
    "returnDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 94.30112,
    "price": "2146859.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Thursday",
    "departureHourOfDay": "05"
  }
]
```

The `metric` param can be set to `max` to return maximum price of a day.

**Query:** *Return maximum fare by by days of week between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_day_of_week&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND&priceMetric=max`

```json
[
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-24",
      "returnDate": "2018-03-26",
      "stopsCount": 1,
      "airlineCode": "TG",
      "airlineName": "Thai Airways",
      "createdAt": "2018-03-12",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 1400.8282,
      "price": "31891667.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Saturday",
      "departureHourOfDay": "10"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-04-09",
      "returnDate": "2018-04-13",
      "stopsCount": 1,
      "airlineCode": "CX",
      "airlineName": "Cathay Pacific",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2245.941,
      "price": "51131666.0",
      "departureMonth": "2018-04",
      "departureDayOfWeek": "Monday",
      "departureHourOfDay": "10"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-10-10",
      "returnDate": "2018-10-17",
      "stopsCount": 1,
      "airlineCode": "BR",
      "airlineName": "EVA Air",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 1346.8707,
      "price": "30663200.0",
      "departureMonth": "2018-10",
      "departureDayOfWeek": "Wednesday",
      "departureHourOfDay": "12"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-04-06",
      "returnDate": "2018-04-08",
      "stopsCount": 1,
      "airlineCode": "SQ",
      "airlineName": "Singapore Airlines",
      "createdAt": "2018-03-12",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2634.643,
      "price": "59980913.0",
      "departureMonth": "2018-04",
      "departureDayOfWeek": "Friday",
      "departureHourOfDay": "18"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-20",
      "stopsCount": 1,
      "airlineCode": "HX",
      "airlineName": "Hong Kong Airlines",
      "createdAt": "2018-03-12",
      "tripType": "oneway",
      "cabinClass": "economy",
      "priceUsd": 1192,
      "price": "27137388.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Tuesday",
      "departureHourOfDay": "16"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-03-25",
      "returnDate": "2018-03-30",
      "stopsCount": 1,
      "airlineCode": "CX",
      "airlineName": "Cathay Pacific",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 2261.2888,
      "price": "51481128.0",
      "departureMonth": "2018-03",
      "departureDayOfWeek": "Sunday",
      "departureHourOfDay": "19"
  },
  {
      "departureCityCode": "HAN",
      "departureCityName": "Hanoi",
      "departureCityLat": 21.0278,
      "departureCityLong": 105.834,
      "arrivalCityCode": "SGN",
      "arrivalCityName": "Ho Chi Minh City",
      "arrivalCityLat": 10.8231,
      "arrivalCityLong": 106.63,
      "departureDate": "2018-05-24",
      "returnDate": "2018-05-30",
      "stopsCount": 0,
      "airlineCode": "VJ",
      "airlineName": "VietJet Air",
      "createdAt": "2018-03-11",
      "tripType": "roundtrip",
      "cabinClass": "economy",
      "priceUsd": 94.30112,
      "price": "2146859.0",
      "departureMonth": "2018-05",
      "departureDayOfWeek": "Thursday",
      "departureHourOfDay": "05"
  }
]


```

___

### Aggregated by hours of day

Return a list of filtered fares aggregated by hour intervals of day (0..23). By default, it picks the min price fare for a hour interval.

**Query:** *Return min fare by hours of day between Hanoi and Ho Chi Minh city*

`GET /flights/fares?group_by[]=departure_hour_of_day&departureCityCode[]=HAN&arrivalCityCode[]=SGN&currencyCode=VND&perPage=24`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-19",
    "stopsCount": 2,
    "airlineCode": "QV",
    "airlineName": "Lao Airlines",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 703.4149,
    "price": "16014019.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 97.33583,
    "price": "2216068.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-16",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 64,
    "price": "1457041.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-17",
    "returnDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 101.06547,
    "price": "2300986.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "06"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 68.082695,
    "price": "1549927.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-28",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 268,
    "price": "6101359.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "08"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "MH",
    "airlineName": "Malaysia Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 180.19115,
    "price": "4102253.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "13"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-21",
    "returnDate": "2018-04-23",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 125,
    "price": "2845783.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 51.664753,
    "price": "1176105.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 56.773167,
    "price": "1292441.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-21",
    "returnDate": "2018-04-22",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 107.0756,
    "price": "2437812.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-13",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 294.63132,
    "price": "6707625.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 579.9688,
    "price": "13203751.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "11"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 1,
    "airlineCode": "HX",
    "airlineName": "Hong Kong Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 1192,
    "price": "27137388.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "16"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-27",
    "returnDate": "2018-05-01",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 135,
    "price": "3073446.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "22"
  }
]
```

The `metric` param can be set to `max` to return maximum price of an hour.

**Query:** *Return maximum fare by hours of day between Hanoi and Ho Chi Minh city*

`GET /flights/fares?groupBy[]=departure_month&departureCityCode[]=HAN&arrivalCityCode[]=SGN&priceMetric=min&currencyCode=VND&perPage=24&priceMetric=max`

```json
[
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-10-10",
    "returnDate": "2018-10-17",
    "stopsCount": 1,
    "airlineCode": "BR",
    "airlineName": "EVA Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 1346.8707,
    "price": "30663200.0",
    "departureMonth": "2018-10",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "12"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-09",
    "returnDate": "2018-04-13",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2245.941,
    "price": "51131666.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "10"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-06",
    "returnDate": "2018-04-08",
    "stopsCount": 1,
    "airlineCode": "SQ",
    "airlineName": "Singapore Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2634.643,
    "price": "59980913.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "18"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-17",
    "returnDate": "2018-03-18",
    "stopsCount": 0,
    "airlineCode": "BL",
    "airlineName": "Jetstar Pacific Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 113.23689,
    "price": "2578052.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "05"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-23",
    "returnDate": "2018-03-26",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "06"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 85.08738,
    "price": "1937182.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "07"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-27",
    "stopsCount": 1,
    "airlineCode": "CI",
    "airlineName": "China Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 427,
    "price": "9721195.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "08"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 0,
    "airlineCode": "H1",
    "airlineName": "Hahn Air Systems",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 276,
    "price": "6283489.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "13"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-12",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 598,
    "price": "13614227.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "15"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-25",
    "returnDate": "2018-03-30",
    "stopsCount": 1,
    "airlineCode": "CX",
    "airlineName": "Cathay Pacific",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 2261.2888,
    "price": "51481128.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Sunday",
    "departureHourOfDay": "19"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 72.710106,
    "price": "1655335.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "17"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-05-30",
    "stopsCount": 1,
    "airlineCode": "TG",
    "airlineName": "Thai Airways",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 310,
    "price": "7057542.0",
    "departureMonth": "2018-05",
    "departureDayOfWeek": "Wednesday",
    "departureHourOfDay": "20"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-12",
    "stopsCount": 0,
    "airlineCode": "VN",
    "airlineName": "Vietnam Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 121.24709,
    "price": "2760410.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Monday",
    "departureHourOfDay": "21"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-13",
    "stopsCount": 1,
    "airlineCode": "PG",
    "airlineName": "Bangkok Airways",
    "createdAt": "2018-03-11",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 294.63132,
    "price": "6707625.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "09"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-24",
    "returnDate": "2018-03-26",
    "stopsCount": 1,
    "airlineCode": "CZ",
    "airlineName": "China Southern Airlines",
    "createdAt": "2018-03-12",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 579.9688,
    "price": "13203751.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Saturday",
    "departureHourOfDay": "11"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-03-20",
    "stopsCount": 1,
    "airlineCode": "HX",
    "airlineName": "Hong Kong Airlines",
    "createdAt": "2018-03-12",
    "tripType": "oneway",
    "cabinClass": "economy",
    "priceUsd": 1192,
    "price": "27137388.0",
    "departureMonth": "2018-03",
    "departureDayOfWeek": "Tuesday",
    "departureHourOfDay": "16"
  },
  {
    "departureCityCode": "HAN",
    "departureCityName": "Hanoi",
    "departureCityLat": 21.0278,
    "departureCityLong": 105.834,
    "arrivalCityCode": "SGN",
    "arrivalCityName": "Ho Chi Minh City",
    "arrivalCityLat": 10.8231,
    "arrivalCityLong": 106.63,
    "departureDate": "2018-04-27",
    "returnDate": "2018-05-01",
    "stopsCount": 0,
    "airlineCode": "VJ",
    "airlineName": "VietJet Air",
    "createdAt": "2018-03-11",
    "tripType": "roundtrip",
    "cabinClass": "economy",
    "priceUsd": 135,
    "price": "3073446.0",
    "departureMonth": "2018-04",
    "departureDayOfWeek": "Friday",
    "departureHourOfDay": "22"
  }
]

```

___

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

# Logos Api

| Type | Endpoint                     | Description                                                                |
| ---- | ---------------------------- | -------------------------------------------------------------------------- |
| GET  | [/flights/logos](#get_logos) | Get logos based on logo_type, site_code, departure and arrival city codes. |

## Get Logos

Returns logos based on given logo_type, site_code, departure and arrival city codes.

`GET flights/logos`

### Logic

1. Check for `logo_type` parameter

    * If `logo_type` is either `provider`, `airline` or `loading_page`, then render corresponding logos.
    * Else, An empty array will be rendered.

### Parameters

| Property          | Required?                              | Data Type | Description                                                               |
| ----------------- | -------------------------------------- | --------- | ------------------------------------------------------------------------- |
| logoType          | Yes                                     | String    | Types of Logos. The 3 types are `provider`, `airline`, and `loading_page` |
| departureCityCode | No (Yes if `logo_type = loading_page`) | String    | 3-letter IATA code of departure city                                      |
| arrivalCityCode   | No (Yes if `logo_type = loading_page`) | String    | 3-letter IATA code of arrival city                                        |
| siteCode          | Yes                                     | String    | Country Code of the user                                                  |                                                           |

### Examples

`GET /flights/logos?logoType=loading_page&siteCode=SA&departureCityCode=KWI&arrivalCityCode=CAI`

### Response

```json
[
  {
    "code": "MS",
    "name": "EgyptAir",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/MS"
  },
  {
    "code": "ticketsandhotels.com",
    "name": "ticketsandhotels.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/ticketsandhotels.com"
  },
  {
    "code": "KU",
    "name": "Kuwait Airways",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/KU"
  },
  {
    "code": "SV",
    "name": "Saudi Airlines Saudia",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/SV"
  },
  {
    "code": "rehlat.com",
    "name": "rehlat.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/rehlat.com"
  },
  {
    "code": "hotiks.com",
    "name": "hotiks.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/hotiks.com"
  },
  {
    "code": "J9",
    "name": "Jazeera Airways",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/J9"
  },
  {
    "code": "NP",
    "name": "Nile Air",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/NP"
  },
  {
    "code": "cleartrip.com",
    "name": "cleartrip.com",
    "imageUrl": "https://assets.wego.com/providers/rectangular_logos/cleartrip.com"
  },
  {
    "code": "UJ",
    "name": "AlMasria Universal Airlines",
    "imageUrl": "https://assets.wego.com/flights/airlines_square/UJ"
  }
]
```


# Pages Api
| Type  | Endpoint                                                | Description                            |
| ----- | ------------------------------------------------------- | -------------------------------------- |
| GET   | [/flights/v1//flights/pages](#get-all-pages-seo-text )  | Get seo text of flights pages          |
| GET   | [flights/pages/:id](#get-seo-text-by-id)                | Get seo text by id                     |
| GET   | [/flights/pages/:id/seo_texts](#get-all-seo-text-by-id) | Get all seo text translations by id    |
| POST  | [/flights/pages](#create-seo-text)                      | Create seo text based on flights pages |
| PATCH | [/flights/pages/:id](#update-seo-text)                  | Update seo text based on flights pages |

## Get all pages seo text
```
GET /flights/pages
```

### Parameters
| Property      | Required? | Data Type | Description                                                                                                                                                                                                                                                                                                                                                 |
| ------------- | --------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| locale        | No        | String    | Returns information of seo text in that locale. en as default and fallback.                                                                                                                                                                                                                                                                                 |
| page_type     | No        | String    | Returns all seo text based on page type. Only accepts: <ul><li>flights_to_country</li> <li>flights_to_city</li> <li>flights_from_country</li><li>flights_from_city</li> <li>flights_from_country_to_country</li> <li>flights_from_country_to_city</li><li>flights_from_city_to_country</li><li>flights_from_city_to_city</li><li>airlines_details</li></ul> |
| code          | No        | String    | Based on page_type,snake_case. For example: <br>`page_type` = `flights_from_city`, `code` = `SIN`. <br> `page_type` = `flights_from_city_to_city`, `code` =  `SIN_MNL`.                                                                                                                                                                                     |
| site_code     | No        | String    | Returns information of seo_text based on site code specified.                                                                                                                                                                                                                                                                                               |
| per_page      | No        | Integer   | Returns the number of results specified. Default 10.                                                                                                                                                                                                                                                                                                        |
| page          | No        | Integer   | Page number                                                                                                                                                                                                                                                                                                                                                 |
| key_transform | No        | String    | Format of json keys. camelLower or underscore. Default camelLower                                                                                                                                                                                                                                                                                           |

### Example
  * `/flights/pages?page_type=flights_to_country&code=SG&locale=ar`

### Response
```
[
    {
        "id": 18,
        "pageType": "flights_to_country",
        "code": "SG",
        "siteCode": "SG",
        "seoText": "ENGLISH text"
    },
    {
        "id": 118,
        "pageType": "flights_to_country",
        "code": "SG",
        "siteCode": "SG",
        "seoText": "AR text"
    }
]
```

---

### Get seo text by id
```
GET /flights/pages/:id
```
### Parameters
| Property      | Required? | Data Type | Description                                                       |
| ------------- | --------- | --------- | ----------------------------------------------------------------- |
| locale        | No        | String    | Returns information of seo text in that locale. en as default.    |
| key_transform | No        | String    | Format of json keys. camelLower or underscore. Default camelLower |


### Example
  * `/flights/pages/101?locale=ko&key_transform=underscore`

### Response
```
{
    "id": 101,
    "page_type": "flights_from_city",
    "code": "Z4",
    "site_code": "SG",
    "image_url": "www.a.com",
    "seo_text": "ko 34"
}
```

---

### Get all seo text by id
```
GET /flights/pages/:id/seo_texts
```

### Example
  * `/flights/pages/2/seo_texts`

### Response
```
[
    {
        "id": 120,
        "page_id": 101,
        "locale": "AR",
        "created_at": "2017-12-12T06:59:47.000Z",
        "updated_at": "2017-12-12T07:33:16.000Z",
        "seo_text": "arabic text"
    },
    {
        "id": 121,
        "page_id": 101,
        "locale": "DE",
        "created_at": "2017-12-12T06:59:47.000Z",
        "updated_at": "2017-12-12T07:33:16.000Z",
        "seo_text": "german text"
    },
    {
        "id": 119,
        "page_id": 101,
        "locale": "EN",
        "created_at": "2017-12-12T06:59:47.000Z",
        "updated_at": "2017-12-12T07:33:16.000Z",
        "seo_text": "english"
    },
    {
        "id": 122,
        "page_id": 101,
        "locale": "ko",
        "created_at": "2017-12-12T06:59:47.000Z",
        "updated_at": "2017-12-12T06:59:47.000Z",
        "seo_text": "korean"
    }
]
```
---

### Create seo text

```
POST /flights/pages
```
### Request Body
| Property                | Required? | Data Type       | Description                                                                                                                                                                                                                                                                                                                              |
| ----------------------- | --------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| page_type               | Yes       | String          | Type of flight pages. Only accepts: <ul><li>flights_to_country</li> <li>flights_to_city</li> <li>flights_from_country</li><li>flights_from_city</li> <li>flights_from_country_to_country</li> <li>flights_from_country_to_city</li><li>flights_from_city_to_country</li><li>flights_from_city_to_city</li><li>airlines_details</li></ul> |
| code                    | Yes       | String          | Create base on page_type,snake_case. For example: <br>`page_type` = `flights_from_city`, `code` = `SIN`. <br> `page_type` = `flights_from_city_to_city`, `code` =  `SIN_MNL`.                                                                                                                                                            |
| site_code               | Yes       | String          | Set information of seo_text based on site code specified.                                                                                                                                                                                                                                                                                |
| image_url               | No        | String          | The image url that goes along with the text.                                                                                                                                                                                                                                                                                             |
| translations_attributes | Yes       | Array of Hashes | The seo text and locale goes into this. en must be included otherwise                                                                                                                                                                                                                                                                    |

### Example
  * `/flights/pages/`

### Request Body
```
{
  "page_type": "flights_to_country",
  "code": "SG",
  "site_code": "sg",
  "translations_attributes":
  [{
    "locale": "AR",
    "seo_text": "AR text"
    },
    {
    "locale": "de",
    "seo_text": "GER TEXT "
    },
	{
    "locale": "JA",
    "seo_text": "JAP TEXT "
    },
    {
    "locale": "en",
    "seo_text": "EN TEXT "
    }
    ]
  }
```

---

### Update seo text

```
PATCH /flights/pages/:id
```
### Request Body
| Property                | Required? | Data Type       | Description                                                                                                                                                                                                                                                                                                                                     |
| ----------------------- | --------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| page_type               | No        | String          | Change type of flight pages. Only accepts: <ul><li>flights_to_country</li> <li>flights_to_city</li> <li>flights_from_country</li><li>flights_from_city</li> <li>flights_from_country_to_country</li> <li>flights_from_country_to_city</li><li>flights_from_city_to_country</li><li>flights_from_city_to_city</li><li>airlines_details</li></ul> |
| code                    | No        | String          | Change base on page_type, snake_case. For example: <br>`page_type` = `flights_from_city`, `code` = `SIN`. <br> `page_type` = `flights_from_city_to_city`, `code` =  `SIN_MNL`.                                                                                                                                                                  |
| site_code               | No        | String          | Set information of seo_text based on site code specified.                                                                                                                                                                                                                                                                                       |
| image_url               | No        | String          | The image url that goes along with the text.                                                                                                                                                                                                                                                                                                    |
| translations_attributes | No        | Array of Hashes | Seo text will be updated or created if not inside the table.                                                                                                                                                                                                                                                                                    |


### Example
  * `/flights/pages/2`

### Request Body
```
{
  "page_type": "flights_to_city",
  "code": "SIN",
  "image_url": "updated.com",
  "translations_attributes":
    [{
      "locale": "ko",
      "seo_text": "update new korean text "
    },
    {
      "locale": "en",
      "seo_text": "update english text "
    }
    ]
}
```

---

### Delete seo text

```
DELETE /flights/pages/:id
```
### Example
  * `/flights/pages/2`

---
# Payment Fees Api

| Type  | Endpoint                                              | Description         |
| ----- | ----------------------------------------------------- | ------------------- |
| GET   | [/flights/v1/payment_fees](#list-payment-fees)        | List payment fees   |
| POST  | [/flights/v1/payment_fees](#create-payment-fees )     | Create Payment fees |
| PATCH | [/flights/v1/payment_fees/:id](#update-payment-fees ) | Update Payment Fees |
| DEL   | [/flights/v1/payment_fees/:id](#delete-payment-fees ) | Delete Payment Fees |

## List Payment Fees

```GET flights/v1/payment_fees```

#### Purpose: 
For each fare, there is a payment fee based on payment method, provider code, site code, currency code.

### Parameters
| Property          | Required? | Data Type | Description                                                                            |
| ----------------- | --------- | --------- | -------------------------------------------------------------------------------------- |
| payment_method_id | No        | Integer   | The payment method associated to this fee.                                             |
| provider_id       | No        | Integer   | The provider associated                                                                |
| site_code         | No        | String    |                                                                                        |
| amount            | No        | Float     | Base amount for the payment method                                                     |
| amount_min        | No        | Float     | The minimum amount of payment fee                                                      |
| amount_max        | No        | Float     | The maximum amount of payment fee despite percentage calculation is more than the max. |
| percentage        | No        | Float     | Percentage of base price and passenger count                                           |
| currency_code     | No        | String    |                                                                                        |
| comment           | No        | String    |                                                                                        |
| departure_country | No        | String    |                                                                                        |
| arrival_country   | No        | String    |                                                                                        |
| alliance          | No        | String    |                                                                                        |
| trip_type         | No        | String    |                                                                                        |

### Example
```/flights/payment_fees```

### Response
```
  [
    {
        "id": 239,
        "payment_method_id": 15,
        "provider_id": 723,
        "site_code": "*",
        "amount": "0.0",
        "amount_min": "0.0",
        "amount_max": "0.0",
        "percentage": "0.0",
        "currency_code": "EUR",
        "comment": null,
        "created_at": "2016-09-08T07:04:42.000Z",
        "updated_at": "2016-09-29T08:35:59.000Z",
        "departure_country": null,
        "arrival_country": null,
        "alliance": null,
        "trip_type": null
    },
    ...
  ]
```

___


## Create Payment fees

```POST flights/v1/payment_fees```

#### Logic
1.  Require to specify at least one of the following: 
    site_code
    departure_country
    arrival_country
    alliance
    trip_type
2. Site code should be empty when departure_country, arrival_country, alliance, trip_type are not empty.
3. Can only choose to fill amount or percentage and not both.

### Parameters
| Property          | Required? | Data Type | Description                                                                            |
| ----------------- | --------- | --------- | -------------------------------------------------------------------------------------- |
| payment_method_id | Yes       | Integer   | The payment method associated to this fee.                                             |
| provider_id       | Yes       | Integer   | The provider associated                                                                |
| site_code         | No        | String    |                                                                                        |
| amount            | No        | Float     | Base amount for the payment method                                                     |
| amount_min        | No        | Float     | The minimum amount of payment fee                                                      |
| amount_max        | No        | Float     | The maximum amount of payment fee despite percentage calculation is more than the max. |
| percentage        | No        | Float     | Percentage of base price and passenger count                                           |
| currency_code     | No        | String    | Must be present if amount, amount_min and amount_max is present.                       |
| comment           | No        | String    |                                                                                        |
| departure_country | No        | String    |                                                                                        |
| arrival_country   | No        | String    |                                                                                        |
| alliance          | No        | String    |                                                                                        |
| trip_type         | No        | String    |                                                                                        |

### Example
```/flights/payment_fees```

### Request Body
``` json
{
	"payment_method_id": 15,
	"provider_id": 723,
	"amount": "2",
	"site_code": "SG",
	"currency_code": "SGD"
}
```
### Response
returns the object created, status 201 created
```  json
{
    "id": 13540,
    "payment_method_id": 15,
    "provider_id": 723,
    "site_code": "SG",
    "amount": "2.0",
    "amount_min": null,
    "amount_max": null,
    "percentage": null,
    "currency_code": "SGD",
    "comment": null,
    "created_at": "2018-06-01T06:59:26.000Z",
    "updated_at": "2018-06-01T06:59:26.000Z",
    "departure_country": null,
    "arrival_country": null,
    "alliance": null,
    "trip_type": null
}
```
___

## Update Payment fees

```PATCH flights/v1/payment_fees/:id```

### Logic

Validations are not in placed yet. 

### Parameters
| Property          | Required? | Data Type | Description                                                                            |
| ----------------- | --------- | --------- | -------------------------------------------------------------------------------------- |
| payment_method_id | Yes       | Integer   | The payment method associated to this fee.                                             |
| provider_id       | Yes       | Integer   | The provider associated                                                                |
| site_code         | No        | String    |                                                                                        |
| amount            | No        | Float     | Base amount for the payment method                                                     |
| amount_min        | No        | Float     | The minimum amount of payment fee                                                      |
| amount_max        | No        | Float     | The maximum amount of payment fee despite percentage calculation is more than the max. |
| percentage        | No        | Float     | Percentage of base price and passenger count                                           |
| currency_code     | No        | String    | Must be present if amount, amount_min and amount_max is present.                       |
| comment           | No        | String    |                                                                                        |
| departure_country | No        | String    |                                                                                        |
| arrival_country   | No        | String    |                                                                                        |
| alliance          | No        | String    |                                                                                        |
| trip_type         | No        | String    |                                                                                        |

### Example
```PATCH /flights/payment_fees/13540```

### Request Body
``` json
{
  "site_code": "EG"
}
```
### Response
returns the object created, status 200 OK
```  json
{
    "id": 13540,
    "payment_method_id": 15,
    "provider_id": 723,
    "site_code": "KR",
    "amount": "2.0",
    "amount_min": null,
    "amount_max": null,
    "percentage": null,
    "currency_code": "SGD",
    "comment": null,
    "created_at": "2018-06-01T06:59:26.000Z",
    "updated_at": "2018-06-01T07:31:47.000Z",
    "departure_country": null,
    "arrival_country": null,
    "alliance": null,
    "trip_type": null
}
```
___


## Delete Payment fees

```DELETE flights/v1/payment_fees/:id```

### Example
```/flights/payment_fees/13540```

### Response
status 200 ok
# Payment Methods Api

| Type  | Endpoint                                                         | Description                      |
| ----- | ---------------------------------------------------------------- | -------------------------------- |
| GET   | [/flights/v1/payment_methods](#list-payment-method-by-site-code) | List payment method by site code |
| POST  | [/flights/v1/payment_methods](#create-payment-method )           | Create Payment Method            |
| PATCH | [/flights/v1/payment_methods/:id](#update-payment-method )       | Update payment-method            |
| DEL   | [/flights/v1/payment_methods/:id](#delete-payment-method )       | Delete payment-method            |

## List Payment Method by site_code

```GET flights/v1/payment_methods```


#### Logic:

1. Check `Available Payment Method table` based on params.
2. site_code includes departure country code parameter, because if a user on AE pos searches for a flight from Iran, for example, user will be able to see Iranian payment methods as well as AE payment methods.

### Parameters
| Property             | Required? | Data Type | Description                                                   |
| -------------------- | --------- | --------- | ------------------------------------------------------------- |
| language             | No        | String    | The language that the response will be in. English as default |
| siteCode             | No        | String    | Country Code of the user                                      |
| appType              | No        | String    | The application type of the originating request.              |
| deviceType           | No        | String    | The device type of the originating request                    |
| departureCountryCode | No        | String    | Departure Country Code of the user                            |

### Example
```/flights/payment_methods?language=en&siteCode=SG&appType=web&deviceType=mobile&departureCountryCode=IR```
 `/flights/payment_methods?language=ar&siteCode=SG`


### Response
```
 {
    "name": "American Express",
    "paymentType": "CARD_CREDIT_UNKNOWN",
    "imageUrl": "https://res.cloudinary.com/wego/payment_logos/american_express.png",
    "id": 3,
    "isPopular": false
  }
```

### Special case for android devices
  always return name as `english name` and an extra field `translatedName` for name in `requested locale`
  * `/flights/payment_methods?language=ar&siteCode=SG&appType=android`

### Response
```
    [
      {
        name: "American Express",
        translatedName: "أمريكان إكسبريس",
        paymentType: "CARD_CREDIT_UNKNOWN",
        imageUrl: "https://res.cloudinary.com/wego/payment_logos/american_express.png",
        isPopular: false,
        id: 3
      },
      {
        name: "Bank Transfer",
        translatedName: "حوالة مصرفية",
        paymentType: "BANK_TRANSFER",
        imageUrl: "https://res.cloudinary.com/wego/payment_logos/bank_transfer.png",
        isPopular: false,
        id: 4
      },
      ...
    ]
```

___


## Create Payment Method

```POST flights/v1/payment_methods```

#### Logic
1. Note for callback to save in `available payment method table`

### Parameters
| Property                | Required? | Data Type     | Description                                                                                     |
| ----------------------- | --------- | ------------- | ----------------------------------------------------------------------------------------------- |
| name                    | Yes       | String        | The language that the response will be in. English as default. Has to be unique.                |
| payment_type            | Yes       | String        |                                                                                                 |
| code                    | Yes       | String        | Has to be unique                                                                                |
| image_url               | No        | String        | The device type of the originating request                                                      |
| comment                 | No        | String        | Departure Country Code of the user                                                              |
| translations_attributes | No        | Array of Hash | Additional translation for name                                                                 |
| available_in            | No        | Array         | site code where this payment type is available, will be saved in `AvailablePaymentMethod table` |
| popular_in              | No        | Array         | site code where this is popular in, must be in `available_in`                                   |

### Example
```/flights/payment_methods```

### Request Body
``` json
{
  "name": "CDE",
  "payment_type": "CASH",
  "code": "DEE",
  "translations_attributes": [
    {	
      "locale": "ar",
      "name": "arabic"
    },
    {
      "locale": "zh-cn",
      "name": "chinese"
    }
  ],
  "available_in": ["SG","KR"],
  "popular_in": ["KR"]
}
```
### Response
returns the object created
```  json
{
    "id": 154,
    "name_en": "CDE",
    "payment_type": "CASH",
    "comment": null,
    "created_at": "2018-05-31T04:38:34.000Z",
    "updated_at": "2018-05-31T04:38:34.000Z",
    "image_url": null,
    "code": "DEE",
    "name": "CDE"
}
```
___

## Update Payment Method

```PATCH flights/v1/payment_methods/:id```
### Logic
1. if `available_in` and `popular_in` not specified, it will be deleted in the table from `available payment methods` because of `after_save` callbacks. 

### Parameters
| Property                | Required? | Data Type     | Description                                                                                     |
| ----------------------- | --------- | ------------- | ----------------------------------------------------------------------------------------------- |
| name                    | No        | String        | The language that the response will be in. English as default. Has to be unique.                |
| payment_type            | No        | String        |                                                                                                 |
| code                    | No        | String        | Has to be unique                                                                                |
| image_url               | No        | String        | The device type of the originating request                                                      |
| comment                 | No        | String        | Departure Country Code of the user                                                              |
| translations_attributes | No        | Array of Hash | Additional translation for name                                                                 |
| available_in            | Yes       | Array         | site code where this payment type is available, will be saved in `AvailablePaymentMethod table` |
| popular_in              | Yes       | Array         | site code where this is popular in, must be in `available_in`                                   |

### Example
```PATCH /flights/payment_methods/154```

### Request Body
``` json
{
  "code": "DED",
  "available_in": ["SG","KR"],
  "popular_in": ["KR"]
}
```
### Response
returns the object created
```  json
{
    "id": 154,
    "name_en": "CDE",
    "payment_type": "CASH",
    "comment": null,
    "created_at": "2018-05-31T04:38:34.000Z",
    "updated_at": "2018-06-01T07:35:49.000Z",
    "image_url": null,
    "code": "DED",
    "name": "CDE"
}
```
___


## Delete Payment Method

```DELETE flights/v1/payment_methods```

### Example
```/flights/payment_methods/154```

### Response
status 200 ok
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

# Provider Badges Api

| Type  | Endpoint                                                 | Description            |
| ----- | -------------------------------------------------------- | ---------------------- |
| POST  | [/flights/provider_badges](#create-provider-badges )     | Create provider-badge  |
| PATCH | [/flights/provider_badges/:id](#update-provider-badges ) | Update provider-badges |
| DEL   | [/flights/provider_badges/:id](#delete-provider-badges ) | Delete provider-badges |

## Create Provider badges

```POST flights/provider_badges```

#### Logic:

1. Attempts to JSON parse `name`. Note that there is a need to escape necessary part of the JSON string.
2. If successful, provider badge will be added.

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| name     | Yes       | String    | The language that the response will be in. English as default. Must be valid JSON string. |
| code     | Yes       | String    | Code of the provider Badge. Must be unique.                                               |


### Example
```/flights/provider_badges```

### Request Body
``` json
{
  "name": "{\"en\": \"Airline support\"}",
  "code": "AIRLINE_SUPPORT"
 
}
```


### Response
```
 {
    "id": 6,
    "code": "AIRLINE_SUPPORT",
    "name": "{\"en\": \"Airline support\"}",
    "created_at": "2018-06-04T08:07:32.000Z",
    "updated_at": "2018-06-04T08:07:32.000Z"
}
```


___

## Update Provider badges

```PATCH flights/provider_badges/:id```

### Parameters
| Property | Required? | Data Type | Description                                                                               |
| -------- | --------- | --------- | ----------------------------------------------------------------------------------------- |
| name     | No        | String    | The language that the response will be in. English as default. Must be valid JSON string. |
| code     | No        | String    | Code of the provider badge. Must be unique.                                               |


### Example
```/flights/provider_badges/6```

### Request Body
``` json
{
  "name": "{\"en\": \"Airline helpline\"}",
  "code": "AIRLINE_HELPLINE"
 
}
```


### Response
```
 {
    "id": 6,
    "code": "AIRLINE_HELPLINE",
    "name": "{\"en\": \"Airline helpline\"}",
    "created_at": "2018-06-04T08:07:32.000Z",
    "updated_at": "2018-06-04T08:32:56.000Z"
}
```


___

## Delete Provider Badges

```delete flights/provider_badges/:id```

### Example
```/flights/payment_methods/6```

### Response
status 200 ok
# Provider Profiles Api

| Type  | Endpoint                                                     | Description             |
| ----- | ------------------------------------------------------------ | ----------------------- |
| GET   | [/flights/provider_profiles/find](#find-provider-profile )   | Find provider-profile   |
| POST  | [/flights/provider_profiles](#create-provider-profiles )     | Create provider-profile |
| PATCH | [/flights/provider_profiles/:id](#update-provider-profiles ) | Update provider-profile |
| DEL   | [/flights/provider_profiles/:id](#delete-provider-profiles ) | Delete provider-profile |

## Find Provider Profile

```GET flights/provider_profiles/find```


### Parameters
| Property      | Required? | Data Type | Description                                                                   | Default       |
| ------------- | --------- | --------- | ----------------------------------------------------------------------------- | ------------- |
| code          | Yes       | String    | Flight's provider pos_provider_code                                           |
| key_transform | No        | String    | Define format of key in response json. Accepts 'lower_camel' and 'underscore' | 'lower_camel' |

### Example
```/flights/provider_profiles/find?code=12go.asia```

### Response
```
 {
    "posProviderCode": "12go.asia",
    "parentCompany": "",
    "otherBrandsOfParentCompany": [],
    "otherOfficesCityCodes": [],
    "wegoPartnerSince": 2018,
    "supportPage": "https://flyhacks.com/contact",
    "aboutPage": "https://flyhacks.com/about-us",
    "email": "",
    "contacts": [],
    "links": []
}
```

### Error
`/flights/provider_profiles/find?code=non-exist`

<li>{"error":"not_found","message":"Couldn't find Provider"}```</li>

___


## Create Provider Profiles

```POST flights/provider_profiles```

### Logic
1.  Note that `contacts`, `links` and `translations` are created and updated to the tables if parameters are included.
2.  The method to create `translations` is in the concern of `UpdateTranslatedAttributes`.

### Parameters
| Property                       | Required? | Data Type | Description                                                                                                                                                                                      |
| ------------------------------ | --------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| provider_id                    | Yes       | Integer   | Id of the provider.                                                                                                                                                                              |
| parent_company                 | No        | String    | Parent company of provider                                                                                                                                                                       |
| other_brands_of_parent_company | No        | String    | Other brands for parent company of provider.                                                                                                                                                     |
| head_office_city_code          | No        | String    | City code of head office of provider. City code must be actual and valid.                                                                                                                        |
| other_offices_city_code        | No        | Array     | City codes of other offices of provider. City code must be actual and valid.                                                                                                                     |
| founded_at                     | No        | Integer   | Year Provider founded.                                                                                                                                                                           |
| wego_partner_since             | No        | Integer   | Year Provider partnered with wego. Time must be valid.                                                                                                                                           |
| support_page                   | No        | String    | Support page of provider.                                                                                                                                                                        |
| about_page                     | No        | String    | About page of provider.                                                                                                                                                                          |
| email                          | No        | String    | Email of provider.                                                                                                                                                                               |
| contacts_attributes            | No        | String    | To add to `provider_profile_contacts` table. Parameters needed are:<li>country_code</li><li>number</li><li>toll_free</li><li>office_hours_start</li><li>office_hours_end</li> <li>languages</li> |
| links_attributes               | No        | String    | To add to `provider_profile_links` table. Parameters needed are:<li>name</li><li>url</li>                                                                                                        |
| translations_attributes        | No        | String    | To add to `provider_profile_translations` table. Parameters needed are:<li>locale</li><li>description</li><li>head_office_address</li>                                                           |


### Example
```/flights/provider_profiles```

### Request Body
``` json
{
  "provider_id": 1107,
  "parent_company": "Singapore Airlines",
  "head_office_city_code": "SIN",
  "founded_at": 2018,
  "wego_partner_since": 2018,
  "support_page": "https://meowair.com/support",
  "about_page": "https://meowair.com/about",
  "email": "meowair@fly.com",
  "contacts_attributes": [
    {
        "country_code": "SIN",
        "number": "95695949",
        "toll_free": true,
        "office_hours_start": "09:00",
        "office_hours_end": "18:00",
        "languages": ["en", "ar"]
    }
  ],
  "links_attributes": [
  	{
  		"name":"Twitter",
  		"url":"https://twitter.com/meowair"
  	}
  ],
  "translations_attributes":[
  	{
  		"locale":"en",
  		"description":"Meowair is the up and coming Airline company that provides wonderful flights in budget price",
  		"head_office_address":"Beatle Rd, Blk 777, Singapore 655555 "
  	}
  ]
}
```


### Response
```
{
    "posProviderCode": "meowairways.com",
    "parentCompany": "Singapore Airlines",
    "headOfficeAddress": "Beatle Rd, Blk 777, Singapore 655555",
    "otherBrandsOfParentCompany": [],
    "otherOfficesCityCodes": [],
    "headOfficeCityCode": "SIN",
    "foundedAt": 2018,
    "wegoPartnerSince": 2018,
    "supportPage": "https://meowair.com/support",
    "aboutPage": "https://meowair.com/about",
    "email": "meowair@fly.com",
    "contacts": [
        {
            "id": 395,
            "providerProfileId": 305,
            "countryCode": "SIN",
            "number": "95695949",
            "tollFree": true,
            "officeHoursStart": "09:00",
            "officeHoursEnd": "18:00",
            "languages": [
                "en",
                "ar"
            ],
            "createdAt": "2018-06-07T03:44:22.000Z",
            "updatedAt": "2018-06-07T03:44:22.000Z"
        }
    ],
    "links": [
        {
            "id": 72,
            "providerProfileId": 305,
            "name": "Twitter",
            "url": "https://twitter.com/meowair",
            "createdAt": "2018-06-07T03:44:22.000Z",
            "updatedAt": "2018-06-07T03:44:22.000Z"
        }
    ]
}
```


___

## Update Provider Profiles

```PATCH flights/provider_profiles/:id```

### Parameters
| Property                       | Required? | Data Type | Description                                                                                                                                                                                                                                                                                                                    |
| ------------------------------ | --------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| provider_id                    | No        | Integer   | Id of the provider.                                                                                                                                                                                                                                                                                                            |
| parent_company                 | No        | String    | Parent company of provider                                                                                                                                                                                                                                                                                                     |
| other_brands_of_parent_company | No        | String    | Other brands for parent company of provider.                                                                                                                                                                                                                                                                                   |
| head_office_city_code          | No        | String    | City code of head office of provider. City code must be actual and valid.                                                                                                                                                                                                                                                      |
| other_offices_city_code        | No        | Array     | City codes of other offices of provider. City code must be actual and valid.                                                                                                                                                                                                                                                   |
| founded_at                     | No        | Integer   | Year Provider founded.                                                                                                                                                                                                                                                                                                         |
| wego_partner_since             | No        | Integer   | Year Provider partnered with wego. Time must be valid.                                                                                                                                                                                                                                                                         |
| support_page                   | No        | String    | Support page of provider.                                                                                                                                                                                                                                                                                                      |
| about_page                     | No        | String    | About page of provider.                                                                                                                                                                                                                                                                                                        |
| email                          | No        | String    | Email of provider.                                                                                                                                                                                                                                                                                                             |
| contacts_attributes            | No        | String    | To add to `provider_profile_contacts` table. Id of the contact is important here, if not included, a new contact will be added instead of updating the contact. Parameters needed are:<li>id</li><li>country_code</li><li>number</li><li>toll_free</li><li>office_hours_start</li><li>office_hours_end</li> <li>languages</li> |
| links_attributes               | No        | String    | To add to `provider_profile_links` table. Id of the link is important here, if not included, a new link will be added instead of updating the link. Parameters needed are:<li>id</li><li>name</li><li>url</li>                                                                                                                 |
| translations_attributes        | No        | String    | To add to `provider_profile_translations` table. Parameters needed are:<li>locale</li><li>description</li><li>head_office_address</li>                                                                                                                                                                                         |


### Example
```/flights/provider_profiles/6```

### Request Body
``` json
{
  "provider_id": 1107,
  "parent_company": "Singapore Airlines",
  "otherBrandsOfParentCompany": ["Scoot"],
  "otherOfficesCityCodes": ["TYO"],
  "head_office_city_code": "SIN",
  "founded_at": 2018,
  "wego_partner_since": 2018,
  "support_page": "https://meowair.com/support",
  "about_page": "https://meowair.com/about",
  "email": "meowair@fly.com",
  "contacts_attributes": [
    {
        "id": 395,
        "country_code": "SIN",
        "number": "95849384",
        "toll_free": true,
        "office_hours_start": "09:00",
        "office_hours_end": "20:00",
        "languages": ["en", "ar"]
    }
  ],
  "links_attributes": [
  	{
  		"id": 72,
  		"name":"Twitter",
  		"url":"https://twitter.com/meowair"
  	}
  ],
  "translations_attributes":[
  	{
  		"locale":"en",
  		"description":"Meowair is the up and coming Airline company that provides wonderful flights in budget price",
  		"head_office_address":"Beatle Rd, Blk 777, Singapore 656665"
  	}
  ]
}
```


### Response
```
{
    "posProviderCode": "meowairways.com",
    "parentCompany": "Singapore Airlines",
    "headOfficeAddress": "Beatle Rd, Blk 777, Singapore 656665",
    "otherBrandsOfParentCompany": [
        "Scoot"
    ],
    "otherOfficesCityCodes": [
        "TYO"
    ],
    "headOfficeCityCode": "SIN",
    "foundedAt": 2018,
    "wegoPartnerSince": 2018,
    "supportPage": "https://meowair.com/support",
    "aboutPage": "https://meowair.com/about",
    "email": "meowair@fly.com",
    "contacts": [
        {
            "id": 395,
            "providerProfileId": 305,
            "countryCode": "SIN",
            "number": "95849384",
            "tollFree": true,
            "officeHoursStart": "09:00",
            "officeHoursEnd": "20:00",
            "languages": [
                "en",
                "ar"
            ],
            "createdAt": "2018-06-07T03:44:22.000Z",
            "updatedAt": "2018-06-07T04:04:27.000Z"
        }
    ],
    "links": [
        {
            "id": 72,
            "providerProfileId": 305,
            "name": "Twitter",
            "url": "https://twitter.com/meowair",
            "createdAt": "2018-06-07T03:44:22.000Z",
            "updatedAt": "2018-06-07T03:44:22.000Z"
        }
    ]
}
```


___

## Delete Provider Profiles

```delete flights/provider_profiles/:id```

### Example
```/flights/provider_profiles/6```

### Response
status 200 ok
# Provider Routes Api

| Type  | Endpoint                                                 | Description            |
| ----- | -------------------------------------------------------- | ---------------------- |
| POST  | [/flights/provider_routes](#create-provider-routes )     | Create provider-routes |
| PATCH | [/flights/provider_routes/:id](#update-provider-routes ) | Update provider-routes |
| DEL   | [/flights/provider_routes/:id](#delete-provider-routes ) | Delete provider-routes |

## Create Provider Routes

```POST flights/provider_routes```

### Parameters
| Property           | Required? | Data Type | Description                                                                                         |
| -----------------  | --------- | --------- | --------------------------------------------------------------------------------------------------- |
| provider_id        | Yes       | Integer   | Id of the provider.                                                                                 |
| route_type         | Yes       | String    | Type of route. Only accepts: <li>country</li><li>airport</li><li>no_country</li><li>no_airport</li> |
| departure_code     | Yes       | String    | Departure country code                                                                              |
| arrival_code       | Yes       | String    | Arrival country code                                                                                |
| direct_flight_only | No        | Boolean   | direct flight only if set true                                                                      |
| source             | Yes       | String    | Source file for route                                                                               |


### Example
```/flights/provider_routes```

### Request Body
``` json
{
	"provider_id": 1107,
	"route_type": "no_country",
	"departure_code": "HKG",
	"arrival_code": "TYO",
	"direct_flight_only": true,
	"source": "route file"
}
```


### Response
```
 {
    "id": 7,
    "provider_id": 1107,
    "route_type": "country",
    "departure_code": "HKG",
    "arrival_code": "TYO",
    "direct_flight_only": true,
    "source": "route file",
    "created_at": "2018-06-05T04:25:41.000Z",
    "updated_at": "2018-06-05T04:25:41.000Z"
}
```


___

## Update Provider Routes

```PATCH flights/provider_routes/:id```


### Parameters
| Property           | Required? | Data Type | Description            |
| --------------     | --------- | --------- | ---------------------- |
| provider_id        | No        | Integer   | Id of the provider.    |
| route_type         | No        | String    | Type of route.         |
| departure_code     | No        | String    | Departure country code |
| arrival_code       | No        | String    | Arrival country code   |
| direct_flight_only | No        | Boolean   | flag for direct flight |
| source             | No        | String    | Source file for route  |

### Example
```/flights/provider_profiles/6```

### Request Body
``` json
{
	"provider_id": 1107,
	"route_type": "country",
	"departure_code": "SIN",
	"arrival_code": "HKG",
	"direct_flight_only": true
}
```


### Response
```
 {
    "id": 11,
    "provider_id": 1107,
    "route_type": "country",
    "departure_code": "SIN",
    "arrival_code": "HKG",
    "direct_flight_only": true,
    "source": "route file",
    "created_at": "2018-06-05T04:30:19.000Z",
    "updated_at": "2018-06-05T06:08:38.000Z"
}
```


___

## Delete Provider Routes

```DELETE flights/provider_routes/:id```

### Example
```/flights/provider_routes/6```

### Response
status 200 ok
# Flight Provider Scripts Api

| Endpoint                                                                     | Description                     |
| --------------------------------------------------------------------------   | ------------------------------- |
| [GET /flights/provider_scripts](#get-provider-scripts )                      | Get flight provider scripts     |


## Get Flight Provider Scripts

```
GET /flights/provider_scripts
```

### Parameters
| Property           | Required? | Data Type | Description                                                             |
| -----------------  | --------- | --------- | ----------------------------------------------------------------------- |
| provider_code      | Yes       | String    | provider_code of the provider.                                          |
| site_code          | Yes       | String    | User Selected Country Code. Must be in ISO country code format.         |
| locale             | Yes       | String    | User selected language. English as default.                             |              

### Example
```/flights/provider_scripts?provider_code=tiket.com&site_code=SG&locale=en```

### Response
```
{
   "disparity": [
     {
       "url_regex": "*/flights/detailmeta/*",
       "script": "1"
     },
     {
       "url_regex": "*/flights/detailmeta/*",
       "script": "2"
     }
   ]
}
```

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


# Settings Api

| Type  | Endpoint                                      | Description     |
| ----- | --------------------------------------------- | --------------- |
| POST  | [/flights/v1/settings](#create-settings )     | Create Settings |
| PATCH | [/flights/v1/settings/:id](#update-settings ) | Update Settings |
| DEL   | [/flights/v1/settings/:id](#delete-settings ) | Delete Settings |

## Create Settings
`POST /flights/v1/settings`

### Parameters
| Property    | Required? | Data Type | Description                                  |
| ----------- | --------- | --------- | -------------------------------------------- |
| name        | Yes       | String    | Must be unique                               |
| value       | Yes       | String    |                                              |
| data_type   | Yes       | String    | Integer, Float, Boolean, String of the value |
| description | Yes       | String    | Where is the information from                |


### Example Request Body
``` json 
{
	"name": "SHORT_LAYOVER_3",
	"value": "32",
	"data_type": "Integer"
}
```

### Response
``` json
{
    "id": 10,
    "name": "SHORT_LAYOVER_3",
    "value": "32",
    "data_type": "Integer",
    "description": null,
    "created_at": "2018-06-05T02:20:59.000Z",
    "updated_at": "2018-06-05T02:20:59.000Z"
}
```
___

## Update Settings

`PATCH /flights/v1/settings/:id`

### Parameters
| Property    | Required? | Data Type | Description                                  |
| ----------- | --------- | --------- | -------------------------------------------- |
| name        | Yes       | String    | Must be unique                               |
| value       | Yes       | String    |                                              |
| data_type   | Yes       | String    | Integer, Float, Boolean, String of the value |
| description | Yes       | String    | Where is the information from                |

### Example Request Body
``` json 
{
	"name": "SHORT_LAYOVER_4"
}
```

### Response
``` json
{
    "id": 10,
    "name": "SHORT_LAYOVER_4",
    "value": "32",
    "data_type": "Integer",
    "description": null,
    "created_at": "2018-06-05T02:20:59.000Z",
    "updated_at": "2018-06-05T02:23:09.000Z"
}
```

___

## Delete Settings
`DEL /flights/v1/settings/:id`

### Logic
Return status 200 ok if delete successful
___


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


# Hotel Matching
## Architecture
![architecture](/hotel_matching/high_level_architecture.png "high level architecture")

![architecture](/hotel_matching/hotel_services_matching_details.png "matching details")

GCS: https://console.cloud.google.com/storage/browser/wego-services-logs/production/stg_hotel_services_hotel_matches?project=wego-cloud&pli=1

BQ: 
https://bigquery.cloud.google.com/table/wego-cloud:services_hotel_staging.hotel_matches20190814?pli=1


## Broad Matching

In elasticsearch

## Narrow Matching

List of wego hotels from elasticsearch passed into a custom algorithm to produce a score and sorted by highest score.

Each attributes has its own algorithm / scoring system and it will return a score object with its score and confidence.

The attributes and algorithm are as follow:
_note that if there are no relevate attributes passed, it will return a score object with 0 score and 0 confidence._

1. location name

   <p style="color: red">QUESTION: how did we match provider location to wego location?</p>

   [using ngram distance. click here to understand](#Ngram-Distance)

2. hotel name
   Takes in provider hotel name, wego hotel name and wego city name.

   1. get the score of the raw names using [ngram distance](#Ngram-Distance).
   2. remove the first occurence of " city_name " in wego hotel name and "city_name" in provider hotel name. Note the spacing.
      Example:

   ```
   provider_hotel_name = "Marina Bay Sands Singapore in Singapore"
   => "Marina Bay Sands in Singapore"

   wego_hotel_name = "Marina Bay Sands Singapore"
   => "Marina Bay Sands Singapore" (Singapore not removed because it is
   trying to find " Singapore ")
   ```

   3. remove all [keywords](#Keyword-Definition) from the hotel names.
   4. get the score of both names that are changed using [ngram distance](#Ngram-Distance).
   5. Compare both scores

   ```
   if raw name score is >= to
   treated name(i.e. name with removed words) score and treated name confidence
   is less than 0.5, use the raw name score, else, use treat name score.
   ```

3. keywords
   takes in 2 provider hotel name and wego hotel name. [keywords definition](#Keyword-Definition)
   ```
   keyword found in str1, not found in str2 AND
   keyword found in str2 and not found in str1 return 1
   else return 0
   ```
   Example:
   ```
   getKeywords('a has hotel', 'b has suite too')
   => 0
   getKeywords('a has nothing', 'b has suite')
   => 1
   getKeywords('a has hotel villa', 'b has suite too')
   => 1
   ```
4. address
   takes in wego address and provider address.

   1. finds the numbers in the addresses
      example:

   ```
   wego_address = "123 east west 456"
   num_in_wego_address = [123, 456]

   provider_address = "123 Tanglin Road St 21 Singapore 98765"
   num_in_provider_address = [123, 21, 98765]
   ```

   2. get the min group size and max, for the example above, min = 2, max = 3.
   3. Calculate the [number of intersections](#Number-Of-Intersections) based on the num in wego address and num in provider address.
   4. Calculate the number coefficient based on this:
      `num_coeff = 1 / (1+(min_group_size - num_intersection).to_f/(min_group_size+1))`
   5. get the score of address using [ngram distance](#Ngram-Distance).
   6. Final score would be
      `address ngram score * num coefficient`
   7. Final confidence = address ngram confidence

5. lat long

   1. switch provider lon lat if wrong based on:
      `(wego_lon - provider_lon).abs + (wego_lat - provider_lat).abs > (wego_lon - provider_lat).abs + (wego_lat - provider_lon).abs`
   2. get haversine distance between provider lat lon and wego lat lon
   3. if distance < 2500 and distance > 0,2, assign `score = 0.15/distance`
   4. else if distance < 2500 and distance < 0.2, assign `score = 1 - 4 * distance * distance`
   5. if distance > 2500, score = 0
   6. this scoring system is a little special, it includes a num_coeff which if distance is < 2500, num_coeff = 1. else num_coeff = 0.
      Example:

   ```
   if distance = 0.1, score = 1 - 4 * distance * distance  = 0.96.
   Therefore, final scoring object:
   num_coeff = 1, score = 0.96, confidence = distance = 0.1

   if distance = 2600
   final scoring object:
   num_coeff = 0, score = 0, confidence = 2600
   ```

6. postal code
   [using match distance. click here to understand](#Match-Distance)
7. email
   [using match distance. click here to understand](#Match-Distance)
8. phone numbers
   accepts up to 3 phone numbers
   [using match distance. click here to understand](#Match-Distance)

Based on all these individual calculated components, there is a final evaluating address based on address, postal code and latlon. formula as follow:
`(address_lat_lon_max * W_ADDRESS_LONLAT_MAX + (W_ADDRESS_AVG * @address.score * @address.confidence + W_LONLAT_AVG * @lonlat.score * @lonlat.num_coeff)/ (W_ADDRESS_AVG+ W_LONLAT_AVG) * W_ADDRESS_LONLAT_AVG + @location_name.score * W_LOCATION + @postal.score * W_POSTAL)/(W_ADDRESS_LONLAT_MAX + W_ADDRESS_LONLAT_AVG + W_LOCATION + @postal.score * W_POSTAL)`
where the constants are:

```
W_ADDRESS_LONLAT_MAX = 15
W_ADDRESS_LONLAT_AVG = 15
W_LONLAT_AVG = 10
W_ADDRESS_AVG = 30
W_LOCATION = 5
W_POSTAL = 1
W_NAME = 15
W_ADDRESS = 10
W_EMAIL = 3
W_PHONE = 3
```

**Finally**, the final match score with the weights are:

```
score = ((W_NAME * name.confidence * name.score) +
(W_ADDRESS * address_score) +
(W_EMAIL * email.score) +
(W_PHONE * phone.score)) /
(W_NAME* name.confidence +
W_ADDRESS +
W_EMAIL * email.score +
W_PHONE * phone.score )

if keyword score is 1 and final score is more than 0.7, return 0.7.
else, return final score.
```

## Algorithm Appendix

#### Keyword Definition

`['hotel', 'villa', 'residence', 'suite', 'apartment']`

### Number of Intersections

```
arr_1 = ["aab", "abc", "bcd", "cde", "dec", "ecd", "cde"]
arr_ 2 = ["aab", "abc", "bcd", "cde", "dec", "ecd", "cde", "def", "efg"]

by comparing arr1 and arr2, you will notice 7 elements are the
same (it will include duplicates. note that "cde" appeared twice.)

num_of_duplicates = 7
```

#### Match Distance

as long as both list have 1 same return 1
but the same string is not empty string
Example:

```
arr1 = [1,2,3]
arr2 = [1,4,5]
=> 1

arr1 = ["", 2]
arr2 = ["", 3]
=> 0
```

#### Ngram Distance

Takes in two strings, str1, str2 and n.

1. Calculate the total number of ngrams each string has.  
   Formula:

```
shorter_num_of_ngram = length_of_shorter_str - (n-1)
longer_num_of_ngram = length_of_longer_str - (n-1)
```

2. Set all strings to lowercase and get the ngram tokens:
   For example:

```
str1 = "The Brown"
n = 3

ngram tokens will be:
["the", "he ", "e b", " br", "bro", "row", "own"]
```

3. Calculate the [number of intersections](#Number-Of-Intersections) between str1 and str2 ngram tokens.

4. Lastly, calculating the score (using old bayes implemntation) and confidence:

```
score = num_of_intersections /
(0.9 * shorter_num_of_ngram + 0.1 * longer_num_of_ngram + 0.07 )
```

I can't understand how the confidence is computed _hence the x, y variable naming_.

```
x = [(shorter_num_of_ngram.to_f/10), 1].min
y = [(shorter_num_of_ngram.to_f/longer_num_of_ngram.to_f), 1].min
confidence = (10 + 10*x + 10*y)/30
```

This method will return a score object of score and confidence.

## Logging Schema

Each provider hotel will log top 10 Wego Hotel

```
provider :RECORD
wego :RECORD

location_name :RECORD
location_name.score :FLOAT
location_name.confidence :FLOAT
location_name.weight :INTEGER

name :RECORD
name.score :FLOAT
name.confidence :FLOAT
name.weight :INTEGER

keyword :RECORD
keyword.score :FLOAT

address :RECORD
address.score :FLOAT
address.confidence :FLOAT
address.weight :INTEGER

lonlat :RECORD
lonlat.score :FLOAT
lonlat.confidence :FLOAT
lonlat.weight :INTEGER

postal :RECORD
postal.score :FLOAT
postal.weight :FLOAT

email :RECORD
email.score :FLOAT
email.weight :FLOAT

phone :RECORD
phone.score :FLOAT
phone.weight :FLOAT

address_score :FLOAT
final_match_score :FLOAT
```


# Wego Users API

| Endpoint                                                            | Description               | Status       |
| ------------------------------------------------------------------- | ------------------------- | ------------ |
| [POST /users/sign_in](#users-sign-in)                               | Users sign in             | `Deprecated` |
| [POST /users/sign_up](#users-sign-up)                               | Users sign up             | `Active`     |
| [POST /users/oauth/token](#users-oauth-token)                       | Users Login               | `Active`     |
| [POST /users/oauth/revoke](#users-oauth-revoke)                     | Users Logout              | `Active`     |
| [PUT PATCH /users/update](#users-update)                            | Users info Update         | `Active`     |
| [GET /users/info](#users-info)                                      | Users info                | `Active`     |
| [GET /users/preferences](#users-preferences)                        | Users preferences         | `Active`     |
| [GET /users/right_to_forget](#users-right-to-forget)                | Users right to forget     | `Active`     |
| [POST /users/resend_confirmation](#users-resend-confirmation-email) | resend confirmation email | `Active`     |
| [POST /users/email_confirmation](#users-email-confirmtaion)         | Confirm user email        | `Active`     |
| [POST /users/forgot_password](#users-password-forgot)               | Send password reset email | `Active`     |
| [POST /users/update_password](#users-password-update)               | Change user password      | `Active`     |
| [POST /users/reset_password](#users-password-reset)                 | Reset user password       | `Active`     |
| [GET /users/affiliates/:aid](#get-affiliate)                        | Get Affiliate Info        | `Active`     |
| [POST /users/affiliates](#create-affiliate)                         | Create Affilicate         | `Active`     |
| [PUT /users/affiliates](#update-affiliate)                          | Update Affilicate         | `Active`     |
| [GET /users/verify](#verify-token)                          	      | Verify user token         | `Active`     |

## Users Sign-In

### Parameters

There 2 ways to sign in. The direct Email and Password way and the Oauth.

#### Email and Password

| Param         | Required? | Data Type | Description   |
| ------------- | --------- | --------- | ------------- |
| user.email    | Yes       | String    | Email address |
| user.password | Yes       | String    | The password  |

#### Oauth

| Param           | Required? | Data Type | Description                                      |
| --------------- | --------- | --------- | ------------------------------------------------ |
| user.auth_token | Yes       | String    | Oauth token from the preferred identity provider |

### Examples

#### Request Path

`POST /users/sign_in`

#### Request Body

**Email and Password**

```
{
  "user": {
    "email": "kusumah@ganteng.com",
    "password": "johndoepassword"
  },
  "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
  },
  "locale": "en"
}
```

**Oauth**

```
{
  "provider": "facebook",
  "token": "dummytoken"
    "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
  },
  "locale": "en"
}
```

#### Response

```
{
  "id": 36328,
  "email": "kusumah@ganteng.com",
  "token": "ZAMBY4Zoco6Yz1zS_-xw",
  "needs_to_set_password": false,
  "sign_in_count": 6782,
  "user_hash": "a707f1075a5d85c025b1c2977314786b",
  "user_confirmed": false,
  "cs_restore_id": "test6"
}
```

## Users Sign-Up

### Parameters

There 2 ways to sign up. The direct Email and Password way and the Oauth.

#### Email and Password Sign-Up

| Param              | Required? | Data Type   | Description           |
| ------------------ | --------- | ----------- | --------------------- |
| user.email         | No        | String      | User email to sign up |
| user.password      | No        | String      | Password              |
| device.device_id   | String    | Device id   |
| device.app_version | String    | App version |
| device.device_type | String    | Device type |
| locale             | No        | String      |                       |

#### Oauth Signup

| Param              | Required? | Data Type   | Description        |
| ------------------ | --------- | ----------- | ------------------ |
| provider           | Yes       | String      | Facebook, Google.. |
| token              | Yes       | String      | Some random string |
| device.device_id   | String    | Device id   |
| device.app_version | String    | App version |
| device.device_type | String    | Device type |
| locale             | No        | String      |                    |

### Examples

#### Request Path

`POST /users/sign_up`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Email and Password**

```
{
  "user": {
    "email": "ahmad_k102@yahoo.com",
    "password": "password",
    "password_confirmation": "password",
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  }

}
```

**Oauth**

```
{
  "user": {
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  },
  "provider": "<provider (google/ facebook)>",
  "token": "<provider_token>"
}
```

#### Response

```
{
  "id": 2609997,
  "email": "ahmad_k1021234@yahoo.com",
  "token": "7E92xbFwNBymACCgDSxu",
  "needs_to_set_password": false,
  "sign_in_count": 0,
  "user_hash": "a707f1075a5d85c025b1c2977314786b",
  "user_confirmed": false,
  "cs_restore_id": null
}
```

## Users Oauth Token

### Parameters

There 2 ways to sign in. The direct Email and Password way and the Oauth.

#### Email and Password

| Param      | Required? | Data Type | Description                                |
| ---------- | --------- | --------- | ------------------------------------------ |
| email      | Yes       | String    | Email address                              |
| password   | Yes       | String    | The password                               |
| client_id  | Yes       | String    | Oauth registered Client ID                 |
| grant_type | Yes       | String    | signin method                              |
| scope      | Yes       | String    | application scope <user, users, affiliate> |

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| client_id             | Yes       | String    | Oauth registered Client ID               |
| client_secret         | Yes       | String    | Oauth registered Client Secret           |
| grant_type            | Yes       | String    | signin method                            |
| prvider               | Yes       | String    | 3rd party service <google/facebook>      |
| provider_access_token | Yes       | String    | signin method auth token                 |
| scope                 | Yes       | String    | application scope <user/users/affiliate> |

### Examples

#### Request Path

`POST /users/oauth/token`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Email and Password**

```
{
    "client_id": "e8ab8c92713155c4e66a2d5fe79e1843d6bc6939c70154c5ff6629504265b1dd",
    "email": "wego_test103@yahoo.com",
    "grant_type": "password",
    "password": "password",
    "scope": "user"
}
```

**Oauth**

```
{
  "client_id": "d03c13d00944731e07d1d06cac015242eb3cc52616d77b466fa9de96c19ebc1d",
  "client_secret": "730a214ed0e329e85aea3d4705ed4a48f82dfb19a2359b99d81c1ebc2d9feaef",
  "grant_type": "password",
  "provider": "google",
  "provider_access_token": "<servie provider auth token>",
  "scope": "users"
}
```

#### Response

```
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjkwMDQ3Niwic3ViIjoiYWhzYW5fdGVzdDEwM0B5YWhvby5jb20iLCJhdWQiOiJ1c2VyIiwiZXhwIjoxNTUwNTA1ODM1LCJpYXQiOjE1NTA0NjI2MzUsImlzcyI6ImlueWlnbyIsImp0aSI6ImE1MWI2OGQxYmI3N2UxNDAwMzdhYThjMmQxODdhODMzIiwiYWlkIjoiMzEyMyJ9.Stze7Dhj5itaEM7ICet50G9c3KfczV8ncyRIOP74NTw",
    "token_type": "bearer",
    "expires_in": 43199,
    "refresh_token": "74992ddb94ee7e09a4639f4606b59cefcd8297850ef52379e485883d53c87c5a",
    "scope": "user",
    "created_at": 1550462635,
    "authentication_token": "GrRzFRuy2gpsmkFS5dNQ",
    "user_confirmed": false,
    "user_hash": "ecaec7f4dbeb2f472f74223eb244bc1a",
    "needs_to_set_password": false,
    "sign_in_count": 0,
    "cs_restore_id": "test6"
}
```

## Users Oauth Revoke

### Parameters

To revoke the token upon logout.

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| client_id             | Yes       | String    | Oauth registered Client ID               |
| client_secret         | Yes       | String    | Oauth registered Client Secret           |
| token                 | Yes       | String    | access token                             |


### Examples

#### Request Path

`POST /users/oauth/revoke`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Oauth**

```
{
    "client_id": "e8ab8c92713155c4e66a2d5fe79e1843d6bc6939c70154c5ff6629504265b1dd",
    "client_secret": "730a214ed0e329e85aea3d4705ed4a48f82dfb19a2359b99d81c1ebc2d9feaef",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjkwMDQ5OCwic3ViIjoiYWhzYW5fdGVzdDExNUB5YWhvby5jb20iLCJhdWQiOiJ1c2VyIiwiZXhwIjoxNTY2ODQxNDg4LCJpYXQiOjE1NjY3OTgyODgsImlzcyI6ImlueWlnbyIsImp0aSI6IjNiNjgxYmZkYTJiZmVlMTY0YzhiZGE0YTE5NjFiNzNhIiwiYWlkIjoiMzEyMyJ9.YO2rocoMpNhCqrjLGRCvxzKjh0OUq3uR1-a2RalynME"
}
```

#### Response
[Always returns 200 OK, even if token doesn't exist or has already been revoked.](https://github.com/doorkeeper-gem/doorkeeper/wiki/API-endpoint-descriptions-and-examples#post-oauthrevoke)

```
{}
```


## Users Update

### Parameters

To update the user info

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| user                  | Yes       | Hash   	| key value pair of fields being updated   |


### Examples

#### Request Path

`PUT|PATCH /users/update`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

#### Request Body

**Oauth**

```
{
    "user": {
        "cs_restore_id": "test6"
    }
}
```

#### Response
 
```
200 

{
    "id": 2611297,
    "email": "test103@yahoo.com",
    "name": " ",
    "photo_url": null,
    "country_code": null,
    "user_hash": "dee245a61cebb420507bdc599fc5ead1",
    "id_hash": "38e7a1b5c61331b1e2f13c1e9be08118",
    "cs_restore_id": "test6"
}
```

## Users info

### Parameters

`NA`

### Examples

### Request Path

`GET /users/info`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "id": 900476,
    "email": "wego_test103@yahoo.com",
    "name": null,
    "photo_url": null,
    "country_code": null,
    "user_hash": "2f970f6c134859c34d190180d72b8267",
    "id_hash": "38e7a1b5c61331b1e2f13c1e9be08118",
    "cs_restore_id": "test6"
}
```

## Users preferences

### Parameters

`NA`

### Examples

### Request Path

`GET /users/preferences`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "user": {
        "first_name": null,
        "last_name": null,
        "email": "wego_test103@yahoo.com",
        "cctld": "www.wego.com",
        "locale": "id",
        "time_zone": "America/New_York",
        "newsletter_opt_in": false,
        "id": 900476,
        "status": "ACTIVE",
        "site_code": null,
        "user_hash": "2f970f6c134859c34d190180d72b8267"
    },
    "travellers": [],
    "billing_addresses": [],
    "contacts": [],
    "fare_alert_subscriptions": []
}
```

## Users right to forget

### Parameters

`NA`

### Examples

### Request Path

`GET /users/right_to_forget`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "id": 900476,
    "email": "wego_test103@yahoo.com",
    "user_hash": "ecaec7f4dbeb2f472f74223eb244bc1a"
}
```

## Users Resend Confirmation email

### Parameters

| Param | Required? | Data Type | Description                                                         |
| ----- | --------- | --------- | ------------------------------------------------------------------- |
| email | Yes       | String    | User's email address that will be use for sending confirmation link |

### Examples

#### Request Path

`POST /users/resend_confirmation`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com"
  }
}
```

#### Response

No response body will be sent.

## Users Email Confirmation

### Parameters

| Param              | Required? | Data Type | Description                                                         |
| ------------------ | --------- | --------- | ------------------------------------------------------------------- |
| email              | Yes       | String    | User's email address that will be use for sending confirmation link |
| confirmation_token | Yes       | String    | confirmatio token send in URL with same name                        |

### Examples

#### Request Path

`POST /users/email_confirmation`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com",
    "confirmation_token": "FeMGTjs19M9d6rkUvM_c"
  }
}
```

#### Response

No response body will be sent.

## Users Forgot Password Email

### Parameters

| Param  | Required? | Data Type | Description                                                                 |
| ------ | --------- | --------- | --------------------------------------------------------------------------- |
| email  | Yes       | String    | User's email address that will be use for sending reset link                |
| locale | No        | String    | The locale in which the password reset instruction email will be written in |

### Examples

#### Request Path

`POST /users/forgot_password`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com",
    "locale": "en"
  }
}
```

#### Response

No response body will be sent.

## Users Password Update

### Parameters

| Param                 | Required? | Data Type | Description                    |
| --------------------- | --------- | --------- | ------------------------------ |
| current_password      | Yes       | String    | current user password          |
| password              | Yes       | String    | new user password              |
| password_confirmation | Yes       | String    | new user password confirmation |

### Examples

#### Request Path

`POST /users/update_password`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

#### Request Body

```
{
	"user": {
	"current_password": "password",
	"password":"password1",
	"password_confirmation": "password1"
 }
}
```

#### Response

No response body will be sent.

## Users Password Reset

### Parameters

| Param                 | Required? | Data Type | Description                                                   |
| --------------------- | --------- | --------- | ------------------------------------------------------------- |
| reset_password_token  | Yes       | String    | token is in the params of the reset email link with same name |
| password              | Yes       | String    | new user password                                             |
| password_confirmation | Yes       | String    | new user password confirmation                                |

### Examples

#### Request Path

`POST /users/reset_password`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
	"user": {
	"reset_password_token": "8bd042fea8508314a0a2",
	"password":"password1",
	"password_confirmation": "password1"
 }
}
```

#### Response

No response body will be sent.

---

## Get Affiliate

### Parameters

| Param | Required? | Data Type | Description                                          |
| ----- | --------- | --------- | ---------------------------------------------------- |
| aid   | Yes       | String    | Affiliate ID aka TS Code. The value is from kumonosu |

### Examples

`/users/affiliates/69cd6`

### Request Path

`GET /users/affiliates/:aid`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

### Response

```
{
    "name": "Arrivedo",
    "client_id": "ef1e338d29697ddd5e0985649a65c548d7954c05ec19c57fcc6f5660e62c2533",
    "client_secret": "893234d60e0b66b6707098e0b32f25fe976d95a418e6d989e647015a8412cd55",
    "aid": "69cd6",
    "email": "rodrigo@arrivedo.com",
    "expires_in": "2018-11-02"
}
```

--

## Create Affiliate

### Parameters

| Param      | Required? | Data Type | Description                                   |
| ---------- | --------- | --------- | --------------------------------------------- |
| aid        | Yes       | String    | TS Code / Affiliate ID. Generated by kumonosu |
| name       | Yes       | String    | Affiliate Name                                |
| email      | Yes       | String    | Affiliate Email                               |
| expires_in | Yes       | String    | Format: "YYYY-MM-DD"                          |

#### Request Path

`POST /users/affiliates`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

#### Request Body

```
{
  "aid": "12345",
  "name": "Inigo",
  "email": "inigo@wego.com",
  "expires_in": "2020-01-01"
}
```

#### Response

```
{
    "name": "Inigo",
    "client_id": "4d6d1e4c8d0dc7394d369604",
    "client_secret": "422b2971828b2335782d1404",
    "aid": "12345",
    "email": "inigo@wego.com",
    "flights_rate_limit": 600,
    "hotels_rate_limit": 600,
    "expires_in": "2020-01-01"
}
```

## Update Affiliate

Endpoint for updating expiry and rate limit of an affiliate account

### Parameters

| Param              | Required? | Data Type | Description            |
| ------------------ | --------- | --------- | ---------------------- |
| flights_rate_limit | Yes       | String    | Flights API Rate Limit |
| hotels_rate_limit  | Yes       | String    | Hotels API Rate Limit  |
| expires_in         | Yes       | String    | Format: "YYYY-MM-DD"   |

#### Request Path

`POST /users/affiliates/:aid`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

#### Request Body

```
{
  "expires_in": "2019-12-19",
  "hotels_rate_limit": 1000,
  "flights_rate_limit": 1000
}
```

#### Response

```
{
    "name": "Inigo",
    "client_id": "4d6d1e4c8d0dc7394d369604",
    "client_secret": "422b2971828b2335782d1404",
    "aid": "12345",
    "email": "inigo@wego.com",
    "flights_rate_limit": 600,
    "hotels_rate_limit": 600
}
```

## Verify Token

### Examples

`/users/verify`

### Request Path

`GET /users/verify`

### Headers

`Authorization: Bearer <access token>`

`X-User-Id-Hash: <User ID Hash>`

_This endpoint is only accessible internally to services._

### Response

```
{
    "expires_in": 43200,
    "created_at": "2019-07-29T04:12:27.000Z"
}
```

_wego-services-rb should be used to access this endpoint, it will give you time to cache the token based on remaining validity under `valid_for`._

### Response wego-services-rb
```
#<Wego::Services::User::Verifier::Session:0x0000562b7df6fd20 @valid_for=40583>
```


# Wego Partner Services API

No | Endpoint                                                                                        | Description                   |
---|-------------------------------------------------------------------------------------------------|-------------------------------|
1  | [GET partners/autofill](#autofill)                                                              | Autofill                      |
2  | [GET partners/provider_hotels/provider_hotel_id](#get-provider-hotel-detail)                    | Get Provider Hotel Detail     |
3  | [GET partners/provider_hotels](#get-provider-hotels)                                            | Get Provider Hotels           |
4  | [GET partners/provider_locations](#get-provider-locations)                                      | Get Provider Locations        |
5  | [GET partners/providers](#get-providers)                                                        | Get Providers                 |
6  | [POST partners/providers](#create-provider)                                                     | Create Provider               |
7  | [PUT partners/providers/provider_id](#update-provider)                                          | Update Provider               |
8  | [PUT partners/provider_brands/provider_brand_id](#update-provider-brand)                        | Update Provider Brand         |
9  | [PUT partners/provider_property_types/provider_property_type_id](#update-provider-property-tye) | Update Provider Property Type |
10 | [POST partners/hotels](#create-hotel)                                                           | Create Hotel                  |
11 | [PUT partners/hotels/hotel_id](#update-hotel)                                                   | Update Hotel                  |
12 | [DELETE partners/hotels/hotel_id](#delete-hotel)                                                | Delete Hotel                  |
13 | [POST partners/hotels/update_city_code](#update-city-code-for-hotels)                           | Update City Code For Hotels   |
14 | [POST partners/hotels/update_images](#update-images)                                            | Update Images                 |
15 | [POST partners/hotels/bulk_update](#bulk-update)                                                | Bulk Update                   |
16 | [GET partners/activity](#get-activity)                                                          | Activity                      |

## Autofill

```
GET partners/autofill
```

Parameters

| Property      | Required? | Data Type | Description                     |
| ------------- | --------- | --------- | ------------------------------- |
| provider_code | Yes       | String    | flights or hotels provider code |
| client_id     | Yes       | String    |                                 |
| ts_code       | Yes       | String    |                                 |
| type          | Yes       | String    | `flights` or `hotels`           |

### Example

* `partners/autofill?provider_code=expedia.com&client_id=A9C9E5DD-1B26-4DA9-A0EA-29880A938E41&ts_code=36e3e&type=hotels`

### Response

```
function(people) {
var p1 = people[0];

var phoneCallingCodes = {
  "IL": "972", "AF": "93", "AL": "355", "DZ": "213", "AS": "1684", "AD": "376", "AO": "244", "AI": "1264", "AG": "1268", "AR": "54", "AM": "374", "AW": "297",
  "AU": "61", "AT": "43", "AZ": "994", "BS": "1242", "BH": "973", "BD": "880", "BB": "1246", "BY": "375", "BE": "32", "BZ": "501", "BJ": "229", "BM": "1441",
  "BT": "975", "BA": "387", "BW": "267", "BR": "55", "IO": "246", "BG": "359", "BF": "226", "BI": "257", "KH": "855", "CM": "237", "CA": "1", "CV": "238", "KY": "345",
  "CF": "236", "TD": "235", "CL": "56", "CN": "86", "CX": "61", "CO": "57", "KM": "269", "CG": "242", "CK": "682", "CR": "506", "HR": "385", "CU": "53", "CY": "537",
  "CZ": "420", "DK": "45", "DJ": "253", "DM": "1767", "DO": "1849", "EC": "593", "EG": "20", "SV": "503", "GQ": "240", "ER": "291", "EE": "372", "ET": "251",
  "FO": "298", "FJ": "679", "FI": "358", "FR": "33", "GF": "594", "PF": "689", "GA": "241", "GM": "220", "GE": "995", "DE": "49", "GH": "233", "GI": "350",
  "GR": "30", "GL": "299", "GD": "1473", "GP": "590", "GU": "1671", "GT": "502", "GN": "224", "GW": "245", "GY": "595", "HT": "509", "HN": "504", "HU": "36",
  "IS": "354", "IN": "91", "ID": "62", "IQ": "964", "IE": "353", "IT": "39", "JM": "1876", "JP": "81", "JO": "962", "KZ": "7", "KE": "254", "KI": "686",
  "KW": "965", "KG": "996", "LV": "371", "LB": "961", "LS": "266", "LR": "231", "LI": "423", "LT": "370", "LU": "352", "MG": "261", "MW": "265", "MY": "60",
  "MV": "960", "ML": "223", "MT": "356", "MH": "692", "MQ": "596", "MR": "222", "MU": "230", "YT": "262", "MX": "52", "MC": "377", "MN": "976", "ME": "382",
  "MS": "1664", "MA": "212", "MM": "95", "NA": "264", "NR": "674", "NP": "977", "NL": "31", "AN": "599", "NC": "687", "NZ": "64", "NI": "505", "NE": "227",
  "NG": "234", "NU": "683", "NF": "672", "MP": "1670", "NO": "47", "OM": "968", "PK": "92", "PW": "680", "PA": "507", "PG": "675", "PY": "595", "PE": "51",
  "PH": "63", "PL": "48", "PT": "351", "PR": "1939", "QA": "974", "RO": "40", "RW": "250", "WS": "685", "SM": "378", "SA": "966", "SN": "221", "RS": "381",
  "SC": "248", "SL": "232", "SG": "65", "SK": "421", "SI": "386", "SB": "677", "ZA": "27", "GS": "500", "ES": "34", "LK": "94", "SD": "249", "SR": "597",
  "SZ": "268", "SE": "46", "CH": "41", "TJ": "992", "TH": "66", "TG": "228", "TK": "690", "TO": "676", "TT": "1868", "TN": "216", "TR": "90", "TM": "993",
  "TC": "1649", "TV": "688", "UG": "256", "UA": "380", "AE": "971", "GB": "44", "US": "1", "UY": "598", "UZ": "998", "VU": "678", "WF": "681", "YE": "967",
  "ZM": "260", "ZW": "263", "AX": "", "AQ": "", "BO": "591", "BN": "673", "CC": "61", "CD": "243", "CI": "225", "FK": "500", "GG": "44", "VA": "379", "HK": "852",
  "IR": "98", "IM": "44", "JE": "44", "KP": "850", "KR": "82", "LA": "856", "LY": "218", "MO": "853", "MK": "389", "FM": "691", "MD": "373", "MZ": "258",
  "PS": "970", "PN": "872", "RE": "262", "RU": "7", "BL": "590", "SH": "290", "KN": "1869", "LC": "1758", "MF": "590", "PM": "508", "VC": "1784",
  "ST": "239", "SO": "252", "SJ": "47", "SY": "963", "TW": "886", "TZ": "255", "TL": "670", "VE": "58", "VN": "84", "VG": "1284", "VI": "1340"
};

var name = "";
if (p1.firstName)
  name = p1.firstName + " ";
if (p1.middleName)
  name += p1.middleName + " ";
if (p1.lastName)
  name += p1.lastName;
$('[name="tripPreferencesRequest.hotelTripPreferences.hotelRoomPreferences[0].contactName"]').val(name);
$('#country-code-room-0').val(phoneCallingCodes[p1.phoneNumberCode]);
$('[name="tripPreferencesRequest.hotelTripPreferences.hotelRoomPreferences[0].preferredPhoneNumber"]').val(p1.phoneNumber);
$('[name="email"]').val(p1.email);
}
```
---

## Get Provider Hotel Detail

```
GET partners/provider_hotels/provider_hotel_id
```

Parameters

No | Property     | Required? | Data Type | Description                                                                                          |
---| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
1  | id           | Yes       | Number    | Id of desired provider hotel                                                                         |
2  | language     | No        | String    | The language that the response will be in. En as default                                             |
3  | locale       | No        | String    | The language that the response will be in. En as default                                             |
4  | page         | No        | Number    |                                                                                                      |
5  | perPage      | No        | Number    |                                                                                                      |
6  | keyTransform | No        | String    | underscore                                                                                           |

### Example

* `/partners/provider_hotels/591946`

### Response

```
{
  "id": 591946,
  "hotelId": 34938,
  "providerId": 6,
  "providerPropertyId": "27152",
  "providerLocationId": 78,
  "providerDistrictId": 40451,
  "nameEn": "President Park Bangkok",
  "addressEn": "95 Sukhumvit 24",
  "star": 4,
  "nativeCurrency": "THB",
  "longitude": "100.56553",
  "latitude": "13.72117",
  "timeZone": "Asia/Bangkok",
  "gmtOffset": "7",
  "postalCode": "10110",
  "builtYear": "",
  "renovatedYear": "",
  "checkIn": "14:00",
  "checkOut": "12:00",
  "roomsCount": 238,
  "url": "https://www.booking.com/hotel/th/presidentpark.html",
  "disabledByHuman": 0,
  "activeByImport": 1,
  "matchedBy": 20170101,
  "matchScore": 0.995084
}
```
---

## GET Provider Hotels

```
GET partners/provider_hotels
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | provider_id          | No        | Integer   | Get provider hotels for a specific provider_id            |
2  | provider_property_id | No        | String    | Get provider hotels for a specific provider_property_id   |
3  | language             | No        | String    | The language that the response will be in. En as default  |
4  | locale               | No        | String    | The language that the response will be in. En as default  |
5  | page                 | No        | Number    |                                                           |
6  | perPage              | No        | Number    |                                                           |
7  | keyTransform         | No        | String    | underscore                                                |

### Example

* `/partners/provider_hotels?provider_id=100`

### Response

```
[
  {
    "id": 2550987,
    "hotelId": 371852,
    "providerId": 100,
    "providerPropertyId": "371852",
    "nameEn": "Tulip Inn Sunny Hill",
    "addressEn": "31 A Fagetului Street",
    "star": 4,
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  },
  {
    "id": 2578968,
    "hotelId": 254079,
    "providerId": 100,
    "providerPropertyId": "254079",
    "nameEn": "Parkroyal Saigon Hotel",
    "addressEn": "309B-311 Nguyen Van Troi, Tan Binh District",
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  },
  {
    "id": 2578969,
    "hotelId": 117590,
    "providerId": 100,
    "providerPropertyId": "117590",
    "nameEn": "The Royal Phuket Yacht Club and Puravarna Resort",
    "addressEn": "23/3 Vises Road, Nai Harn Beach",
    "longitude": "98.30313",
    "latitude": "7.77851",
    "postalCode": "83130",
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  }
]
```
---

## GET Provider Locations

```
GET partners/provider_locations
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | provider_id          | Yes       | Integer   | Get provider locations for a specific provider_id         |
2  | location_id          | Yes       | String    | Get provider locations for a specific location_id         |
3  | language             | No        | String    | The language that the response will be in. En as default  |
4  | locale               | No        | String    | The language that the response will be in. En as default  |
5  | keyTransform         | No        | String    | underscore                                                |

### Example

* `/partners/provider_locations?provider_id=100&location_id=6667`

### Response

```
[
  {
    "id": 2378906,
    "locationId": 6667,
    "providerCountryId": 64615,
    "providerId": 100,
    "providerLocationCode": "SIN",
    "nameEn": "Singapore",
    "latitude": "1.35208",
    "longitude": "103.82",
    "providerCountry": {
      "id": 64615,
      "country_id": 197,
      "provider_id": 100,
      "name": "Singapore",
      "code": "SG",
      "created_at": "2017-08-29T08:20:18.000Z",
      "updated_at": "2017-09-04T03:13:09.000Z"
    }
  }
]
```

---

## GET Providers

```
GET partners/providers
```

Parameters

No | Property     | Required? | Data Type | Description                                               |
---| -------------| --------- | --------- | ----------------------------------------------------------|
1  | status       | No        | String    | production/staging/down                                   |
2  | language     | No        | String    | The language that the response will be in. En as default  |
3  | locale       | No        | String    | The language that the response will be in. En as default  |
4  | keyTransform | No        | String    | underscore                                                |

### Example

* `/partners/providers?status=production`

### Response

```
[
  {
    "id": 1,
    "code": "accorhotels.com",
    "name": "Accorhotels.com",
    "url": "http://www.accorhotels.com",
    "providerType": "direct",
    "bucketLookupId": 1,
    "staticDataLookupId": 1,
    "bucketized": false,
    "siteCodes": [
        "*"
    ],
    "noSiteCodes": [
        "EG",
        "IN"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": false,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "breakdown",
    "comments": "",
    "hasDynamicData": false
  },
  {
    "id": 3,
    "code": "asiatravel.com",
    "name": "Asiatravel.com",
    "url": "http://www.asiatravel.com",
    "providerType": "ota",
    "bucketLookupId": 3,
    "staticDataLookupId": 3,
    "bucketized": true,
    "siteCodes": [
        "*"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": true,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "not_provided",
    "comments": "Restricted for mobile on multiple POS via ignore_when, Natalya, 3 Feb 2016",
    "hasDynamicData": false
  },
  {
    "id": 6,
    "code": "booking.com",
    "name": "Booking.com",
    "url": "http://www.booking.com",
    "providerType": "ota",
    "bucketLookupId": 6,
    "staticDataLookupId": 6,
    "bucketized": true,
    "siteCodes": [
        "*"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": true,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "breakdown",
    "comments": "",
    "hasDynamicData": false
  }
]

```

---

## Create Provider

```
POST partners/providers
```

Parameters

No | Property              | Required? | Data Type | Description                                               |
---| ----------------------| --------- | --------- | ----------------------------------------------------------|
1  | parent_id             | No        | Number    | id of parent provider                                     |
2  | code                  | No        | String    | provider code                                             |
3  | name                  | No        | String    | provider name                                             |
4  | url                   | No        | String    | provider url                                              |
5  | provider_type         | No        | String    | ota/direct                                                |
6  | status                | No        | String    | production/staging/down                                   |
7  | mobile                | No        | Boolean   | mobile friendly or not                                    |
8  | local_tax             | No        | String    | total/not provided/break down                             |
9  | comments              | No        | String    |                                                           |
10 | bucket_lookup_id      | No        | String    |                                                           |
11 | static_data_lookup_id | No        | String    |                                                           |
12 | bucketized            | No        | Boolean   |                                                           |
13 | has_dynamic_data      | No        | Boolean   |                                                           |
14 | site_codes            | No        | Array     | supported site_codes                                      |
15 | no_site_codes         | No        | Array     | not supported site_codes                                  |
16 | locales               | No        | Array     | supported locales                                         |
17 | device_types          | No        | Array     | support devices                                           |
18 | whodunnit             | No        | Number    | user id of the user who trigger the action                |


### Example

```
POST partners/providers

{
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":["", "AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["", "*"],
  "status":"staging",
  "mobile":"true",
  "device_types":["", "mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":"",
  "whodunnit":3
}
```

### Response

```
{
  "id": 614
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":[AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["*"],
  "status":"staging",
  "mobile":"true",
  "device_types":[mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":""
}
```

---

## Update Provider

```
PUT partners/providers/provider_id
```

Parameters

No | Property              | Required? | Data Type | Description                                               |
---| ----------------------| --------- | --------- | ----------------------------------------------------------|
1  | parent_id             | No        | Number    | id of parent provider                                     |
2  | code                  | No        | String    | provider code                                             |
3  | name                  | No        | String    | provider name                                             |
4  | url                   | No        | String    | provider url                                              |
5  | provider_type         | No        | String    | ota/direct                                                |
6  | status                | No        | String    | production/staging/down                                   |
7  | mobile                | No        | Boolean   | mobile friendly or not                                    |
8  | local_tax             | No        | String    | total/not provided/break down                             |
9  | comments              | No        | String    |                                                           |
10 | bucket_lookup_id      | No        | String    |                                                           |
11 | static_data_lookup_id | No        | String    |                                                           |
12 | bucketized            | No        | Boolean   |                                                           |
13 | has_dynamic_data      | No        | Boolean   |                                                           |
14 | site_codes            | No        | Array     | supported site_codes                                      |
15 | no_site_codes         | No        | Array     | not supported site_codes                                  |
16 | locales               | No        | Array     | supported locales                                         |
17 | device_types          | No        | Array     | support devices                                           |
18 | whodunnit             | No        | Number    | user id of the user who trigger the action                |


### Example

```
PUT partners/providers/614

{
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":["", "AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["", "*"],
  "status":"staging",
  "mobile":"true",
  "device_types":["", "mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":"",
  "whodunnit":3
}
```

### Response

```
{
  "id": 614
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":[AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["*"],
  "status":"staging",
  "mobile":"true",
  "device_types":[mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":""
}
```

---

## Update Provider Brand

```
PUT partners/provider_brands/provider_brand_id
```

Parameters

No | Property  | Required? | Data Type | Description                                |
---| ----------| --------- | --------- | -------------------------------------------|
1  | brand_id  | No        | Number    | id of matched brand                        |
2  | whodunnit | No        | Number    | user id of the user who trigger the action |


### Example

```
PUT partners/provider_brands/1

{
  "brand_id":305,
  "whodunnit":3
}
```

### Response

```
{
  "id":1,
  "brand_id":305,
  "name_en":"Ibis Hotels",
  "code":"IBH",
  "is_chain":"false",
  "provider_id":"1"
}
```

---

## Update Provider Property Type

```
PUT partners/provider_property_types/provider_property_type_id
```

Parameters

No | Property                   | Required? | Data Type | Description                                |
---| ---------------------------| --------- | --------- | -------------------------------------------|
1  | provider_property_type_id  | No        | Number    | id of matched provider_property_type       |
2  | whodunnit                  | No        | Number    | user id of the user who trigger the action |


### Example

```
PUT partners/provider_property_types/1335

{
  "property_type_id":1,
  "whodunnit":3
}
```

### Response

```
{
  "id":1335,
  "property_type_id":1,
  "name_en":"Hotels",
  "provider_property_type_code":"204",
  "provider_id":"6"
}
```

---
## Create Hotel

```
POST partners/hotels
```

When hotel created is called (mostly from neo), it first need to create a provider_hotel for the hotel first, then it creates a hotel and update back the hotel_id for the provider_hotel created earlier. So client needs to form params for both hotels and provider_hotels.

Hotel Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
1  | address                 | No        | Hash      | address as a hash of locale and translation      |
2  | description             | No        | Hash      | description as a hash of locale and translation  |
3  | star                    | No        | String    |                                                  |
4  | native_currency         | No        | String    |                                                  |
5  | longitude               | No        | Float     |                                                  |
6  | latitude                | No        | Float     |                                                  |
7  | built_year              | No        | String    |                                                  |
8  | renovated_year          | No        | String    |                                                  |
9  | source                  | No        | String    |                                                  |
10 | time_zone               | No        | String    |                                                  |
11 | gmt_offset              | No        | String    |                                                  |
12 | postal_code             | No        | String    |                                                  |
13 | email                   | No        | String    |                                                  |
14 | yearly_closures         | No        | String    |                                                  |
15 | reservation_phone       | No        | String    |                                                  |
16 | phone_1                 | No        | String    |                                                  |
17 | phone_2                 | No        | String    |                                                  |
18 | phone_3                 | No        | String    |                                                  |
10 | fax                     | No        | String    |                                                  |
11 | check_in                | No        | String    |                                                  |
12 | check_out               | No        | String    |                                                  |
13 | accessible_rooms_count  | No        | Number    |                                                  |
14 | non_smoking_rooms_count | No        | Number    |                                                  |
15 | rooms_count             | No        | Array     |                                                  |
16 | suites_count            | No        | Number    |                                                  |
17 | floors_count            | No        | Number    |                                                  |
18 | url                     | No        | String    |                                                  |
10 | url_params              | No        | String    |                                                  |

Provider Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
1  | address                 | No        | Hash      | address as a hash of locale and translation      |
2  | description             | No        | Hash      | description as a hash of locale and translation  |
3  | star                    | No        | String    |                                                  |
4  | native_currency         | No        | String    |                                                  |
5  | longitude               | No        | Float     |                                                  |
6  | latitude                | No        | Float     |                                                  |
7  | built_year              | No        | String    |                                                  |
8  | renovated_year          | No        | String    |                                                  |
9  | source                  | No        | String    |                                                  |
10 | time_zone               | No        | String    |                                                  |
11 | gmt_offset              | No        | String    |                                                  |
12 | postal_code             | No        | String    |                                                  |
13 | email                   | No        | String    |                                                  |
14 | yearly_closures         | No        | String    |                                                  |
15 | reservation_phone       | No        | String    |                                                  |
16 | phone_1                 | No        | String    |                                                  |
17 | phone_2                 | No        | String    |                                                  |
18 | phone_3                 | No        | String    |                                                  |
10 | fax                     | No        | String    |                                                  |
11 | check_in                | No        | String    |                                                  |
12 | check_out               | No        | String    |                                                  |
13 | accessible_rooms_count  | No        | Number    |                                                  |
14 | non_smoking_rooms_count | No        | Number    |                                                  |
15 | rooms_count             | No        | Array     |                                                  |
16 | suites_count            | No        | Number    |                                                  |
17 | floors_count            | No        | Number    |                                                  |
18 | url                     | No        | String    |                                                  |
10 | url_params              | No        | String    |                                                  |


Provider Related Params

No | Property               | Required? | Data Type | Description                                       |
---| -----------------------| --------- | --------- | --------------------------------------------------|
1  | provider_country       | No        | Hash      | To update/create country for provider_hotel       |
2  | provider_location      | No        | Hash      | To update/create location for provider_hotel      |
3  | provider_district      | No        | Hash      | To update/create country for provider_hotel       |
4  | provider_property_type | No        | Hash      | To update/create property_type for provider_hotel |
5  | provider_brand         | No        | Hash      | To update/create brand for provider_hotel         |
6  | provider_themes        | No        | String    | To update/create themes for provider_hotel        |
7  | provider_amenities     | No        | String    | To update/create amenities for provider_hotel     |


### Example

```
POST partners/hotels

{
  "name":"{\"en\""\"Silat Hostel\"}",
  "address":"{\"en\""\"150 Silat Ave #01-34\"}",
  "former_name":"{\"en\""\"Hostel at Silat\"}",
  "latitude":1.276767,
  "longitude":103.831342,
  "star":"2.0",
  "city_code":"SIN",
  "name_en":"Silat Hostel",
  "amenity_ids":"[1,2]",
  "theme_ids":[1, 2],
  "district_id":"724",
  "brand_id":"146",
  "check_in":"14"00"00",
  "check_out":"12"00"00",
  "postal_code":"160150",
  "description":"{\"en\""\"Nice Hotels at Silat Avenue\"}",
  "property_type_id":"2",
  "floors_count":"5",
  "rooms_count":"10",
  "built_year":"2005",
  "renovated_year":"1010",
  "reservation_phone":"84078313",
  "create_provider_hotel":true,
  "whodunnit":3,
  "provider_hotel": {
    "provider_id":100,
    "provider_country":{"country_id":197, "name":"Singapore", "code":"SG"},
    "provider_location":{"location_id":6667, "name":{"en":"Singapore"}, "provider_location_code":"SIN"},
    "provider_brand":{"brand":{"name":{"en":"Hotels and Preference"}, "brand_id":146}},
    "provider_district":{"district_id":724, "name":{"en":"Chinatown"}, "provider_district_code":724},
    "provider_property_type":{"name":{"en":"Hostel / Backpacker"}, "provider_property_type_code":2, "property_type_id":2 },
    "name":{"en"":"Silat Hostel"},
    "address":{"en"":"150 Silat Ave #01-34"},
    "former_name":{"en"":"Hostel at Silat"},
    "description":{"en"":"Nice Hotels at Silat Avenue"},
    "latitude":1.276767,
    "longitude":103.831342,
    "floors_count":"5",
    "rooms_count":"10",
    "built_year":"2005",
    "renovated_year":"1010",
    "reservation_phone":"84078313",
    "star":"2.0",
    "check_in":"14"00"00",
    "check_out":"12"00"00",
    "postal_code":"160150",
    "provider_amenities":"[1,2]",
    "provider_themes":[1, 2],
    "provider_property_id":"5bf6fe30-46bc-0136-1318-705681ae2afd"
  }
}

```

### Response

```
{
  "id":1985691,
  "name":"{\"en\":\"Silat Hostel\"}",
  "address":"{\"en\":\"150 Silat Ave #01-34\"}",
  "former_name":"{\"en\":\"Hostel at Silat\"}",
  "city_code":"SIN",
  "district_id":724,
  "brand_id":146,
  "latitude":"1.276767",
  "longitude":"103.831342",
  "star":2,
  "check_in":"14:00:00",
  "check_out":"12:00:00",
  "postal_code":"160150",
  "description":"{\"en\":\"Nice Hotels at Silat Avenue\"}",
  "property_type_id":2,
  "floors_count":5,
  "rooms_count":10,
  "built_year":"2005",
  "renovated_year":"1010",
  "reservation_phone":"84078313",
  "create_provider_hotel":true,
  "name_en":"Silat Hostel",
  "amenity_ids":"[1,2]",
  "theme_ids":[1, 2],
  "permalink":"silat-hostel-1985691",
  "live":false
}
```

---

## Update Hotel

```
PUT partners/hotels/hotel_id
```

When hotel update is called, it does not directly update the hotel record but update the corresponding provider_hotel record of that hotel with provider_id = 100 (this is what we call Wego provider_hotel). Then hotel syncing is called to sync provider_hotels data to hotels table. Paramenters for updating provider_hotel:

Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
3  | address                 | No        | Hash      | address as a hash of locale and translation      |
4  | description             | No        | Hash      | description as a hash of locale and translation  |
5  | star                    | No        | String    |                                                  |
6  | native_currency         | No        | String    |                                                  |
7  | longitude               | No        | Float     |                                                  |
8  | latitude                | No        | Float     |                                                  |
9  | built_year              | No        | String    |                                                  |
10 | renovated_year          | No        | String    |                                                  |
11 | source                  | No        | String    |                                                  |
12 | time_zone               | No        | String    |                                                  |
13 | gmt_offset              | No        | String    |                                                  |
14 | postal_code             | No        | String    |                                                  |
15 | email                   | No        | String    |                                                  |
16 | yearly_closures         | No        | String    |                                                  |
17 | reservation_phone       | No        | String    |                                                  |
18 | phone_1                 | No        | String    |                                                  |
19 | phone_2                 | No        | String    |                                                  |
20 | phone_3                 | No        | String    |                                                  |
21 | fax                     | No        | String    |                                                  |
22 | check_in                | No        | String    |                                                  |
23 | check_out               | No        | String    |                                                  |
24 | accessible_rooms_count  | No        | Number    |                                                  |
25 | non_smoking_rooms_count | No        | Number    |                                                  |
26 | rooms_count             | No        | Array     |                                                  |
27 | suites_count            | No        | Number    |                                                  |
28 | floors_count            | No        | Number    |                                                  |
29 | url                     | No        | String    |                                                  |
30 | url_params              | No        | String    |                                                  |


Related Params

No | Property               | Required? | Data Type | Description                                       |
---| -----------------------| --------- | --------- | --------------------------------------------------|
1  | provider_country       | No        | Hash      | To update/create country for provider_hotel       |
2  | provider_location      | No        | Hash      | To update/create location for provider_hotel      |
3  | provider_district      | No        | Hash      | To update/create country for provider_hotel       |
4  | provider_property_type | No        | Hash      | To update/create property_type for provider_hotel |
5  | provider_brand         | No        | Hash      | To update/create brand for provider_hotel         |
6  | provider_themes        | No        | String    | To update/create themes for provider_hotel        |
7  | provider_amenities     | No        | String    | To update/create amenities for provider_hotel     |


### Example

```
PUT partners/hotels/258074

{
  "provider_hotel": {
    "provider_id":100,
    "provider_country":
      {
        "country_id":197,
        "name":"Singapore",
        "code":"SG"
      },
    "provider_location": 
      {
        "location_id":6667
        "name": {"en":"Singapore"},
        "provider_location_code":"SIN"
      },
    "provider_property_id":258074",
    "hotel_id":"258074",
    "renovated_year:"2000",
    "provider_themes":"[1, 5],
    "whodunnit":3
  }
}
```

### Response

```
{
  "id":258074,
  "district_id":721,
  "city_code":"SIN",
  "name":"{\"en\":\"Village Hotel Changi\"}",
  "address":"{\"en\":\"1 Netheravon Road\"}",
  "description":nil,
  "amenity_ids":"[]",
  "floors_count":nil,
  "rooms_count":380,
  "suites_count":nil,
  "accessible_rooms_count":nil,
  "non_smoking_rooms_count":nil,
  "star":4,
  "longitude":"103.986",
  "latitude":"1.39054",
  "native_currency":"SGD",
  "time_zone":"Asia/Singapore",
  "gmt_offset":"8",
  "postal_code":"508502",
  "website":nil,
  "email":nil,
  "built_year":nil,
  "renovated_year":"2000",
  "yearly_closures":nil,
  "reservation_phone":nil,
  "phone_1":nil,
  "phone_2":nil,
  "phone_3":nil,
  "fax":nil,
  "check_in":"14:00:00",
  "check_out":"12:00:00",
  "created_at":"2016-12-11T20:09:33.000Z",
  "updated_at":"2018-05-31T02:25:53.000Z",
  "brand_id":392,
  "property_type_id":2
}
```

---

## Delete Hotel

```
DELETE partners/hotels/hotel_id
```

Params

No | Property                | Required? | Data Type | Description                       |
---| ------------------------| --------- | --------- | ----------------------------------|
1  | whodunnit               | No        | Hash      | id of user who trigger the action |

### Example

```
DELETE partners/hotels/1985691
{
  whodunnit: 3
}

```

### Response

```
status: 200
```
---

## Update city_code for Hotels

This endpoint is called from ```place-services``` in a callback of a city instance when its code changed. Let say when code of a city changes, city_code for hotels in that city need to be changed accordingly. That's when ```place-services``` sends a request to this endpoint to update city_code of hotels

```
POST partners/hotels/update_city_code
```

Params

No | Property                | Required? | Data Type | Description                       |
---| ------------------------| --------- | --------- | ----------------------------------|
1  | old_city_code           | No        | String    | Update hotels of this city_code   |
2  | district_id             | No        | Number    | Update hotels of this district_id |
3  | new_city_code           | Yes       | Stirng    | New city_code of hotels           |

### Example

```
POST partners/hotels/update_city_code
{
  old_city_code: "12345",
  new_city_code: "THD"
}

```

### Response

```
status: 200
```
---

## Update Images

In images syncing, we do not want lambda to save images directly to the db so it will do that via this endpoint.

```
POST partners/hotels/update_images
```

Params

Its an array of images, each has the following params:

No | Property    | Required? | Data Type | Description           |
---|-------------|-----------|-----------|-----------------------|
1  | id          | No        | String    | Image id              |
2  | url         | No        | String    | Image url             |
3  | description | No        | String    | Image Description     |
4  | hotel_id    | No        | Number    | id of image hotel     |
5  | primary     | No        | Boolean   | Primary image or not  |
6  | width       | No        | Number    | Image width           |
7  | height      | No        | Number    | Image height          |
8  | phash       | No        | String    | Image phash           |
9  | score       | No        | Number    | Image score           |
10 | source      | No        | String    | Image provider        |


### Example

```
POST partners/hotels/update_city_code
{
  images: [
    { id: 57169, url: "https://res.cloudinary.com/wego/image/upload/v1488816283/Partner/hotels/20903/57169.jpg", hotel_id: 20903 }
    { id: 88487, url: "https://res.cloudinary.com/wego/image/upload/v1488572432/Partner/hotels/769537/88487.jpg", hotel_id: 769537 }
    { id: 98453, url: "https://res.cloudinary.com/wego/image/upload/v1489349579/Partner/hotels/480931/98453.jpg", hotel_id: 480931 }
  ]
}

```

### Response

```
status: 200
```
---

## Bulk Update

Sometimes we want to update attributes for a bunch of hotels (mostly by the means of uploading csv file from neo). This endpoint is for that purpose

```
POST partners/hotels/bulk_update
```

Params

Its an array of hotel attributes:

No | Property    | Required? | Data Type | Description           |
---|-------------|-----------|-----------|-----------------------|
1  | id          | No        | String    | id of hotel to update |
2  | city_code   | No        | String    | updated city_code     |
3  | district_id | No        | Number    | updated district_id   |
4  | brand_id    | No        | Number    | updated brand_id      |
5  | name        | No        | String    | updated name          |
6  | locale      | No        | String    | locale for name       |

### Example

```
POST partners/hotels/bulk_update
{
  hotels: [
    { id: 1, district_id: 2 }
    { id: 2, district_id: 2 }
    { id: 3, district_id: 2 }
  ]
}

```

### Response

```
{
  success: [
    '1: Sucessfully updated',
    '2: Sucessfully updated',
    '3: Sucessfully updated'
  ]
}
```
---

## GET Activity

```
GET partners/activity
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | locale               | Yes       | String    | User selected locale                                      |
2  | site_code            | Yes       | String    | User selected site_code                                   |
3  | currency_code        | No        | String    | User selected currency                                    |
4  | keyTransform         | No        | String    | Default camelCase. Can be underscore                      |

### Example

* `partners/activity?locale=en&site_code=SG&currency=AUD`

### Response

```
{
  "providerCode": "getyourguide.com",
  "deeplinkUrl": "https://www.getyourguide.com?partner_id=OKVBRN8&currency=AUD"
}
```

---


# Wego Stories Services API

**<span style="color:	#7cb9e8"> [Stories](/stories/services/stories.md) </span>** <br />
Get stories by locale, site code, search and user id.

**<span style="color:	#7cb9e8	">[Bookmarks](/stories/services/bookmarks.md)</span>**<br />
Create, delete and get bookmarks of users.

# Stories Api

| Type  | Endpoint                                                 | Description     |
| ----- | -------------------------------------------------------- | --------------- |
| GET   | [/story/v1/stories](#list-stories)                       | List Stories    |
| GET   | [/story/v1/stories/:story_id](#get-story-by-id)          | Get Story by ID |



## List Stories

```GET story/v1/stories```

### Logic

1. Stories returned are sorted by `created_at` in `DESC` order (i.e. lastest story will appear at the top of the list).
2. Stories will only have `bookmark_id` for valid `access_token` and `user_id_hash`

### Parameters

| Property      | Required? | Data Type | Description                                                                                   |
| ------------- | --------- | --------- | --------------------------------------------------------------------------------------------- |
| locale        | No        | String    | Story's locale is based on the blog source (e.g. story from blog.wego.com locale will be `en`)|
| search        | No        | String    | Search within stories title and categories name |
| site_code     | No        | String    | Accept only one site code. Allow `*` as value to retrieve stories regardless of site code     | 
| page          | No        | String    | Offset number. Default 1 |
| per_page      | No        | String    | number to return. Default 10 |

### Request Headers
| Property        | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| X-User-ID-Hasd  | Yes       | String    | user id_hash                              |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

```
Request: story/v1/stories?locale=en&site_code=us&search=travel&page=1&per_page=2

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>

```

#### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
[
    {
        "id": 1,
        "title": "Travel Post",
        "excerpt": "Overseas trip.",
        "url": "https://blog.wego.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 5
    },
    {
        "id": 2,
        "title": "Big Ben",
        "excerpt": "London.",
        "url": "https://external.source.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/external/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 8,
        "favicon_url": "https://external.source.com/favicon.ico",
        "source_name": "External Source"
    }
]
```

#### Notice

1. Responses with `favicon_url` and `source_name` indicate stories from external sources.

___

## Get Story by ID

```GET story/v1/stories/:story_id```

### Example

```story/v1/stories/10```

#### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
[
    {
        "id": 10,
        "title": "Travel Post",
        "excerpt": "<p>Overseas trip.</p>",
        "url": "https://blog.wego.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 1
    }
]
```

___

# Bookmarks Api

| Type   | Endpoint                                                   | Description         |
| -----  | ---------------------------------------------------------- | ------------------- |
| GET    | [/story/v1/bookmarks](#create-bookmark)                    | List Bookmarked Stories   |
| POST   | [/story/v1/bookmarks](#create-bookmark)                    | Create Bookmarks    |
| DELETE | [/story/v1/bookmarks/:story_id](#delete-bookmark)          | Delete Bookmarks    |

## List Bookmarked Stories

```
GET /story/v1/bookmarks?page=<page>&per_page=<per_page>
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Get list of stories bookmarked.

### Parameters

| Property      | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| page      | Optional       | Integer   | page number                                 |
| per_page      | Optional       | Integer   | result per page default 10                                 |


### Request Headers
| Property        | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| X-User-ID-Hash  | Yes       | String    | user `id_hash`                              |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

``` 
Request: story/v1/bookmarks?page=1&per_page=10

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>
```

### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
{
  [
    {
        "id": 34,
        "title": "Think Food Hunting Is the Best Part Of Travelling? Try Our 6 Tips to Find and Enjoy Good Street Food Anywhere",
        "excerpt": "Food remains the foundation of society in so many ways. Families gather together, friendships are formed, and lovers unite all over a meal. Regardless of where you might find yourself in the world, the most basic form of cultural exchange occurs on the gastronomical level. Everyone knows the power of bonding with a stranger over […]\n",
        "url": "https://blog.wego.com/?p=26466",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/v1563348837/shutterstock_159755636_k0bija.jpg",
        "favicon_url": null,
        "source_name": null,
        "url_hash": "b7a8eddec01c1c17a47f60762730e566",
        "created_at": "2019-07-17T09:45:00.000Z",
        "bookmark_id": 226
    },
    {
        "id": 40,
        "title": "8 Things That Will Definitely Send Any Traveller into SERIOUS Panic Mode (And How to Fix Them!)",
        "excerpt": "For many of us, the word “travel” conjures up images of adventure and excitement. We imagine ourselves jetting off into the sunset to some far-off destination with our best mates (or alone!) for a relaxing getaway. The anticipation and enjoyment of all the fun that comes along with our travels often make our trips abroad […]\n",
        "url": "https://blog.wego.com/?p=26593",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/v1563779663/shutterstock_793653961_qsseyd.jpg",
        "favicon_url": null,
        "source_name": null,
        "url_hash": "82bc162b18ba7d723c60e327916eccc8",
        "created_at": "2019-07-22T07:21:35.000Z",
        "bookmark_id": 225
    }
 ]
}
```

___


## Create Bookmark

```
POST /story/v1/bookmarks
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Required parameters are by database level validation. Not application validation.
2. `story_id` and `user_id` has to be unique combination.

### Parameters

| Property      | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| story_id      | Yes       | Integer   | story id                                  |

### Request Headers
| Property        | Required? | Data Type | Description                               |
| X-User-ID-Hash  | Yes       | String    | user `id_hash`                             |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

``` 
Request: story/v1/bookmarks

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>
```

#### Example Request Body

``` JSON
{
    "story_id": 1
}
```

### Response

``` text
HTTP/1.1 201 Created
```

``` JSON
{
    "id": 1,
    "story_id": 1
}
```

___

## Delete Bookmark

```
DELETE /story/v1/bookmarks/:story_id
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Return status 200 ok if delete successful
2. Return status 401 Unauthorised if verification fails
2. Return status 404 Not Found if bookmark does not exist

### Example

```
Request: story/v1/bookmarks/1

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>

```

### Response

#### Successful

``` text
HTTP/1.1 200 OK
```

#### Unauthorized

``` text
HTTP/1.1 401 Unauthorized
```

#### Bookmark does not exist

``` text
HTTP/1.1 404 Not Found
```

___




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


### Objectives

The objectives of this document are to provide an overarching design for each region as well as the implementation in more detail. With this design, we can spin up our stack in the new region easily with few changes such as region name, CIDR, number of nodes for each service. DNS for the proxy which will be the only entry point of our system.

This document has 3 main sections:

1. Overview - which will provide high level design including different components such as builders, databases, services (metasearch, places, hotels, flights, autocomplete, handoff services, kong, konga) and how they are related to each others.
2. Design principles and basic concepts - will explain the key principle that we will follow and making any design decision in term of security, simplicity, modularity, scalability and performance followed with some basic concepts that we are using in this document such NAT, IGW, VPC and more.
3. Design in detail and implementation - will explain in detail for each component and that will be the input when writing terraform script.

### Overview

![ img ](https://lh3.googleusercontent.com/f3x97Iy3FJBi_prnUnFWOGkC3GDsUQ_GAOUKgqKnEu8HxQTuwDeVftRf3AwF57_WwUA_vegbSiaBpkTWriwDQv2NTdSiLP915M6NMc8jcxWHX4pbjL9DWGdPxmXUBQGS4LIBVhHX=w624-h493-no)

For each region, we will have 4 VPCs.

Services VPC will be the public-facing entry point for Wego users. It will have an ELB in the public subnet to forward requests to internal-facing services in private subnet (metasearch flights and hotels, various microservices etc.). Those services will then process the requests and return the response.

Blackhole VPC provides another public-facing entry point. Its main purpose is to provide SSH access via bastion hosts to the private network for administrative purposes. This will be used by Wego engineers.

Builders VPC is used to automate the build and release process. Jenkins instances in builders VPC will build application artifacts. Deployer (Spinnaker) instances will bake AMIs and deploy them.

Databases VPC will contain data stores such as RDS (relational DB), ElastiCache (Redis) and Elasticsearch instances. It peers with services VPC to allow access to the data layer.

### Basic Concepts

As noted in the AWS docs, there are [various types](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenarios.html) of VPCs we can implement. For our case, we will be implementing [VPCs with Public and Private Subnets (NAT)](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html).

Before we delve deeper into the VPC blueprint, we need to get acquainted with some networking terminology:

An **Internet Gateway** (IGW) allows resources within your VPC to access the Internet, and vice versa. In order for this to happen, there must be a routing table entry allowing a subnet to access IGW. That subnet is called a **public subnet**. On the other hand, if a subnet has a routing table entry to access a NAT Gateway, that subnet is called a **private subnet.**

A **NAT Gateway** does something similar, but with two main differences:

- It allows resources in a private subnet to access the Internet (think software updates, external DB connections, wget calls etc.).
- It only works one way. The internet at large cannot get through your NAT unless you explicitly allow it.

#### Blueprint for VPC with public and private subnets (NAT)

![img](/Users/yeer/Downloads/vpc-blueprint.png)

The configuration for this blueprint includes the following:

- A VPC with a size /16 IPv4 CIDR block (e.g. 10.0.0.0/16)

- A public subnet with a size /24 IPv4 CIDR block (e.g. 10.0.0.0/24)

- A private subnet with a size /24 IPv4 CIDR block (e.g. 10.0.1.0/24)

- An Internet gateway

- A NAT gateway

- Instances in private subnet

- Instances in public subnet

- Route table associated with public subnet

  - Contains entry to enable instances in subnet to access internet via IGW
  - Contains entry to enable instances in subnet to communicate with other instances in VPC

- Route table associated with private subnet

  - Contains entry to enable instances in subnet to send requests to the Internet through NAT gateway
  - Contains entry to enable instances in subnet to communicate with other instances in VPC
  - Contains entry to enable instances in subnet to communicate with another VPC (VPC peering)

### Design Principles

#### Security

As security groups are the first line of defense for our EC2 instances, we follow the principle of least privilege by being extremely restrictive of what ports are open to all incoming connections. In general, if you use ELBs, ALBs or other load balancing, the only ports that need to be open to incoming traffic would be port 22 (for SSH access) and whatever port your application uses. Security groups access policy is 'deny by default'.

Consider using other security groups as sources for security group rules instead of using CIDRs — that way, all hosts in the source security group and only hosts in that security group are allowed access. This is a much more dynamic and secure way of managing security group rules.

Refer to this document for more detail: https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf

#### Modularity

VPCs provide logical isolation for your AWS resources. When it comes to choosing whether to group resources into a VPC or not, we follow these guidelines:

- Do they perform the same nature of tasks?
- Do they communicate with each other often? Please note that data transfer between VPCs are not free.
- Are they either internal-facing or public-facing? Internal-facing and public-facing resources may require [different VPC topologies](https://aws.amazon.com/answers/networking/aws-single-vpc-design/).

For each VPC, we will have two versions - one for staging environment and one for production environment.

When choosing CIDR blocks for subnets, please take care not to overlap them within the region and between existing regions (if you have more than one region). 

#### Fault-Tolerance

To achieve fault-tolerance, we span each VPC over multiple Availability Zones (AZs). This should not be an afterthought, and must be baked right in when designing the VPC topology.

References:

https://medium.com/aws-activate-startup-blog/practical-vpc-design-8412e1a18dcc

https://aws.amazon.com/answers/networking/aws-single-vpc-design/

https://www.softnas.com/wp/blog-aws-vpc-best-practices/

### Detailed Design and Implementation

#### CIDR Blocks

**General structure**

Staging VPC: 10.XX0.0.0/16:

- Public subnet (AZ A): 10.XX0.11.0/24
- Public subnet (AZ B): 10.XX0.12.0/24
- Private subnet (AZ A): 10.XX0.1.0/24
- Private subnet (AZ B): 10.XX0.2.0/24

Production VPC: 10.XX.0.0/16:

- Public subnet (AZ A): 10.XX.11.0/24
- Public subnet (AZ B): 10.XX.12.0/24
- Private subnet (AZ A): 10.XX.1.0/24
- Private subnet (AZ B): 10.XX.2.0/24

XX can be any number from 00 to 25 as long as they don’t clash with existing CIDR blocks among all regions. Currently, the CIDR blocks used in SG region are:

| builders-vpc-production      | 10.20.0.0/16  |      |
| ---------------------------- | ------------- | ---- |
| production-vpc               | 10.0.0.0/16   |      |
| metasearch-vpc-production    | 10.10.0.0/16  |      |
| proxies-vpc-staging          | 10.180.0.0/16 |      |
| micro-srv-vpc-staging        | 10.150.0.0/16 |      |
| wego-lambda-vpc              | 10.0.0.0/16   |      |
| proxies-vpc-production       | 10.18.0.0/16  |      |
| proxies-admin-vpc-production | 10.19.0.0/16  |      |
| builders-vpc-staging         | 10.250.0.0/16 |      |
| sap-vpc                      | 10.8.0.0/16   |      |
| vpn                          | 10.8.0.0/16   |      |
| proxies-admin-vpc-staging    | 10.190.0.0/16 |      |
| micro-srv-vpc-production     | 10.50.0.0/16  |      |
| meta-stg-vpc-staging         | 10.100.0.0/16 |      |
| databases-vpc-staging        | 10.160.0.0/16 |      |
| databases-vpc-production     | 10.16.0.0/16  |      |

For the Mumbai region, we follow a simple way to decide the IP ranges for each VPC. Since we have 4 VPCs, we start XX at 11 and increment it until we reach XX = 14.

#### Services VPC

![img](https://lh5.googleusercontent.com/owRHqqkIUGixh3khzUpGt3wSxqwwSZ5_TngtJye94D_A8qCoGkeu7FlByHW2EJsoQz13IQmvxMAJ7k-YBhAEfl6pESH_cShWq074RRjENM0m_GNuOMHXeeoug5TXotHxlbksFmFd)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.110.11.0/24 | 10.110.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.110.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.110.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.110.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.11.11.0/24  | 10.11.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.11.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.11.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.11.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.210.11.0/24 | 10.210.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.210.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.210.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.210.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.21.11.0/24  | 10.21.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.21.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.21.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.21.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target** |
| --------------- | -------------- | ---------- | ---------- |
| 10.110.0.0/16   | ap-south-1     | staging    | local      |
| 10.11.0.0/16    | ap-south-1     | production |            |
| 10.210.0.0/16   | ap-southeast-1 | staging    |            |
| TODO            | ap-southeast-1 | production |            |
| 0.0.0.0/0       |                |            | igw-id     |

Private subnet:

| **Destination**                                    | **Target**                    |
| -------------------------------------------------- | ----------------------------- |
| 10.110.0.0/16 (staging)OR10.11.0.0/16 (production) | local                         |
| 0.0.0.0/0                                          | nat-gateway-id                |
| 10.120.0.0/16 (staging)OR10.12.0.0/16 (production) | services-databases-vpc-pcx-id |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | services-builders-vpc-pcx-id  |

| **Destination** | **Region**     | **Env**    | **Target**                    |
| --------------- | -------------- | ---------- | ----------------------------- |
| 10.110.0.0/16   | ap-south-1     | staging    | local                         |
| 10.11.0.0/16    | ap-south-1     | production |                               |
| 10.210.0.0/16   | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 10.120.0.0/16   | ap-south-1     | staging    | services-databases-vpc-pcx-id |
| 10.12.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 10.130.0.0/16   | ap-south-1     | staging    | services-builders-vpc-pcx-id  |
| 10.13.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 0.0.0.0/0       |                |            | nat-gateway-id                |

**Security Groups**

Inbound rules for proxies ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for proxies ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies:

| Protocol | Port range | Source            |
| -------- | ---------- | ----------------- |
| tcp      | 22         | builders-sg-id    |
| tcp      | 8000       | proxies-elb-sg-id |

Outbound rules for proxies:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies admin ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for proxies admin ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for proxies admin:

| Protocol | Port range | Source                  |
| -------- | ---------- | ----------------------- |
| tcp      | 22         | builders-sg-id          |
| tcp      | 8010       | proxies-admin-elb-sg-id |

Outbound rules for proxies admin:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for ALB:

| Protocol | Port range | Source        |
| -------- | ---------- | ------------- |
| tcp      | 80         | proxies-sg-id |

Outbound rules for ALB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for metasearch services:

| Protocol | Port range            | Source         |
| -------- | --------------------- | -------------- |
| tcp      | 22                    | builders-sg-id |
| tcp      | [Java app port range] | alb-sg-id      |

Outbound rules for metasearch services:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for microservices:

| Protocol | Port range             | Source         |
| -------- | ---------------------- | -------------- |
| tcp      | 22                     | builders-sg-id |
| tcp      | [Rails app port range] | alb-sg-id      |

Outbound rules for microservices:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for Redis cluster:

| Protocol | Port range         | Source           |
| -------- | ------------------ | ---------------- |
| tcp      | 22                 | builders-sg-id   |
| tcp      | [Redis port range] | metasearch-sg-id |

Outbound rules for Redis cluster:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Databases VPC

![img](/Users/yeer/Downloads/database-vpc.png)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.120.11.0/24 | 10.120.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.120.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.120.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.120.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.12.11.0/24  | 10.12.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.12.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.12.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.12.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.160.11.0/24 | 10.160.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.160.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.160.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.160.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.16.11.0/24  | 10.16.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.16.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.16.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.16.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target** |
| --------------- | -------------- | ---------- | ---------- |
| 10.120.0.0/16   | ap-south-1     | staging    | local      |
| 10.12.0.0/16    | ap-south-1     | production |            |
| 10.160.0.0/16   | ap-southeast-1 | staging    |            |
| 10.16.0.0/16    | ap-southeast-1 | production |            |
| 0.0.0.0/0       |                |            | igw-id     |

Private subnet:

| **Destination** | **Region**     | **Env**    | **Target**                    |
| --------------- | -------------- | ---------- | ----------------------------- |
| 10.120.0.0/16   | ap-south-1     | staging    | local                         |
| 10.12.0.0/16    | ap-south-1     | production |                               |
| 10.160.0.0/16   | ap-southeast-1 | staging    |                               |
| 10.16.0.0/16    | ap-southeast-1 | production |                               |
| 10.110.0.0/16   | ap-south-1     | staging    | services-databases-vpc-pcx-id |
| 10.11.0.0/16    | ap-south-1     | production |                               |
| TODO            | ap-southeast-1 | staging    |                               |
| TODO            | ap-southeast-1 | production |                               |
| 0.0.0.0/0       | ap-southeast-1 |            | nat-gateway-id                |

**Security Groups**

Inbound rules for Elasticsearch instances:

| Protocol | Port range | Source              |
| -------- | ---------- | ------------------- |
| tcp      | 443        | microservices-sg-id |

Outbound rules for Elasticsearch instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for ElastiCache (Redis) instances:

| Protocol | Port range | Source           |
| -------- | ---------- | ---------------- |
| tcp      | 6379       | metasearch-sg-id |

Outbound rules for ElastiCache (Redis) instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for RDS (MySQL) instances:

| Protocol | Port range | Source     |
| -------- | ---------- | ---------- |
| tcp      | MySQL port | 10.0.0.0/8 |

Inbound rules for RDS (Postgres) instances:

| Protocol | Port range    | Source     |
| -------- | ------------- | ---------- |
| tcp      | Postgres port | 10.0.0.0/8 |

Outbound rules for all RDS instances:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Builders VPC

![img](/Users/yeer/Downloads/builder-vpc.png)

**VPC CIDR Blocks**

Staging VPC: 10.130.0.0/16:

- Public subnet (AZ A): 10.130.11.0/24
- Public subnet (AZ B): 10.130.12.0/24
- Private subnet (AZ A): 10.130.1.0/24
- Private subnet (AZ B): 10.130.2.0/24

Production VPC: 10.13.0.0/16

- Public subnet (AZ A): 10.13.11.0/24
- Public subnet (AZ B): 10.13.12.0/24
- Private subnet (AZ A): 10.13.1.0/24
- Private subnet (AZ B): 10.13.2.0/24

**Route Tables**

Public subnet:

| **Destination**                                    | **Target** |
| -------------------------------------------------- | ---------- |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | local      |
| 0.0.0.0/0                                          | igw-id     |

Private subnet:

| **Destination**                                    | **Target**                    |
| -------------------------------------------------- | ----------------------------- |
| 10.130.0.0/16 (staging)OR10.13.0.0/16 (production) | local                         |
| 0.0.0.0/0                                          | nat-gateway-id                |
| 10.110.0.0/16 (staging)OR10.11.0.0/16 (production) | services-builders-vpc-pcx-id  |
| 10.140.0.0/16 (staging)OR10.14.0.0/16 (production) | blackhole-builders-vpc-pcx-id |

**Security Groups**

Inbound rules for builders ELB:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 443        | 0.0.0.0/0 |

Outbound rules for builders ELB:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Inbound rules for builders:

| Protocol | Port range | Source             |
| -------- | ---------- | ------------------ |
| tcp      | 22         | blackhole-sg-id    |
| tcp      | 8080       | builders-elb-sg-id |

Outbound rules for builders:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

#### Blackhole VPC

![img](/Users/yeer/Downloads/blackhole-vpc.png)

**VPC CIDR Blocks**

| Region         | Env        | Subnet                | Subnet CIDR    | VPC CIDR      |
| -------------- | ---------- | --------------------- | -------------- | ------------- |
| ap-south-1     | staging    | Public subnet (AZ A)  | 10.140.11.0/24 | 10.140.0.0/16 |
| ap-south-1     | staging    | Public subnet (AZ B)  | 10.140.12.0/24 |               |
| ap-south-1     | staging    | Private subnet (AZ A) | 10.140.1.0/24  |               |
| ap-south-1     | staging    | Private subnet (AZ B) | 10.140.2.0/24  |               |
| ap-south-1     | production | Public subnet (AZ A)  | 10.14.11.0/24  | 10.14.0.0/16  |
| ap-south-1     | production | Public subnet (AZ B)  | 10.14.12.0/24  |               |
| ap-south-1     | production | Private subnet (AZ A) | 10.14.1.0/24   |               |
| ap-south-1     | production | Private subnet (AZ B) | 10.14.2.0/24   |               |
| ap-southeast-1 | staging    | Public subnet (AZ A)  | 10.170.11.0/24 | 10.170.0.0/16 |
| ap-southeast-1 | staging    | Public subnet (AZ B)  | 10.170.12.0/24 |               |
| ap-southeast-1 | staging    | Private subnet (AZ A) | 10.170.1.0/24  |               |
| ap-southeast-1 | staging    | Private subnet (AZ B) | 10.170.2.0/24  |               |
| ap-southeast-1 | production | Public subnet (AZ A)  | 10.17.11.0/24  | 10.17.0.0/16  |
| ap-southeast-1 | production | Public subnet (AZ B)  | 10.17.12.0/24  |               |
| ap-southeast-1 | production | Private subnet (AZ A) | 10.17.1.0/24   |               |
| ap-southeast-1 | production | Private subnet (AZ B) | 10.17.2.0/24   |               |

**Route Tables**

Public subnet:

| **Destination** | **Region**     | **Env**    | **Target**                     |
| --------------- | -------------- | ---------- | ------------------------------ |
| 10.140.0.0/16   | ap-south-1     | staging    | local                          |
| 10.14.0.0/16    | ap-south-1     | production |                                |
| 10.170.0.0/16   | ap-southeast-1 | staging    |                                |
| 10.17.0.0/16    | ap-southeast-1 | production |                                |
| 10.160.0.0/16   | ap-southeast-1 | staging    | blackhole-databases-vpc-pcx-id |
| TODO            | ap-southeast-1 | production |                                |
| 10.130.0.0/16   | ap-south-1     | staging    | blackhole-builders-vpc-pcx-id  |
| 10.13.0.0/16    | ap-south-1     | production |                                |
| 0.0.0.0/0       |                |            | igw-id                         |

**Security Groups**

Inbound rules for bastion host:

| Protocol | Port range | Source    |
| -------- | ---------- | --------- |
| tcp      | 22         | 0.0.0.0/0 |
| icmp     | 0-8        | 0.0.0.0/0 |

Outbound rules for bastion host:

| Protocol | Port range | Destination |
| -------- | ---------- | ----------- |
| tcp      | All        | 0.0.0.0/0   |

Reference: https://gist.github.com/charity/beb44266cadfd935ab6a838bfe917f38

**Network ACLs**

Inbound and outbound rules for all subnets:

| Inbound  |                  |          |            |             |            |
| -------- | ---------------- | -------- | ---------- | ----------- | ---------- |
| Rule #   | Type             | Protocol | Port Range | Source      | Allow/Deny |
| 100      | All IPv4 traffic | All      | All        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | All      | All        | 0.0.0.0/0   | DENY       |
| Outbound |                  |          |            |             |            |
| Rule #   | Type             | Protocol | Port Range | Destination | Allow/Deny |
| 100      | All IPv4 traffic | all      | all        | 0.0.0.0/0   | ALLOW      |
| *        | All IPv4 traffic | all      | all        | 0.0.0.0/0   | DENY       |

### Terraform codebase structure

Instead of creating separate directories for production and staging environments, we can use Terraform workspace to manage small differences between each environment. Read more: https://www.terraform.io/docs/state/workspaces.html

EDIT: I tried Terraform workspaces and decided it is not suitable for our use case since we have to do a lot ternary if-else conditions in interpolated strings, which do not work with list values. Hence, it’s better to separate out the environments by directory structure instead.

```
terraform/
- aws
- - mumbai
  - - common
    - - main.tf
      - - define S3 and IAM setup
      - state.tf
      - - store common TF state in S3
    - vpc
    - - main.tf
      - - define all VPCs by calling vpc module
      - state.tf
      - - store vpc TF state in S3
      - security-groups.tf
      - - define all security groups and their references to each other
      - peerings.tf
      - - define all VPC peering connections
      - outputs.tf
      - - services_vpc_id
        - builders_vpc_id
        - databases_vpc_id
        - blackhole_vpc_id
        - <IDs of various security groups>
    - services
    - - main.tf
      - - call modules with env-specific vars for proxies, proxies-admin, metasearch, microservices, redis-dynamic 
      - state.tf
      - - store services TF state in S3
    - builders
    - - main.tf
      - - call module with env-specific vars for builders
      - state.tf
      - - store builders TF state in S3
    - blackhole
    - - main.tf
      - - call module with env-specific vars for blackhole
      - state.tf
      - - store blackhole TF state in S3
    - databases
    - - main.tf
      - - call modules with env-specific vars for postgres, mysql, elasticsearch, elasticache
      - state.tf
      - - store databases TF state in S3
  - singapore
  - - common
    - vpc
    - services
    - data-storage
  - modules
  - - vpc
    - - main.tf
      - variables.tf
      - - azs
        - vpc_cidr 
        - private_subnets 
        - public_subnets
      - outputs.tf 
      - - vpc_id
        - vpc_cidr
        - public_subnet_ids
        - public_route_table_ids
        - private_subnet_ids
        - private_route_table_ids
    - microservices
    - - main.tf
      - variables.tf
    - metasearch
    - - main.tf
      - variables.tf
    - proxies
    - - main.tf
      - variables
    - proxies-admin
    - - main.tf
      - variables.tf
    - builders
    - - main.tf
      - variables.tf
    -  blackhole
    - - main.tf
      - variables.tf
    - mysql-rds
    - - main.tf
      - variables.tf
    - postgres-rds
    - - main.tf
      - variables.tf
    - elasticsearch
    - - main.tf
      - variables.tf
    - redis-static
    - - main.tf
      - variables.tf
    - redis-dynamic
    - - main.tf
      - variables.tf
```
### Multi-region concerns

For RDS instances, we can create cross-region read replicas: https://aws.amazon.com/rds/details/read-replicas/

For ElastiCache instances, we need to create a separate cluster in each region as cross-region support is not supported. Same for Elasticsearch

### Stuff that we missed

Consul servers in builders VPC? It is no longer needed as a dependency.

Turingery proxy servers in services VPC? Use NAT gateway

As inter-region VPC peering is supported for Asia, there are some changes:

- Instead of one Konga for each region, we can have one Konga to manage all Kongs across regions
- Instead of having another blackhole in the new region, we can do VPC peering from the blackhole VPC in SG region to the builders VPC in the other region

### Multi-region Deployment Pipeline

Currently, we have two deployment pipelines for metasearch - one for deploying core features and the other for deploying partner integrations. The former generally involves more breaking changes that require a safer deployment strategy.

Hence, I propose to apply Immutable Infrastructure pattern to only the deployment pipeline of core features (for now).

Right now, Jenkins is used for build and deployment. To apply the Immutable Infrastructure pattern, we should use Jenkins only for the build phase and introduce a new tool - Spinnaker - for the deployment phase.

**Comparison with current (Jenkins) and new (Spinnaker + Jenkins) deployment pipelines**

The current deployment pipeline is as follows:

1. Jenkins pulls the latest source code, builds the JAR artifact and uploads it to S3
2. Jenkins ssh into every instance, downloads the JAR artifact and restarts the service

The new deployment pipeline will be:

1. Jenkins pulls the latest source code, builds the JAR artifact and uploads it to S3
2. Spinnaker will bake a new AMI with the JAR artifact, calls the AWS API to orchestrate various deployment strategies with ASG and ELB.

| **Factor**                      | **Current deployment pipeline**                              | **New deployment pipeline**                                  |
| ------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Immutability                    | Mutable deployments                                          | Immutable deployments                                        |
| Deployment time                 | Deployment time is shorter when deploying 1 instance because AMI doesn’t need to be built. However, the deployment time is linear to the number of instances. Our current deployment strategy is that we put each instance in standby mode one by one, hence deployment time is linear. This doesn’t scale if we have > 50 instances. | Deployment time is longer when deploying 1 instance because AMI needs to be built. However, the deployment time is constant regardless of the number of instances. Regardless of how many instances we have in the new cluster, we propagate the new AMIs to each instance in parallel, hence the deployment time is constant. |
| Autoscaling time                | Autoscaling is slower because Ansible scripts are ran for each fresh instance to prepare it for deployment. | Autoscaling is faster because the new instance just needs to be booted with the existing AMI. |
| Engineering cost                | Jenkins is a familiar technology and easy to use, no need to train developers. | Spinnaker is a relatively new technology, need time to train the developers. Requires engineering time to modify existing pipeline to support the Spinnaker workflow (converting artifacts into Debian package etc.) |
| Multi-region deployment         | Multi-region deployment is possible but hard to execute. Using Consul as service discovery, we can deploy all servers across regions but it will be messy to troubleshoot when the deployment fails. | Multi-region deployments are supported out of the box by Spinnaker. |
| Developer experience            | Have to go back and forth the AWS console and Jenkins UI for troubleshooting/checking of instance status especially when deployed instances are in different regions. | Spinnaker provides an one-stop interface to track the progress of deployment pipeline by displaying data from Jenkins and AWS. Destroying, resizing ASG can be performed via Spinnaker as well. |
| Support for deployment patterns | We have to write our own Ansible scripts to apply deployment patterns like blue-green. Those deployment scripts have to be maintained by us. | Battle-tested deployment strategies are supported out of the box: highlander, blue-green, canary etc. |
| Support for rollbacks           | Have to develop our own solutions for rollbacks.             | Rollbacks are supported out of the box.                      |
| Support for custom pipelines    | We can create custom pipelines in Jenkins however the UI won’t be as intuitive as Spinnaker. | In Spinnaker, a deployment pipeline consists of stages. We can craft custom pipelines for various scenarios. For example, a commit in integrations repository will trigger a simple pipeline to deploy using the highlander strategy. On the other hand, a big PR merge in Curiosity/Akasha will trigger a complex pipeline to perform integration & performance testing, which then requires manual approval before a blue-green deployment is executed. |
# Wego Infrastructure

## Overview

https://geeks.wego.com/infrastructure-as-a-code-iac-we-go-fully-automated/

## Build and Release

Our build and release process is automated using Jenkins and Ansible.

For each service, we have two separate deployment pipelines - one for autoscaling new instances, and the other for performing rolling updates across all instances.

Taking `place-services` as example, we will have:

1. Jenkins job `place-services-deploy` and Ansible playbook `place-services-deploy.yml` to only deploy instances spawned by the autoscaler. This job is triggered when a new instance is launched by the autoscaling process.

2. Jenkins job `place-services-deploy-all` and Ansible playbook `place-services-deploy-all.yml` to deploy all instances. This job is triggered manually or by GitHub web hook, and it will perform updates on the instances one by one.

We also have jobs to run configuration updates across all metasearch/microservices instances:

1. `metasearch-configure`

2. `micro-services-configure`

## Upgrading Kong

As Kong upgrades usually have breaking changes, it is recommended to upgrade Kong using blue-green deployment.

1. Modify the Ansible playbook according to Kong's [upgrade notes](https://github.com/Kong/kong/blob/master/UPGRADE.md) for the respective version
    - Make sure the green Kong is pointing to its own RDS instance so as to avoid schema conflicts with the blue Kong's RDS instance, this can be configured in `settings-staging.yml` or `settings-production.yml`
2. Build AMI using Packer and [update AMI of green Kong](https://github.com/wego/metacloud/blob/master/terraform/kong-production/terraform.tfvars#L48) in the Terraform config file
3. During Terraform apply, the green Kong may or may not run. If it doesn't run, troubleshoot by inspecting Kong's process logs using `journalctl -u kong`
4. Assuming green Kong is running, test each endpoint to make sure they are working fine
5. Forward 10% of traffic to green Kong, monitor the CloudWatch metrics on green Kong's ELB for any anomalies in Requests Count and HTTP 4XXs Count
    - There could be a spike in the number of 4XXs during traffic forwarding. This is expected as it mostly comprised of 403 responses to bots' requests since green Kong's response cache is mostly empty. If Kong is returning a cached response to bots, the response code will be 304
6. Assuming the metrics are looking good, forward the remaining traffic to green Kong
7. Since green Kong is receiving 100% traffic now, upgrade blue Kong using the same steps from 2-6
8. At this point, blue Kong is upgraded and is receiving 100% traffic, we do Terraform apply again to update green Kong to use blue Kong's AMI so that they are sharing the same RDS instance
9. Remove green Kong's RDS instance since it is only used for blue-green deployment


# Wego Redis Data Structure
Wego is using redis to store data that serves metasearch apis for hotel and flight. Data is catergorized into static and live data. Static data refer to ones that are not frequently changed or updated. Live data includes data that is dynamically fetched from providers such as flight fares and hotel rates. Data structures for static and live data are detailed respectively below:
- [Static Data](redis-static.md)
- [Live Data](redis-live.md)

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

# Wego Redis Static Data

### [Places](#places)

* [Airports](#airports)
* [Cities](#cities)
* [Districts](#districts)
* [States](#states)
* [Countries](#countries)
* [World regions](#world-regions)
* [Currencies](#currencies)

* * *

### [Flights](#flights)

* [Aircrafts](#aircrafts)
* [Airlines](#airlines)
* [Providers](#providers)
* [Provider Routes](#provider-routes)
* [Routes](#routes)
* [Payment Methods](#payment-methods)
* [Payment Fees](#payment-fees)
* [Flight Ecpcs](#flight-ecpcs)
* [Fare Conditions](#fare-conditions)

* * *

### [Hotels](#hotels)

* [Hotels](#hotels)
* [Providers](#hotel-providers)
* [Brands](#brands)
* [Chains](#chains)
* [Property Types](#property-types)
* [Themes](#themes)
* [Amenites](#amenites)
* [Rate Amenities](#rate_amenities)
* [Baseline Scores](#baseline-scores)
* [Experiment Scores](#experiment-scores)
* [Base Scores](#base-scores)
* [Default Hosts](#default-hosts)
* [Site Configs](#site-configs)
* [Usual Prices](#usual-prices)
* [Room Type Categories](#room-type-categories)
* [Hotel Name Language](#hotel-name-language)

* * *

### [Partners](#partners)

* [Provider Location](#provider-location)
* [Provider District](#provider-district)

---

## Places

### Airports

List of all airports with key including airport code:

| Key format        | Value type| Command                 |
|-------------------|-----------|-------------------------|
| `place:airports`  | Hash      | hget, hgetall, hvals    |

Example:

```
"place:airports": {
  "<airportCode1>"=>"{"code":<airportCode1>,"cityCode":<cityCode1>","nameI18n":{"en":"English name},"stationType":"airport"}"
}
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| cityCode    | String    | city code of the airport      |
| nameI18n    | Hash      | name with locale translations |
| stationType | String    | airport                       |

#### Query

```
hget place:airports SIN

"{"code":"SIN","cityCode":"SIN","nameI18n":{"en":"Singapore Changi Airport","es":"Changi","it":"Changi"},"stationType":"airport"}"
```


### Cities

List of all cities with key including city code:

| Key format                    | Value type| Command     |
|-------------------------------|-----------|-------------|
| `place:city:code:<cityCode>`  | String    | get         |

```
"place:city:code:<cityCode1>": "{"id": "id1","code":<cityCode1>,"nameI18n":{"en":"English name},"countryCode":"countryCode1","stateCode":"stateCode1","timeZone":"timeZone1","dstStartTime":"dstStartTime1","dstEndTime":"dstEndTime2","dstTimeZone":"dstTimeZone1"}"

"place:city:code:<cityCode2>": "{"id": "id2","code":<cityCode2>,"nameI18n":{"en":"English name},"countryCode":"countryCode2","stateCode":"stateCode2","timeZone":"timeZone2","dstStartTime":"dstStartTime2","dstEndTime":"dstEndTime2","dstTimeZone":"dstTimeZone2"}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description                |
| -------------|-----------| ------------------------------|
| id           | Integet   | airport code                  |
| code         | String    | city code                     |
| nameI18n     | Hash      | name with locale translations |
| countryCode  | String    | country code                  |
| stateCode    | String    | state code                    |
| timeZone     | String    | time zone                     |
| dstStartTime | String    |                               |
| dstEndTime   | String    |                               |
| dstTimeZone  | String    |                               |

#### Query

```
get place:city:code:SIN

"{"id":6667,"code":"SIN","nameI18n":{"de":"Singapur","pl":"Singapur","en":"Singapore"},"countryCode":"SG","stateCode":null,"timeZone":"+08:00","dstStartTime":null,"dstEndTime":null,"dstTimeZone":null}"
```


### Districts

List of all districts with key including district id:

| Key format                           | Value type| Command     |
|--------------------------------------|-----------|-------------|
| `place:district:id:<districtId>`     | String    | get         |

```
"place:district:id:<districtId1>": "{"id":<districtId1>,"cityCode":<cityCode1>,"nameI18n":{"en":"English name}"}"

"place:district:id:<districtId2>": "{"id":<districtId2>,"cityCode":<cityCode2>,"nameI18n":{"en":"English name}"}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| id          | Integer   | district id                   |
| nameI18n    | Hash      | name with locale translations |
| cityCode    | String    | city code of the district     |

#### Query

```
get place:district:id:1

"{"id":1,"nameI18n":{"en":"Recoleta","fr":"Recoleta","it":"Recoleta","cityCode":"BUE"}"
```


### States

List of all states with key including state code:

| Key format                             | Value type| Command     |
|----------------------------------------|-----------|-------------|
| `place:state:code:<stateCode>`         | String    | get         |

```
"place:state:<stateCode1>": "{"code":<stateCode1>,"nameI18n":{"en":"English name},,"countryCode":<countryCode1>",

"place:state:<stateCode2>": "{"code":<stateCode2>,"nameI18n":{"en":"English name},,"countryCode":<countryCode2>",

...
```

#### Attributes in value

|  Attribute Name | Data type | Description                   |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| nameI18n    | Hash      | name with locale translations |
| countryCode | String    | country code of the state     |

#### Query

```
get place:state:IA

"{"code":"IA","nameI18n":{"en":"Iowa"},"countryCode":"US"}"
```


### Countries

List of all countries with key including country code:

| Key format                             | Value type| Command     |
|----------------------------------------|-----------|-------------|
| `place:country:code:<countryCode>`     | String    | get         |

```
"place:country:code:<countryCode1>": "{"code":<countryCode1>,"worldRegionCode":<worldRegionCode1>","nameI18n":{"en":"English name},"currencyCode":"currencyCode1"}"

"place:country:code:<countryCode2>": "{"code":<countryCode2>,"worldRegionCode":<worldRegionCode2>","nameI18n":{"en":"English name},"currencyCode":"currencyCode2"}"

...
```

#### Attributes in value

|  Attribute Name    | Data type | Description                                   |
| -------------------|-----------| ----------------------------------------------|
| code               | String    | country code                                  |
| worldRegionCode    | String    | world region code of the country in upper case|
| nameI18n           | Hash      | name with locale translations                 |
| currencyCode       | String    | currency code of the country                  |

#### Query

```
get place:country:code:SIN

"{"code":"SG","worldRegionCode":"I","nameI18n":{"es":"Singapur","en":"Singapore"},"currencyCode":"SGD"}"
```


### World regions

List of all world regions with key including world region code in uppercase:

| Key format                                   | Value type| Command     |
|----------------------------------------------|-----------|-------------|
| `place:worldRegion:code:<worldRegionCode>`   | String    | get         |

```
"place:worldRegion:code:<worldRegionCode1>": "{"code":<worldRegionCode1>,"nameI18n":{"en":"English name}}"

"place:worldRegion:code:<worldRegionCode2>": "{"code":<worldRegionCode2>,"nameI18n":{"en":"English name}}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|---------------| ------------------------------|
| code        | String        | world region code upper case  |
| nameI18n    | Hash          | name with locale translations |

#### Query

```
get place:worldRegion:code:i

{"code":"i","nameI18n":{"fr":"Asie","en":"Asia"}}"

```

---

### Currencies

List of all country currencies

| Key format                      | Value type| Command                   |
|---------------------------------|-----------|---------------------------|
| `place:currencies`              | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
"place:currencies": {
  "AED"=>"{\"code\":\"AED\",\"base\":\"USD\",\"rate\":\"3.673014\"}",
  "SGD"=>"{\"code\":\"SGD\",\"base\":\"USD\",\"rate\":\"1.362432\"}"
}
```

##### Query

```
hget "place:currencies" "SGD"

"{\"code\":\"SGD\",\"base\":\"USD\",\"rate\":\"1.362432\"}"

```

#### Attributes in value

| Attribute | Data type | Description                                   |
| ----------|-----------| ----------------------------------------------|
| code      | String    | Currency code                                 |
| base      | String    | Base currency code (USD)                      |
| rate      | Double    | Rate of the currency compared to the base one |

---


## Flights

### Aircrafts

List of all aircrafts

| Key format                             | Value type| Command              |
|----------------------------------------|-----------|----------------------|
| `flight:aircrafts`                     | Hash      | hget, hgetall, hvals |

Example:

```
"flight:aircrafts": {
  "<aircraftCode1>"=>"{"code":<aircraftCode1>,"nameI18n":{"en":"English name},"starRating":1}",
}
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| nameI18n    | Hash      | name with locale translations |
| starRating  | Integer   |                               |

##### Query

```
hget flight:aircrafts ERJ

"{"code":"ERJ","nameI18n":{"en":"Embraer RJ 135/140/145"},"starRating":3.0}"
```


### Airlines

List of all airlines

| Key format                           | Value type| Command               |
|--------------------------------------|-----------|-----------------------|
| `flight:airlines`                    | Hash      | hget, hgetall, hvals  |

```
"flight:airlines": {
  "OF"=>"{\"code\":\"OF\",\"starRating\":12.0,\"nameI18n\":{\"en\":\"Overland Airways\",\"tr\":\"Overland Hava Yollar\xc4\xb1\"},\"allianceCode\":null,\"marketingAirlineCode\":\"OF\",\"direct\":false,\"excludedDirectPos\":[]}",
}
```

#### Attributes in value

|  Attribute Name | Data type | Description                   |
| ----------------|-----------| ------------------------------|
| code            | String    | airport code                  |
| nameI18n        | Hash      | name with locale translations |
| starRating      | Integer   |                               |
| allianceCode    | String    |                               |
| marketingAirlineCode | String	|			      |
| direct	  | boolean   | true if the airline has restriction |


##### Query

```
hget flight:airlines OF

"{\"code\":\"OF\",\"starRating\":12.0,\"nameI18n\":{\"en\":\"Overland Airways\",\"tr\":\"Overland Hava Yollar\xc4\xb1\"},\"allianceCode\":null,\"marketingAirlineCode\":\"OF\",\"direct\":false,\"excludedDirectPos\":[]}"
```


### Providers

List of all flight providers

| Key format                             | Value type| Command              |
|----------------------------------------|-----------|----------------------|
| `flight:providers`                     | Hash      | hget, hgetall, hvals |

```
"flight:providers": {
  "wego.com"=>"{\"code\":\"wego.com\",\"name\":\"wego.com\",\"parentCode\":\"wego.com\",\"type\":\"ota\",\"mobileFriendly\":null,\"facilitatedBooking\":false,\"airlineCode\":null,\"configs\":null,\"deviceTypes\":\"[\\\"mobile\\\",\\\"tablet\\\",\\\"desktop\\\"]\",\"appTypes\":\"[\\\"*\\\"]\",\"ecpcRank\":null,\"status\":\"production\",\"onlyAirportSupported\":\"false\",\"faresLimit\":100,\"onewayFaresLimit\":10,\"siteCodes\":null,\"noSiteCodes\":null,\"locales\":\"[\\\"*\\\"]\",\"departureCodes\":null,\"passengerTypes\":\"[\\\"adults\\\",\\\"children\\\"]\",\"cabins\":\"[\\\"economy\\\",\\\"business\\\",\\\"first\\\"]\"}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                            |
| ----------------------|-----------| ---------------------------------------|
| code                  | String    | provider code                          |
| name                  | String    | provider name                          |
| parentCode            | String    | provider parent code                   |
| type                  | String    | provider type                          |
| mobileFriendly        | String    | is provider mobile friendly            |
| facilitatedBooking    | String    | take part in wego facilitated booking? |
| airlineCode	          | String	  | code of the tied airline               |           
| configs               | String    | configuration info                     |
| deviceTypes           | String    | list of supported device types         |
| appTypes              | String    | list of supported app types            |
| status                | String    | status of provider                     |
| onlyAirportSupported  | Bolean    | is airport only supported              |
| faresLimit            | Integer   | fares limit number                     |
| onewayFaresLimit      | Integer   | oneway fare limit number               |
| siteCodes             | String    | list of supported site codes           |
| noSiteCodes           | String    | list of unsupported side codes         |
| locales               | String    | list of supported locales             |
| departureCodes        | String    | list of supported departure codes      |
| passengerTypes        | String    | list of supported passenger types       |
| cabins                | String    | list of supported cabins               |

##### Query

```
hget flight:providers wego.com

{\"code\":\"wego.com\",\"name\":\"wego.com\",\"parentCode\":\"wego.com\",\"type\":\"ota\",\"mobileFriendly\":null,\"facilitatedBooking\":false,\"airlineCode\":null,\"configs\":null,\"deviceTypes\":\"[\\\"mobile\\\",\\\"tablet\\\",\\\"desktop\\\"]\",\"appTypes\":\"[\\\"*\\\"]\",\"ecpcRank\":null,\"status\":\"production\",\"onlyAirportSupported\":\"false\",\"faresLimit\":100,\"onewayFaresLimit\":10,\"siteCodes\":null,\"noSiteCodes\":null,\"locales\":\"[\\\"*\\\"]\",\"departureCodes\":null,\"passengerTypes\":\"[\\\"adults\\\",\\\"children\\\"]\",\"cabins\":\"[\\\"economy\\\",\\\"business\\\",\\\"first\\\"]\"}"
```

### Provider Routes

List of all flight provider routes including with pos provider code

| Key format                                                 | Value type| Command              |
|------------------------------------------------------------|-----------|----------------------|
| `flight:providerRoutes:posProviderCode:<posProviderCode>`  | Hash      | hget, hgetall, hvals |

```
"flight:providers:posProviderCode:wego.com": {
  "1220775"=>"{\"t\":1,\"r\":\"*-*\",\"d\":true}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                                                              |
| ----------------------|-----------| -------------------------------------------------------------------------|
| t                     | String    | route type(1 is airport, 2 is country, 3 is no airport, 4 is no country) |
| r                     | String    | route (the combination of departure code and arrival code)               |
| d                     | Boolean   | flag for direct flight filter                                            |

##### Query

```
hget flight:providers:posProviderCode:wego.com 1220775

"{\"t\":1,\"r\":\"*-*\",\"d\":true}"

```

### Routes

List of all flight routes including with airline code

| Key format                                                 | Value type| Command              |
|------------------------------------------------------------|-----------|----------------------|
| `flight:routes:airlineCode:<airlineCode>`                  | Hash      | hget, hgetall, hvals |

```
"flight:routes:airlineCode:SQ": {
  "4915962"=>"{\"r\":\"SIN-YVR\",\"st\":\"active\"}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                                                             |
| ----------------------|-----------| ------------------------------------------------------------------------|
| r                     | String    | route (the combination of departure code and arrival code)              |
| st                    | String    | status                                                                  |

##### Query

```
hget flight:routes:airlineCode:SQ 4915962

"{\"r\":\"SIN-YVR\",\"st\":\"active\"}"

```


### Payment Methods

List of all payment methods for flight

| Key format                           | Value type| Command              |
|--------------------------------------|-----------|----------------------|
| `flight:paymentMethods`              | Hash      | hget, hgetall, hvals |

```
"flight:paymentMethods": {
  "VISA"=>"{\"id\":14,\"name\":\"Visa\",\"code\":\"VISA\"}"
}
...
```

#### Attributes in value

|  Attribute Name | Data type | Description     |
| ----------------|-----------| --------------------|
| id              | Integer   | Payment method id   |
| name            | String    | Payment method name |
| code            | String    | Payment method code |

##### Query

```
hget flight:paymentMethods VISA

"{\"id\":14,\"name\":\"Visa\",\"code\":\"VISA\"}"
```

### Payment Fees

List of all payment fees for flight

| Key format                           | Value type| Command              |
|--------------------------------------|-----------|----------------------|
| `flight:paymentFees`                 | Hash      | hget, hgetall, hvals |

```
"flight:paymentFees": {
  "2892"=>"{\"id\":2892,\"paymentMethodCode\":\"MASTERCARD_CREDIT\",\"posProviderCode\":\"hop2.com\",\"siteCode\":\"*\",\"amount\":0.0,\"amountMin\":0.0,\"amountMax\":0.0,\"percentage\":0.0,\"currencyCode\":null,\"departureCountry\":null,\"arrivalCountry\":null,\"alliance\":null,\"tripType\":null}"
}
...
```

#### Attributes in value

|  Attribute Name   | Data type | Description           |
| ------------------|-----------| ----------------------|
| id                | Integer   | payment fee id        |
| paymentMethodCode | Integer   | payment method code   |
| posProviderCode   | String    | pos provider cod      |
| amount            | Float     | amount                |
| amountMin         | Float     | min amount            |
| amountMax         | Float     | max amount            |
| percentage        | Float     | percentage            |
| currencyCode      | String    | currency code         |
| departureCountry  | String    | departure country     |
| arrivalCountry    | String    | arrival country       |
| alliance          | String    | aliance               |
| tripType          | String    | trip type             |

##### Query

```
hget flight:paymentFees 2892

"{\"id\":2892,\"paymentMethodCode\":\"MASTERCARD_CREDIT\",\"posProviderCode\":\"hop2.com\",\"siteCode\":\"*\",\"amount\":0.0,\"amountMin\":0.0,\"amountMax\":0.0,\"percentage\":0.0,\"currencyCode\":null,\"departureCountry\":null,\"arrivalCountry\":null,\"alliance\":null,\"tripType\":null}"
```


### Flight Ecpcs

List of all flight ecpc with key including provider code and value will be a hash in which fields are site_code:

| Key format                                  | Value type| Command           |
|---------------------------------------------|-----------|-------------------|
| `flight:ecpc:providerCode:<provider_code>`  | Hash      | hvals/hkeys/hget  |

```
"flight:ecpc:providerCode:<providerCode1>": {
  "ZA": "providerCode":<providerCode1>,"siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67},
  "BR": "providerCode":<providerCode1>,"siteCode":"BR","amountUsd":0.31,"percentMobile":48.67}
}

"flight:ecpc:providerCode:<providerCode2>": {
  "SG": "providerCode":<providerCode2>,"siteCode":"SG","amountUsd":0.67,"percentMobile":49.76},
  "HK": "providerCode":<providerCode2>,"siteCode":"HK","amountUsd":0.67,"percentMobile":49.76}
}
...
```

#### Attributes in value

| Attribute Name | Data type | Description                  |
| --------------|-----------| ------------------------------|
| providerCode  | String    | provider code                 |
| siteCode      | String    | site code                     |
| amountUsd     | Integer   | ecpc value in USD             |
| percentMobile | Integer   |                               |

##### Query

```
hkeys flight:ecpc:providerCode:expedia.com.ph

 1) "ZA"
 2) "BR"
 3) "QA"
 ...

```

```
hvals flight:ecpc:providerCode:expedia.com.ph

 1) "{"providerCode":"expedia.com.ph","siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67}"
 2) "{"providerCode":"expedia.com.ph","siteCode":"BR","amountUsd":0.31,"percentMobile":48.67}"
 3) "{"providerCode":"expedia.com.ph","siteCode":"QA","amountUsd":0.31,"percentMobile":48.67}"
 ...

```

```
hget flight:ecpc:providerCode:expedia.com.ph ZA

"{"providerCode":"expedia.com.ph","siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67}"

```



### Fare Conditions

List of all Fare Conditions with key including id and value will be a string of full object or key alias by code with value is the id.

| Key format                         | Value type | Command |
| ---------------------------------- | ---------- | ------- |
| `flight:fareCondition:id:<id>`     | String     | get     |
| `flight:fareCondition:code:<code>` | String     | get     |

```
"flight:fareCondition:id:<id>": "{"id":<id>,"code":"<code>","nameI18n":{"en":"English name","ar":"Arabic name"}}"
```

Or by Alias:

```
"flight:fareCondition:code:<code>": "<id>"
```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| -------------- | --------- | ----------------------------- |
| id             | Integer   | id                            |
| code           | String    | fare condition code           |
| nameI18n       | Hash      | name with locale translations |

##### Query

```
get flight:fareCondition:id:1

"{\"id\":1,\"code\":\"REFUNDABLE\",\"nameI18n\":{\"en\":\"Refundable\",\"ar\":\"\xd9\x82\xd8\xa7\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x84\xd9\x84\xd8\xa7\xd8\xb3\xd8\xaa\xd8\xb1\xd8\xaf\xd8\xa7\xd8\xaf\"}}"
```

Or by Alias:

```
get flight:fareCondition:code:REFUNDABLE

"1"
```



## Hotels

### Hotels

Hotels are grouped by City Codes.

List of all hotels

| Key format                           | Value type| Command           |
|--------------------------------------|-----------|-------------------|
| `hotel:hotel:cityCode:<cityCode>`     | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
  "hotel:hotel:cityCode:SIN": {
    "258080": "{\"id\":258080,\"cityCode\":\"SIN\",\"districtId\":719,\"brandId\":212,\"propertyTypeId\":14,\"longitude\":\"103.837875723839\",\"latitude\":\"1.3007086725967\",\"star\":5,\"distanceToCityCentre\":2.23319,\"nearestAirportCode\":\"SIN\",\"distanceToNearestAirport\":18.0136,\"name\":{\"vi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"en\":\"Pan Pacific Serviced Suites\",\"id\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ko\":\"팬 패시픽 서비스 스위트 오차드, 싱가폴\",\"ja\":\"パン パシフィック サービスド スイーツ オーチャード シンガポール\",\"ru\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"fr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"it\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"sv\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"pt\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"de\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ar\":\"أجنحة بان باسيفيك المخدومة أوركارد\",\"th\":\"แพน แปซิฟิค เซอร์วิส สวีท ออร์ชาร์ด สิงคโปร์\",\"pl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"tr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"es\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"hi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ml\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"nl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"cs\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"zh-tw\":\"泛太平洋服務公寓\",\"zh-cn\":\"新加坡泛太平洋服务公寓\",\"es-419\":\"Pan Pacific Serviced Suites Orchard, Singapore\"},\"address\":{\"en\":\"96 Somerset Road\",\"fr\":\"96 Somerset Road\",\"es\":\"96 Somerset Road\",\"de\":\"96 Somerset Road\",\"it\":\"96 Somerset Road\",\"nl\":\"96 Somerset Road\",\"sv\":\"96 Somerset Road\",\"es-419\":\"96 Somerset Road\"},\"amenityIds\":[1,2,3,5,6,7,9,10,11,18],\"themeIds\":[1],\"imagesCount\":29,\"images\":[{\"url\":\"http://res.cloudinary.com/wego/image/upload/v1465380566/hotels/258080/652636.jpg\",\"description\":{\"en\":\"Exterior View\"}},],\"reviews\":[{\"score\":92,\"count\":145,\"percentage\":100.0,\"reviewerGroup\":\"ALL\"},{\"score\":91,\"count\":18,\"percentage\":13.0,\"reviewerGroup\":\"COUPLE\"},{\"score\":88,\"count\":82,\"percentage\":57.0,\"reviewerGroup\":\"FAMILY\"},{\"score\":92,\"count\":43,\"percentage\":30.0,\"reviewerGroup\":\"SOLO\"}],\"badges\":[{\"text\":{\"ar\":\"الأفضل قيمه الفطور\",\"de\":\" Ausgezeichnete Lage\",\"en\":\"Excellent Location\",\"es\":\"Ubicación excelente\",\"fr\":\"Excellent emplacement\",\"id\":\"Lokasi yangTerbaik\",\"it\":\"Ottima posizione\",\"ja\":\"最高のロケーション\",\"ko\":\"최상급의 위치\",\"ms\":\"Lokasi Terbaik\",\"nl\":\"Fantastische locatie\",\"pl\":\"Świetna lokalizacja\",\"pt\":\"Excelente localização\",\"pt-br\":\"Excelente localização\",\"ru\":\"Прекрасное расположение\",\"sv\":\"Utmärkta läge\",\"th\":\"ที่ดีที่สุด สถานที่ตั้ง\",\"tr\":\"Mükemmel Konum\",\"vi\":\"Địa điểm Tốt nhất\",\"zh-cn\":\"极好的地点\",\"zh-tw\":\"極佳的位置\"},\"subtext\":{\"ar\":\"في المدينة 6% الآعلى\",\"de\":\"Top 6% der Stadt\",\"en\":\"Top 6% in city\",\"es\":\"Top 6% en la ciudad\",\"fr\":\"Top 6% en ville\",\"id\":\"Top 6% di kota\",\"it\":\"Top 6% in città\",\"ja\":\"市内でTop6%\",\"ko\":\"도시 내 TOP 6%\",\"ms\":\"6% teratas di bandar raya\",\"nl\":\"Top 6% in de stad\",\"pl\":\"Top 6% w mieście\",\"pt\":\"Top 6% na cidade\",\"pt-br\":\"Top 6% na cidade\",\"ru\":\"В числе лучших 6% в этом городе\",\"sv\":\"Topp 6% i stan\",\"th\":\"ยอดนิยม 6% ในเมือง\",\"tr\":\"En iyi %6 içinde\",\"vi\":\"Thuộc nhóm 6% đầu trong thành phố\",\"zh-cn\":\"市里首选6%\",\"zh-tw\":\"市排名前6%\"}},{\"text\":{\"ar\":\"ممتاز جدا  فندق  مناسب للعائلات\",\"de\":\"Ausgezeichnetes Familienhotel\",\"en\":\"Excellent Family Hotel\",\"es\":\"Excelente hotel familiar\",\"fr\":\"Excellent hôtel familial\",\"id\":\"Hotel Keluarga yang unggul\",\"it\":\"Ottimo hotel per famiglie\",\"ja\":\"すばらしいファミリーホテル\",\"ko\":\"최상급의 패밀리 호텔\",\"ms\":\"Hotel Keluarga yang Sangat Baik\",\"nl\":\"Uitstekend familiehotel\",\"pl\":\"Rewelacyjny hotel rodzinny\",\"pt\":\"Excelente hotel familiar\",\"pt-br\":\"Excelente hotel familiar\",\"ru\":\"Отличный семейный отель\",\"sv\":\"Utmärkt familjehotell\",\"th\":\"ยอดเยี่ยม โรงแรมสำหรับครอบครัว\",\"tr\":\"Aile için Mükemmel Otel\",\"vi\":\"Khách sạn Gia đình Xuất sắc \",\"zh-cn\":\"极佳的 家庭型酒店\",\"zh-tw\":\"極佳的 家庭型酒店\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}},{\"text\":{\"ar\":\"ممتازجدا  تصنيف كلي\",\"de\":\"Hervorragendes Ranking\",\"en\":\"Excellent Overall Ranking\",\"es\":\"Excelente clasificación general\",\"fr\":\"Excellent classement global\",\"id\":\"Peringkat Keseluruhan yang Hebat\",\"it\":\"Ottima classifica complessiva\",\"ja\":\"総合ランキング：すばらしい\",\"ko\":\"종합 랭킹: 최상급\",\"ms\":\"Kedudukan Keseluruhan yang Sangat Baik\",\"nl\":\"Fantastische  algemene score\",\"pl\":\"Ogólnie rewelacyjny wynik w rankingu\",\"pt\":\"Excelente classificação geral\",\"pt-br\":\"Excelente classificação geral\",\"ru\":\"Отличная общая оценка\",\"sv\":\"Utmärkt övergripande betyg\",\"th\":\"ยอดเยี่ยม คะแนนโดยรวม\",\"tr\":\"Genel Olarak: Mükemmel\",\"vi\":\"Xuất sắc Tổng Xếp hạng\",\"zh-cn\":\"整体排名极佳\",\"zh-tw\":\"整體排名極佳\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}}]}"
  }

```

#### Attributes in value

| Attribute Name           | Data type | Description                            |
| -------------------------|-----------| -------------------------------------- |
| id                       | Integer   | hotel ID                               |
| cityCode                 | String    |                                        |
| districtId               | Integer   |                                        |
| brandId                  | Integer   |                                        |
| propertyTypeId           | Integer   |                                        |
| longitude                | Float     |                                        |
| latitude                 | Float     |                                        |
| star                     | Integer   |                                        |
| distanceToCityCentre     | Float     |                                        |
| nearestAirportCode       | String    |                                        |
| distanceToNearestAirport | Float     |                                        |
| name                     | Hash      | Translated Names, key as locale        |
| formerName               | Hash      | Translated Former Names, key as locale |
| address                  | Hash      | Translated Addresses, key as locale    |
| amenityIds               | Array     | List of amenity IDs                    |
| themeIds                 | Array     | List of theme IDs                      |
| imagesCount              | Array     | Number of Images available             |
| images                   | Array     | List of Image objects                  |
| reviews                  | Array     | List of Review objects                 |
| badges                   | Hash      | List of Badges                         |


##### Query

```
hget hotel:hotel:cityCode:SIN 258080

"{\"id\":258080,\"cityCode\":\"SIN\",\"districtId\":719,\"brandId\":212,\"propertyTypeId\":14,\"longitude\":\"103.837875723839\",\"latitude\":\"1.3007086725967\",\"star\":5,\"distanceToCityCentre\":2.23319,\"nearestAirportCode\":\"SIN\",\"distanceToNearestAirport\":18.0136,\"name\":{\"vi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"en\":\"Pan Pacific Serviced Suites\",\"id\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ko\":\"팬 패시픽 서비스 스위트 오차드, 싱가폴\",\"ja\":\"パン パシフィック サービスド スイーツ オーチャード シンガポール\",\"ru\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"fr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"it\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"sv\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"pt\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"de\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ar\":\"أجنحة بان باسيفيك المخدومة أوركارد\",\"th\":\"แพน แปซิฟิค เซอร์วิส สวีท ออร์ชาร์ด สิงคโปร์\",\"pl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"tr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"es\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"hi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ml\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"nl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"cs\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"zh-tw\":\"泛太平洋服務公寓\",\"zh-cn\":\"新加坡泛太平洋服务公寓\",\"es-419\":\"Pan Pacific Serviced Suites Orchard, Singapore\"},\"formerName\":{\"en\":\"Sheraton Krabi Beach Resort\"},\"address\":{\"en\":\"96 Somerset Road\",\"fr\":\"96 Somerset Road\",\"es\":\"96 Somerset Road\",\"de\":\"96 Somerset Road\",\"it\":\"96 Somerset Road\",\"nl\":\"96 Somerset Road\",\"sv\":\"96 Somerset Road\",\"es-419\":\"96 Somerset Road\"},\"amenityIds\":[1,2,3,5,6,7,9,10,11,18],\"themeIds\":[1],\"imagesCount\":29,\"images\":[{\"url\":\"http://res.cloudinary.com/wego/image/upload/v1465380566/hotels/258080/652636.jpg\",\"description\":{\"en\":\"Exterior View\"}},],\"reviews\":[{\"score\":92,\"count\":145,\"percentage\":100.0,\"reviewerGroup\":\"ALL\"},{\"score\":91,\"count\":18,\"percentage\":13.0,\"reviewerGroup\":\"COUPLE\"},{\"score\":88,\"count\":82,\"percentage\":57.0,\"reviewerGroup\":\"FAMILY\"},{\"score\":92,\"count\":43,\"percentage\":30.0,\"reviewerGroup\":\"SOLO\"}],\"badges\":[{\"text\":{\"ar\":\"الأفضل قيمه الفطور\",\"de\":\" Ausgezeichnete Lage\",\"en\":\"Excellent Location\",\"es\":\"Ubicación excelente\",\"fr\":\"Excellent emplacement\",\"id\":\"Lokasi yangTerbaik\",\"it\":\"Ottima posizione\",\"ja\":\"最高のロケーション\",\"ko\":\"최상급의 위치\",\"ms\":\"Lokasi Terbaik\",\"nl\":\"Fantastische locatie\",\"pl\":\"Świetna lokalizacja\",\"pt\":\"Excelente localização\",\"pt-br\":\"Excelente localização\",\"ru\":\"Прекрасное расположение\",\"sv\":\"Utmärkta läge\",\"th\":\"ที่ดีที่สุด สถานที่ตั้ง\",\"tr\":\"Mükemmel Konum\",\"vi\":\"Địa điểm Tốt nhất\",\"zh-cn\":\"极好的地点\",\"zh-tw\":\"極佳的位置\"},\"subtext\":{\"ar\":\"في المدينة 6% الآعلى\",\"de\":\"Top 6% der Stadt\",\"en\":\"Top 6% in city\",\"es\":\"Top 6% en la ciudad\",\"fr\":\"Top 6% en ville\",\"id\":\"Top 6% di kota\",\"it\":\"Top 6% in città\",\"ja\":\"市内でTop6%\",\"ko\":\"도시 내 TOP 6%\",\"ms\":\"6% teratas di bandar raya\",\"nl\":\"Top 6% in de stad\",\"pl\":\"Top 6% w mieście\",\"pt\":\"Top 6% na cidade\",\"pt-br\":\"Top 6% na cidade\",\"ru\":\"В числе лучших 6% в этом городе\",\"sv\":\"Topp 6% i stan\",\"th\":\"ยอดนิยม 6% ในเมือง\",\"tr\":\"En iyi %6 içinde\",\"vi\":\"Thuộc nhóm 6% đầu trong thành phố\",\"zh-cn\":\"市里首选6%\",\"zh-tw\":\"市排名前6%\"}},{\"text\":{\"ar\":\"ممتاز جدا  فندق  مناسب للعائلات\",\"de\":\"Ausgezeichnetes Familienhotel\",\"en\":\"Excellent Family Hotel\",\"es\":\"Excelente hotel familiar\",\"fr\":\"Excellent hôtel familial\",\"id\":\"Hotel Keluarga yang unggul\",\"it\":\"Ottimo hotel per famiglie\",\"ja\":\"すばらしいファミリーホテル\",\"ko\":\"최상급의 패밀리 호텔\",\"ms\":\"Hotel Keluarga yang Sangat Baik\",\"nl\":\"Uitstekend familiehotel\",\"pl\":\"Rewelacyjny hotel rodzinny\",\"pt\":\"Excelente hotel familiar\",\"pt-br\":\"Excelente hotel familiar\",\"ru\":\"Отличный семейный отель\",\"sv\":\"Utmärkt familjehotell\",\"th\":\"ยอดเยี่ยม โรงแรมสำหรับครอบครัว\",\"tr\":\"Aile için Mükemmel Otel\",\"vi\":\"Khách sạn Gia đình Xuất sắc \",\"zh-cn\":\"极佳的 家庭型酒店\",\"zh-tw\":\"極佳的 家庭型酒店\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}},{\"text\":{\"ar\":\"ممتازجدا  تصنيف كلي\",\"de\":\"Hervorragendes Ranking\",\"en\":\"Excellent Overall Ranking\",\"es\":\"Excelente clasificación general\",\"fr\":\"Excellent classement global\",\"id\":\"Peringkat Keseluruhan yang Hebat\",\"it\":\"Ottima classifica complessiva\",\"ja\":\"総合ランキング：すばらしい\",\"ko\":\"종합 랭킹: 최상급\",\"ms\":\"Kedudukan Keseluruhan yang Sangat Baik\",\"nl\":\"Fantastische  algemene score\",\"pl\":\"Ogólnie rewelacyjny wynik w rankingu\",\"pt\":\"Excelente classificação geral\",\"pt-br\":\"Excelente classificação geral\",\"ru\":\"Отличная общая оценка\",\"sv\":\"Utmärkt övergripande betyg\",\"th\":\"ยอดเยี่ยม คะแนนโดยรวม\",\"tr\":\"Genel Olarak: Mükemmel\",\"vi\":\"Xuất sắc Tổng Xếp hạng\",\"zh-cn\":\"整体排名极佳\",\"zh-tw\":\"整體排名極佳\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}}]}"
```

---

### Hotel Providers

| Key format                            | Value type | Command              |
|---------------------------------------|------------|----------------------|
| `hotel:providers`                     | Hash       | hget, hgetall, hvals |

Example:

```
 "hotel:providers": {
   "expedia.com.au" => "{\"id\":109,\"parentCode\":"\expedia.com\",\"code\":\"expedia.com.au\",\"name\":\"Expedia.com.au\",\"url\":\"http://www.expedia.com.au\",\"providerType\":\"ota\",\"status\":\"production\",\"mobile\":true,\"localTax\":\"breakdown\",\"siteCodes\":[\"*\"],\"noSiteCodes\":null,\"locales\":[\"*\"],\"deviceTypes\":[\"mobile\",\"tablet\",\"desktop\"]}"
```

#### Attributes in value

| Attribute Name | Data type |
| ---------------|-----------|
| id             | Integer   |
| parentId       | Integer   |
| code           | String    |
| name           | String    |
| url            | String    |
| providerType   | String    |
| status         | String    |
| mobile         | Boolean   |
| localTax       | String    |
| siteCodes      | Array     |
| noSiteCodes    |           |
| locales        | Array     |
| deviceTypes    | Array     |

##### Query

```
hget hotel:providers booking.com

"{\"id\":6,\"parentCode\":null,\"code\":\"booking.com\",\"name\":\"Booking.com\",\"url\":\"http://www.booking.com\",\"providerType\":\"ota\",\"status\":\"production\",\"mobile\":true,\"localTax\":\"breakdown\",\"siteCodes\":[\"*\"],\"noSiteCodes\":null,\"locales\":[\"*\"],\"deviceTypes\":[\"mobile\",\"tablet\",\"desktop\"]}"
```

---

### Brands

List of all Hotel Brands

| Key format                      | Value type| Command                   |
|---------------------------------|-----------|---------------------------|
| `hotel:brands`                  | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
"hotel:brands": {
  "772"=>"{\"id\":772,\"name\":{\"en\":\"Swiss-Belinn\"},\"chainId\":762,\"isChain\":true}",
  "362"=>"{\"id\":362,\"name\":{\"en\":\"Adagio Premium\"},\"chainId\":null,\"isChain\":false}",
  "543"=>"{\"id\":543,\"name\":{\"en\":\"Yitel\"},\"chainId\":542,\"isChain\":false}",
  "110"=>"{\"id\":110,\"name\":{\"en\":\"Six Senses Resorts \\u0026 Spas\",\"ar\":\"سيكس سينسز ومنتجعات\"},\"chainId\":null,\"isChain\":false}"
}
```

##### Query

```
hget "hotel:brands" "40"

"{\"id\":40,\"name\":{\"en\":\"Interstate Hotels and Resorts\",\"ar\":\"الطريق السريع للفنادق والمنتجعات\"},\"chainId\":null,\"isChain\":false}"

```

#### Attributes in value

| Attribute Name | Data type | Description                |
| ------------|-----------| ------------------------------|
| id        | Integer    | brand ID  |
| name    | Hash      | name with locale translations |
| chainId | Integer | Chain ID |
| isChain | Boolean | Indicates whether brand is a chain or not |

---

### Chains

List of all Hotel Chains

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:chains`                  | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:chains": {
    "965"=>"{\"id\":965,\"name\":{\"en\":\"Red Planet\"}}",
    "204"=>"{\"id\":204,\"name\":{\"en\":\"Preferred Hotel Group\",\"ar\":\"فنادق مفضلة، ومنتجعات في جميع أنحاء العالم\"}}",
    "879"=>"{\"id\":879,\"name\":{\"en\":\"Residhome Aparthotel\"}}"
 }

```

##### Query

```
hget "hotel:chains" "775"

"{\"id\":775,\"name\":{\"en\":\"Bennecke \"}}"

```

#### Attributes in value

| Attribute Name | Data type | Description                |
| ------------|-----------| ------------------------------|
| id        | Integer    | chain ID  |
| name    | Hash      | name with locale translations |

---

### Property Types

List of all hotel property types

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:propertyTypes`           | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:propertyTypes": {
    "8"=>"{\"id\":8,\"name\":{\"en\":\"City Hotel\"}}",
    "17"=>"{\"id\":17,\"name\":{\"en\":\"Beach Hotel\",\"ar\":\"فنادق مفضلة، ومنتجعات في جميع أنحاء العالم\"}}"
 }

```

##### Query

```
hget hotel:propertyTypes 8

"{\"id\":8,\"name\":{\"en\":\"City Hotel\"}}",

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ------------   |-----------| ------------------------------|
| id             | Integer   |                               |
| name           | Hash      | name with locale translations |

---

### Themes

List of all Hotel Themes

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:themes`                     | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:themes": {
    "1"=>"{\"id\":1,\"name\":{\"en\":\"Airport Hotel\"}}",
    "2"=>"{\"id\":2,\"name\":{\"en\":\"Lake Hotel\"}}"
 }

```

##### Query

```
hget hotel:themes 1

"{\"id\":1,\"name\":{\"en\":\"Airport Hotel\"}}

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | ID                            |
| name           | Hash      | name with locale translations |

---

### Amenites

List of all Hotel Amenites

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:amenities`                  | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:amenities": {
    "12"=>"{\"id\":12,\"name\":{\"en\":\"Business Centre\"}}",
    "17"=>"{\"id\":17,\"name\":{\"en\":\"Golfcourse\"}}"
 }

```

##### Query

```
hget hotel:amenities 12

"{\"id\":12,\"name\":{\"en\":\"Business Centre\"}}

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | ID                            |
| name           | Hash      | name with locale translations |

---

### Rate Amenities

List of all Rate Amenities

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:rateAmenities`           | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:rateAmenities": {
    "2" => "{\"id\":2,\"code\":\"FREE_CANCELLATION\",\"type\":\"AMENITY\",\"name\":{\"en\":\"Free Cancellation\"}}",
    "12" => "{\"id\":12,\"code\":\"NO_MEAL\",\"type\":\"AMENITY\",\"name\":{\"en\":\"No meal\"}}"
    "13" => "{\"id\":12,\"code\":\"NO_CREDIT_CARD_NEEDED\",\"type\":\"PAYMENT\",\"name\":{\"en\":\"No creedit card needed\"}}"
    "14" => "{\"id\":14,\"code\":\"MOBILE_EXCLUSIVE\",\"type\":\"USER\",\"name\":{\"en\":\"Mobile exclusive\"}}"
 }

```

##### Query

```
hget hotel:rateAmenities 12

"{\"id\":12,\"code\":\"NO_MEAL\",\"name\":{\"en\":\"No meal\"}}"

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | chain ID                      |
| name           | Hash      | name with locale translations |
| code           | String    | name with locale translations |

---

### Baseline Scores

| Key format                                                      | Value type  | Command           |
|-----------------------------------------------------------------|-------------|-------------------|
| `hotel:scores:baseline:siteLocale:<siteLocale>`                 | String      | hvals/hkeys/hget  |

Example:

```
 "hotel:scores:baseline:city:SIN:siteLocale:sa_ar": 
	{
	"SIN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}",
	"HAN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}"
	}

```

---

### Experiment Scores

| Key format                                                      | Value type  | Command           |
|-----------------------------------------------------------------|-------------|-------------------|
| `hotel:scores:experiment:siteLocale:<siteLocale>`               | String      | hvals/hkeys/hget  |

Example:

```
 "hotel:scores:experiment:city:SIN:siteLocale:sa_ar": 
	{
	"SIN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}",
	"HAN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}"
	}

```

---

### Base Scores

Baseline values for hotels in each city

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:baseScores`                 | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:baseScores": {
    "SIN" => "{\"258302\":267.765,\"258283\":251.451}",
    "HLZ" => "{\"967827\":120.924,\"118396\":147.785}"
 }

```

##### Query

```
hget hotel:baseScores SIN

"{\"258302\":267.765,\"258283\":251.451}"

```

#### Attributes in value

| Attribute      | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| `<hotel_id>`   | String    | hotel ID                      |
| `<base_value>` | Double    | Base value for the hotel_id   |


---

### Site Configs

Configutions for all sites

| Key format              | Value type| Command           |
|-------------------------|-----------|-------------------|
| `configs:siteConfigs`   | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "configs:siteConfigs": {
    "www.wego.ir"=>"{\"host\":\"www.wego.ir\",\"name\":\"Iran\",\"siteCode\":\"IR\",\"currency\":\"IRR\",\"locale\":\"fa\",\"supportedLocales\":[\"fa\",\"en\"]}",
    "sa.wego.com"=>"{\"host\":\"sa.wego.com\",\"name\":\"Saudi Arabia\",\"siteCode\":\"SA\",\"currency\":\"SAR\",\"locale\":\"ar\",\"supportedLocales\":[\"ar\",\"en\"]}"
 }

```

##### Query

```
hget configs:siteConfigs www.wego.com.sg

"{\"host\":\"www.wego.com.sg\",\"name\":\"Singapore\",\"siteCode\":\"SG\",\"currency\":\"SGD\",\"locale\":\"en\",\"supportedLocales\":[\"en\",\"ms\",\"zh-cn\"]}"

```

#### Attributes in value

| Attribute Name   | Data type | Description      |
| -----------------|-----------| -----------------|
| host             | String    |                  |
| name             | String    | Country name     |
| siteCode         | String    | Country name     |
| currency         | String    | Country currency |
| locale           | String    |                  |
| supportedLocales | List      | Country name     |

---

### Default Hosts

List of all default hosts for each locale

| Key format             | Value type| Command           |
|------------------------|-----------|-------------------|
| `configs:defaultHosts` | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "configs:defaultHosts": {
    "en"=>"www.wego.com",
    "ar"=>"www.wego.ae"
 }

```

##### Query

```
hget defaultHostByLocale ar

"www.wego.ae"

```
---
### Usual Prices

Usual prices for hotels

| Key format                              | Value type| Command           |
|-----------------------------------------|-----------|-------------------|
| `hotel:usualPrices:cityCode:<cityCode>` | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:usualPrices:cityCode:SIN": {
    "716563"=>"{\"01-1\":125.247,\"02-1\":126.155,\"06-1\":135.527,\"07-1\":125.039,\"12-7\":124.067}",
    "258023"=>"{\"06-1\":201.824,\"07-1\":215.944,\"08-1\":215.757,\"09-1\":210.635,\"12-7\":233.641}"
 }

```

##### Query

```
hget hotel:usualPrices:cityCode:SIN 716563

"{\"01-1\":125.247,\"02-1\":126.155,\"06-1\":135.527,\"07-1\":125.039,\"12-7\":124.067}"

```

#### Attributes in value

| Attribute           | Data type | Description                                             |
| --------------------|-----------| --------------------------------------------------------|
| `<month_dayOfWeek>` | String    | Month and day of week                                   |
| `<usual_price>`     | Float     | Hotel usual price on that day of week and in that month |

---

### Room Type Categories

Room Type Categories for hotels

| Key format                           | Value type | Command | Description |
| ------------------------------------ | ---------- | ------- | ----------- |
| `hotel:roomTypeCategory:code:<code>` | String     | get/set |             |
| `hotel:roomTypeCategory:id:<id>`     | String     | get/set | Alias       |

#### Example:

```
 "hotel:roomTypeCategory:code:PRIVATE_ROOM": "{\"id\":1,\"code\":\"PRIVATE_ROOM\",\"nameI18n\":{\"en\":\"Private room\"}}"
 "hotel:roomTypeCategory:id:1": "PRIVATE_ROOM"
```

##### Query

```
get "hotel:roomTypeCategory:code:PRIVATE_ROOM"

"{\"id\":1,\"code\":\"PRIVATE_ROOM\",\"nameI18n\":{\"en\":\"Private room\"}}"
```

#### Attributes in value

| Attribute    | Data type | Description             |
| ------------ | --------- | ----------------------- |
| `<id>`       | Integer   | Room Type Category Id   |
| `<code>`     | String    | Room Type Category Code |
| `<nameI18n>` | String    | name with translation   |

---

### Hotel Name Language

Detection langugage of live hotel names (ex: Airbnb property name)

| Key format                             | Value type | Command | Description |
| -------------------------------------- | ---------- | ------- | ----------- |
| `hotel:nameLocale:cityCode:<cityCode>` | String     | get/set |             |

#### Example:

```
 "hotel:nameLocale:cityCode:DXB": "{\"c7AwfvlFT8iztt4WojtJ+g==\":\"en\",\"L1P9xyVdZMFGw/fj5luSXg==\":\"en\",\"9wy8eE1YlGki6Uf8RX0rrw==\":\"ar\"}"
```

##### Query

```
get "hotel:nameLocale:cityCode:DXB"

"{\"c7AwfvlFT8iztt4WojtJ+g==\":\"en\",\"L1P9xyVdZMFGw/fj5luSXg==\":\"en\",\"9wy8eE1YlGki6Uf8RX0rrw==\":\"ar\"}"
```

#### Attributes in value

| Attribute    | Data type | Description                          |
| ------------ | --------- | ------------------------------------ |
| `<key_name>` | String    | A unique hash of cleaning hotel name |
| `<locale>`   | String    | Detected locale of hotel name        |

---

## Partners

### Provider Location

Provider Location to be used in metasearch incase we have live hotels

| Key format                                         | Value type | Command          | Description                     |
| -------------------------------------------------- | ---------- | ---------------- | ------------------------------- |
| `partner:providerLocation:providerId:<providerId>` | Hash       | hvals/hkeys/hget | Field: `<providerLocationCode>` |

#### Example:

```
 "partner:providerLocation:providerId:613": {
   "manggis__id": "{\"id\":2964967,\"code\":\"manggis__id\",\"cityCode\":\"34188\",\"providerId\":613}",
  "marinadelrey__us": "{\"id\":2967583,\"code\":\"marinadelrey__us\",\"cityCode\":\"8441\",\"providerId\":613}"
 }
```

##### Query

```
hget "partner:providerLocation:providerId:613" "singapore__sg"

"{\"id\":2964560,\"code\":\"singapore__sg\",\"cityCode\":\"SIN\",\"providerId\":613}"
```

#### Attributes in value

| Attribute      | Data type | Description            |
| -------------- | --------- | ---------------------- |
| `<id>`         | Integer   | Provider location id   |
| `<code>`       | String    | Provider location code |
| `<cityCode>`   | String    | Wego city code         |
| `<providerId>` | Integer   | Provider id            |

---

### Provider District

Provider District to be used in metasearch incase we have live hotels.

| Key format                                         | Value type | Command          | Description                     |
| -------------------------------------------------- | ---------- | ---------------- | ------------------------------- |
| `partner:providerDistrict:providerId:<providerId>` | Hash       | hvals/hkeys/hget | Field: `<providerDistrictCode>` |

#### Example:

```
 "partner:providerDistrict:providerId:613": {
    "villaurquiza_villaurquiza": "{\"id\":89969,\"code\":\"villaurquiza_villaurquiza\",\"districtId\":3240 \"providerId\":613}",
    "portaromana_milano": "{\"id\":89874,\"code\":\"portaromana_milano\",\"districtId\":22343,\"providerId\":613}"
 }
```

##### Query

```
hget "partner:providerDistrict:providerId:613" "lichtenberg_berlin"

"{\"id\":89586,\"code\":\"lichtenberg_berlin\",\"districtId\":3085,\"providerId\":613}"
```

#### Attributes in value

| Attribute      | Data type | Description            |
| -------------- | --------- | ---------------------- |
| `<id>`         | Integer   | Provider district id   |
| `<code>`       | String    | Provider district code |
| `<districtId>` | Integer   | Wego district id       |
| `<providerId>` | Integer   | Provider id            |

---



