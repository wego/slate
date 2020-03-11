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