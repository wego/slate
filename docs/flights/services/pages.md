
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