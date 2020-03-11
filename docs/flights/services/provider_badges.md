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