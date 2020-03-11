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