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
