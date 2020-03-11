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

