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
