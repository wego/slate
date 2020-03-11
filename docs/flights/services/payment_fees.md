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