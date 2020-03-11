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