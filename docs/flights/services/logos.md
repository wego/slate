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
