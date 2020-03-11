# Wego Partner Services API

No | Endpoint                                                                                        | Description                   |
---|-------------------------------------------------------------------------------------------------|-------------------------------|
1  | [GET partners/autofill](#autofill)                                                              | Autofill                      |
2  | [GET partners/provider_hotels/provider_hotel_id](#get-provider-hotel-detail)                    | Get Provider Hotel Detail     |
3  | [GET partners/provider_hotels](#get-provider-hotels)                                            | Get Provider Hotels           |
4  | [GET partners/provider_locations](#get-provider-locations)                                      | Get Provider Locations        |
5  | [GET partners/providers](#get-providers)                                                        | Get Providers                 |
6  | [POST partners/providers](#create-provider)                                                     | Create Provider               |
7  | [PUT partners/providers/provider_id](#update-provider)                                          | Update Provider               |
8  | [PUT partners/provider_brands/provider_brand_id](#update-provider-brand)                        | Update Provider Brand         |
9  | [PUT partners/provider_property_types/provider_property_type_id](#update-provider-property-tye) | Update Provider Property Type |
10 | [POST partners/hotels](#create-hotel)                                                           | Create Hotel                  |
11 | [PUT partners/hotels/hotel_id](#update-hotel)                                                   | Update Hotel                  |
12 | [DELETE partners/hotels/hotel_id](#delete-hotel)                                                | Delete Hotel                  |
13 | [POST partners/hotels/update_city_code](#update-city-code-for-hotels)                           | Update City Code For Hotels   |
14 | [POST partners/hotels/update_images](#update-images)                                            | Update Images                 |
15 | [POST partners/hotels/bulk_update](#bulk-update)                                                | Bulk Update                   |
16 | [GET partners/activity](#get-activity)                                                          | Activity                      |

## Autofill

```
GET partners/autofill
```

Parameters

| Property      | Required? | Data Type | Description                     |
| ------------- | --------- | --------- | ------------------------------- |
| provider_code | Yes       | String    | flights or hotels provider code |
| client_id     | Yes       | String    |                                 |
| ts_code       | Yes       | String    |                                 |
| type          | Yes       | String    | `flights` or `hotels`           |

### Example

* `partners/autofill?provider_code=expedia.com&client_id=A9C9E5DD-1B26-4DA9-A0EA-29880A938E41&ts_code=36e3e&type=hotels`

### Response

```
function(people) {
var p1 = people[0];

var phoneCallingCodes = {
  "IL": "972", "AF": "93", "AL": "355", "DZ": "213", "AS": "1684", "AD": "376", "AO": "244", "AI": "1264", "AG": "1268", "AR": "54", "AM": "374", "AW": "297",
  "AU": "61", "AT": "43", "AZ": "994", "BS": "1242", "BH": "973", "BD": "880", "BB": "1246", "BY": "375", "BE": "32", "BZ": "501", "BJ": "229", "BM": "1441",
  "BT": "975", "BA": "387", "BW": "267", "BR": "55", "IO": "246", "BG": "359", "BF": "226", "BI": "257", "KH": "855", "CM": "237", "CA": "1", "CV": "238", "KY": "345",
  "CF": "236", "TD": "235", "CL": "56", "CN": "86", "CX": "61", "CO": "57", "KM": "269", "CG": "242", "CK": "682", "CR": "506", "HR": "385", "CU": "53", "CY": "537",
  "CZ": "420", "DK": "45", "DJ": "253", "DM": "1767", "DO": "1849", "EC": "593", "EG": "20", "SV": "503", "GQ": "240", "ER": "291", "EE": "372", "ET": "251",
  "FO": "298", "FJ": "679", "FI": "358", "FR": "33", "GF": "594", "PF": "689", "GA": "241", "GM": "220", "GE": "995", "DE": "49", "GH": "233", "GI": "350",
  "GR": "30", "GL": "299", "GD": "1473", "GP": "590", "GU": "1671", "GT": "502", "GN": "224", "GW": "245", "GY": "595", "HT": "509", "HN": "504", "HU": "36",
  "IS": "354", "IN": "91", "ID": "62", "IQ": "964", "IE": "353", "IT": "39", "JM": "1876", "JP": "81", "JO": "962", "KZ": "7", "KE": "254", "KI": "686",
  "KW": "965", "KG": "996", "LV": "371", "LB": "961", "LS": "266", "LR": "231", "LI": "423", "LT": "370", "LU": "352", "MG": "261", "MW": "265", "MY": "60",
  "MV": "960", "ML": "223", "MT": "356", "MH": "692", "MQ": "596", "MR": "222", "MU": "230", "YT": "262", "MX": "52", "MC": "377", "MN": "976", "ME": "382",
  "MS": "1664", "MA": "212", "MM": "95", "NA": "264", "NR": "674", "NP": "977", "NL": "31", "AN": "599", "NC": "687", "NZ": "64", "NI": "505", "NE": "227",
  "NG": "234", "NU": "683", "NF": "672", "MP": "1670", "NO": "47", "OM": "968", "PK": "92", "PW": "680", "PA": "507", "PG": "675", "PY": "595", "PE": "51",
  "PH": "63", "PL": "48", "PT": "351", "PR": "1939", "QA": "974", "RO": "40", "RW": "250", "WS": "685", "SM": "378", "SA": "966", "SN": "221", "RS": "381",
  "SC": "248", "SL": "232", "SG": "65", "SK": "421", "SI": "386", "SB": "677", "ZA": "27", "GS": "500", "ES": "34", "LK": "94", "SD": "249", "SR": "597",
  "SZ": "268", "SE": "46", "CH": "41", "TJ": "992", "TH": "66", "TG": "228", "TK": "690", "TO": "676", "TT": "1868", "TN": "216", "TR": "90", "TM": "993",
  "TC": "1649", "TV": "688", "UG": "256", "UA": "380", "AE": "971", "GB": "44", "US": "1", "UY": "598", "UZ": "998", "VU": "678", "WF": "681", "YE": "967",
  "ZM": "260", "ZW": "263", "AX": "", "AQ": "", "BO": "591", "BN": "673", "CC": "61", "CD": "243", "CI": "225", "FK": "500", "GG": "44", "VA": "379", "HK": "852",
  "IR": "98", "IM": "44", "JE": "44", "KP": "850", "KR": "82", "LA": "856", "LY": "218", "MO": "853", "MK": "389", "FM": "691", "MD": "373", "MZ": "258",
  "PS": "970", "PN": "872", "RE": "262", "RU": "7", "BL": "590", "SH": "290", "KN": "1869", "LC": "1758", "MF": "590", "PM": "508", "VC": "1784",
  "ST": "239", "SO": "252", "SJ": "47", "SY": "963", "TW": "886", "TZ": "255", "TL": "670", "VE": "58", "VN": "84", "VG": "1284", "VI": "1340"
};

var name = "";
if (p1.firstName)
  name = p1.firstName + " ";
if (p1.middleName)
  name += p1.middleName + " ";
if (p1.lastName)
  name += p1.lastName;
$('[name="tripPreferencesRequest.hotelTripPreferences.hotelRoomPreferences[0].contactName"]').val(name);
$('#country-code-room-0').val(phoneCallingCodes[p1.phoneNumberCode]);
$('[name="tripPreferencesRequest.hotelTripPreferences.hotelRoomPreferences[0].preferredPhoneNumber"]').val(p1.phoneNumber);
$('[name="email"]').val(p1.email);
}
```
---

## Get Provider Hotel Detail

```
GET partners/provider_hotels/provider_hotel_id
```

Parameters

No | Property     | Required? | Data Type | Description                                                                                          |
---| ------------ | --------- | --------- | ---------------------------------------------------------------------------------------------------- |
1  | id           | Yes       | Number    | Id of desired provider hotel                                                                         |
2  | language     | No        | String    | The language that the response will be in. En as default                                             |
3  | locale       | No        | String    | The language that the response will be in. En as default                                             |
4  | page         | No        | Number    |                                                                                                      |
5  | perPage      | No        | Number    |                                                                                                      |
6  | keyTransform | No        | String    | underscore                                                                                           |

### Example

* `/partners/provider_hotels/591946`

### Response

```
{
  "id": 591946,
  "hotelId": 34938,
  "providerId": 6,
  "providerPropertyId": "27152",
  "providerLocationId": 78,
  "providerDistrictId": 40451,
  "nameEn": "President Park Bangkok",
  "addressEn": "95 Sukhumvit 24",
  "star": 4,
  "nativeCurrency": "THB",
  "longitude": "100.56553",
  "latitude": "13.72117",
  "timeZone": "Asia/Bangkok",
  "gmtOffset": "7",
  "postalCode": "10110",
  "builtYear": "",
  "renovatedYear": "",
  "checkIn": "14:00",
  "checkOut": "12:00",
  "roomsCount": 238,
  "url": "https://www.booking.com/hotel/th/presidentpark.html",
  "disabledByHuman": 0,
  "activeByImport": 1,
  "matchedBy": 20170101,
  "matchScore": 0.995084
}
```
---

## GET Provider Hotels

```
GET partners/provider_hotels
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | provider_id          | No        | Integer   | Get provider hotels for a specific provider_id            |
2  | provider_property_id | No        | String    | Get provider hotels for a specific provider_property_id   |
3  | language             | No        | String    | The language that the response will be in. En as default  |
4  | locale               | No        | String    | The language that the response will be in. En as default  |
5  | page                 | No        | Number    |                                                           |
6  | perPage              | No        | Number    |                                                           |
7  | keyTransform         | No        | String    | underscore                                                |

### Example

* `/partners/provider_hotels?provider_id=100`

### Response

```
[
  {
    "id": 2550987,
    "hotelId": 371852,
    "providerId": 100,
    "providerPropertyId": "371852",
    "nameEn": "Tulip Inn Sunny Hill",
    "addressEn": "31 A Fagetului Street",
    "star": 4,
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  },
  {
    "id": 2578968,
    "hotelId": 254079,
    "providerId": 100,
    "providerPropertyId": "254079",
    "nameEn": "Parkroyal Saigon Hotel",
    "addressEn": "309B-311 Nguyen Van Troi, Tan Binh District",
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  },
  {
    "id": 2578969,
    "hotelId": 117590,
    "providerId": 100,
    "providerPropertyId": "117590",
    "nameEn": "The Royal Phuket Yacht Club and Puravarna Resort",
    "addressEn": "23/3 Vises Road, Nai Harn Beach",
    "longitude": "98.30313",
    "latitude": "7.77851",
    "postalCode": "83130",
    "builtYear": "",
    "renovatedYear": "",
    "disabledByHuman": 0,
    "activeByImport": 1,
    "matchScore": 0
  }
]
```
---

## GET Provider Locations

```
GET partners/provider_locations
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | provider_id          | Yes       | Integer   | Get provider locations for a specific provider_id         |
2  | location_id          | Yes       | String    | Get provider locations for a specific location_id         |
3  | language             | No        | String    | The language that the response will be in. En as default  |
4  | locale               | No        | String    | The language that the response will be in. En as default  |
5  | keyTransform         | No        | String    | underscore                                                |

### Example

* `/partners/provider_locations?provider_id=100&location_id=6667`

### Response

```
[
  {
    "id": 2378906,
    "locationId": 6667,
    "providerCountryId": 64615,
    "providerId": 100,
    "providerLocationCode": "SIN",
    "nameEn": "Singapore",
    "latitude": "1.35208",
    "longitude": "103.82",
    "providerCountry": {
      "id": 64615,
      "country_id": 197,
      "provider_id": 100,
      "name": "Singapore",
      "code": "SG",
      "created_at": "2017-08-29T08:20:18.000Z",
      "updated_at": "2017-09-04T03:13:09.000Z"
    }
  }
]
```

---

## GET Providers

```
GET partners/providers
```

Parameters

No | Property     | Required? | Data Type | Description                                               |
---| -------------| --------- | --------- | ----------------------------------------------------------|
1  | status       | No        | String    | production/staging/down                                   |
2  | language     | No        | String    | The language that the response will be in. En as default  |
3  | locale       | No        | String    | The language that the response will be in. En as default  |
4  | keyTransform | No        | String    | underscore                                                |

### Example

* `/partners/providers?status=production`

### Response

```
[
  {
    "id": 1,
    "code": "accorhotels.com",
    "name": "Accorhotels.com",
    "url": "http://www.accorhotels.com",
    "providerType": "direct",
    "bucketLookupId": 1,
    "staticDataLookupId": 1,
    "bucketized": false,
    "siteCodes": [
        "*"
    ],
    "noSiteCodes": [
        "EG",
        "IN"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": false,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "breakdown",
    "comments": "",
    "hasDynamicData": false
  },
  {
    "id": 3,
    "code": "asiatravel.com",
    "name": "Asiatravel.com",
    "url": "http://www.asiatravel.com",
    "providerType": "ota",
    "bucketLookupId": 3,
    "staticDataLookupId": 3,
    "bucketized": true,
    "siteCodes": [
        "*"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": true,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "not_provided",
    "comments": "Restricted for mobile on multiple POS via ignore_when, Natalya, 3 Feb 2016",
    "hasDynamicData": false
  },
  {
    "id": 6,
    "code": "booking.com",
    "name": "Booking.com",
    "url": "http://www.booking.com",
    "providerType": "ota",
    "bucketLookupId": 6,
    "staticDataLookupId": 6,
    "bucketized": true,
    "siteCodes": [
        "*"
    ],
    "locales": [
        "*"
    ],
    "status": "production",
    "mobile": true,
    "deviceTypes": [
        "mobile",
        "tablet",
        "desktop"
    ],
    "localTax": "breakdown",
    "comments": "",
    "hasDynamicData": false
  }
]

```

---

## Create Provider

```
POST partners/providers
```

Parameters

No | Property              | Required? | Data Type | Description                                               |
---| ----------------------| --------- | --------- | ----------------------------------------------------------|
1  | parent_id             | No        | Number    | id of parent provider                                     |
2  | code                  | No        | String    | provider code                                             |
3  | name                  | No        | String    | provider name                                             |
4  | url                   | No        | String    | provider url                                              |
5  | provider_type         | No        | String    | ota/direct                                                |
6  | status                | No        | String    | production/staging/down                                   |
7  | mobile                | No        | Boolean   | mobile friendly or not                                    |
8  | local_tax             | No        | String    | total/not provided/break down                             |
9  | comments              | No        | String    |                                                           |
10 | bucket_lookup_id      | No        | String    |                                                           |
11 | static_data_lookup_id | No        | String    |                                                           |
12 | bucketized            | No        | Boolean   |                                                           |
13 | has_dynamic_data      | No        | Boolean   |                                                           |
14 | site_codes            | No        | Array     | supported site_codes                                      |
15 | no_site_codes         | No        | Array     | not supported site_codes                                  |
16 | locales               | No        | Array     | supported locales                                         |
17 | device_types          | No        | Array     | support devices                                           |
18 | whodunnit             | No        | Number    | user id of the user who trigger the action                |


### Example

```
POST partners/providers

{
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":["", "AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["", "*"],
  "status":"staging",
  "mobile":"true",
  "device_types":["", "mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":"",
  "whodunnit":3
}
```

### Response

```
{
  "id": 614
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":[AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["*"],
  "status":"staging",
  "mobile":"true",
  "device_types":[mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":""
}
```

---

## Update Provider

```
PUT partners/providers/provider_id
```

Parameters

No | Property              | Required? | Data Type | Description                                               |
---| ----------------------| --------- | --------- | ----------------------------------------------------------|
1  | parent_id             | No        | Number    | id of parent provider                                     |
2  | code                  | No        | String    | provider code                                             |
3  | name                  | No        | String    | provider name                                             |
4  | url                   | No        | String    | provider url                                              |
5  | provider_type         | No        | String    | ota/direct                                                |
6  | status                | No        | String    | production/staging/down                                   |
7  | mobile                | No        | Boolean   | mobile friendly or not                                    |
8  | local_tax             | No        | String    | total/not provided/break down                             |
9  | comments              | No        | String    |                                                           |
10 | bucket_lookup_id      | No        | String    |                                                           |
11 | static_data_lookup_id | No        | String    |                                                           |
12 | bucketized            | No        | Boolean   |                                                           |
13 | has_dynamic_data      | No        | Boolean   |                                                           |
14 | site_codes            | No        | Array     | supported site_codes                                      |
15 | no_site_codes         | No        | Array     | not supported site_codes                                  |
16 | locales               | No        | Array     | supported locales                                         |
17 | device_types          | No        | Array     | support devices                                           |
18 | whodunnit             | No        | Number    | user id of the user who trigger the action                |


### Example

```
PUT partners/providers/614

{
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":["", "AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["", "*"],
  "status":"staging",
  "mobile":"true",
  "device_types":["", "mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":"",
  "whodunnit":3
}
```

### Response

```
{
  "id": 614
  "parent_id":"1",
  "code":"cleartrip.ae",
  "name":"Cleartrip",
  "url":"cleartrip.ae",
  "provider_type":"ota",
  "bucket_lookup_id":"614",
  "static_data_lookup_id":"614",
  "bucketized":"false",
  "site_codes":[AE", "BH", "KW", "OM", "QA", "SA"],
  "no_site_codes":[""],
  "locales":["*"],
  "status":"staging",
  "mobile":"true",
  "device_types":[mobile", "tablet"],
  "local_tax":"not_provided",
  "has_dynamic_data":"false",
  "comments":""
}
```

---

## Update Provider Brand

```
PUT partners/provider_brands/provider_brand_id
```

Parameters

No | Property  | Required? | Data Type | Description                                |
---| ----------| --------- | --------- | -------------------------------------------|
1  | brand_id  | No        | Number    | id of matched brand                        |
2  | whodunnit | No        | Number    | user id of the user who trigger the action |


### Example

```
PUT partners/provider_brands/1

{
  "brand_id":305,
  "whodunnit":3
}
```

### Response

```
{
  "id":1,
  "brand_id":305,
  "name_en":"Ibis Hotels",
  "code":"IBH",
  "is_chain":"false",
  "provider_id":"1"
}
```

---

## Update Provider Property Type

```
PUT partners/provider_property_types/provider_property_type_id
```

Parameters

No | Property                   | Required? | Data Type | Description                                |
---| ---------------------------| --------- | --------- | -------------------------------------------|
1  | provider_property_type_id  | No        | Number    | id of matched provider_property_type       |
2  | whodunnit                  | No        | Number    | user id of the user who trigger the action |


### Example

```
PUT partners/provider_property_types/1335

{
  "property_type_id":1,
  "whodunnit":3
}
```

### Response

```
{
  "id":1335,
  "property_type_id":1,
  "name_en":"Hotels",
  "provider_property_type_code":"204",
  "provider_id":"6"
}
```

---
## Create Hotel

```
POST partners/hotels
```

When hotel created is called (mostly from neo), it first need to create a provider_hotel for the hotel first, then it creates a hotel and update back the hotel_id for the provider_hotel created earlier. So client needs to form params for both hotels and provider_hotels.

Hotel Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
1  | address                 | No        | Hash      | address as a hash of locale and translation      |
2  | description             | No        | Hash      | description as a hash of locale and translation  |
3  | star                    | No        | String    |                                                  |
4  | native_currency         | No        | String    |                                                  |
5  | longitude               | No        | Float     |                                                  |
6  | latitude                | No        | Float     |                                                  |
7  | built_year              | No        | String    |                                                  |
8  | renovated_year          | No        | String    |                                                  |
9  | source                  | No        | String    |                                                  |
10 | time_zone               | No        | String    |                                                  |
11 | gmt_offset              | No        | String    |                                                  |
12 | postal_code             | No        | String    |                                                  |
13 | email                   | No        | String    |                                                  |
14 | yearly_closures         | No        | String    |                                                  |
15 | reservation_phone       | No        | String    |                                                  |
16 | phone_1                 | No        | String    |                                                  |
17 | phone_2                 | No        | String    |                                                  |
18 | phone_3                 | No        | String    |                                                  |
10 | fax                     | No        | String    |                                                  |
11 | check_in                | No        | String    |                                                  |
12 | check_out               | No        | String    |                                                  |
13 | accessible_rooms_count  | No        | Number    |                                                  |
14 | non_smoking_rooms_count | No        | Number    |                                                  |
15 | rooms_count             | No        | Array     |                                                  |
16 | suites_count            | No        | Number    |                                                  |
17 | floors_count            | No        | Number    |                                                  |
18 | url                     | No        | String    |                                                  |
10 | url_params              | No        | String    |                                                  |

Provider Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
1  | address                 | No        | Hash      | address as a hash of locale and translation      |
2  | description             | No        | Hash      | description as a hash of locale and translation  |
3  | star                    | No        | String    |                                                  |
4  | native_currency         | No        | String    |                                                  |
5  | longitude               | No        | Float     |                                                  |
6  | latitude                | No        | Float     |                                                  |
7  | built_year              | No        | String    |                                                  |
8  | renovated_year          | No        | String    |                                                  |
9  | source                  | No        | String    |                                                  |
10 | time_zone               | No        | String    |                                                  |
11 | gmt_offset              | No        | String    |                                                  |
12 | postal_code             | No        | String    |                                                  |
13 | email                   | No        | String    |                                                  |
14 | yearly_closures         | No        | String    |                                                  |
15 | reservation_phone       | No        | String    |                                                  |
16 | phone_1                 | No        | String    |                                                  |
17 | phone_2                 | No        | String    |                                                  |
18 | phone_3                 | No        | String    |                                                  |
10 | fax                     | No        | String    |                                                  |
11 | check_in                | No        | String    |                                                  |
12 | check_out               | No        | String    |                                                  |
13 | accessible_rooms_count  | No        | Number    |                                                  |
14 | non_smoking_rooms_count | No        | Number    |                                                  |
15 | rooms_count             | No        | Array     |                                                  |
16 | suites_count            | No        | Number    |                                                  |
17 | floors_count            | No        | Number    |                                                  |
18 | url                     | No        | String    |                                                  |
10 | url_params              | No        | String    |                                                  |


Provider Related Params

No | Property               | Required? | Data Type | Description                                       |
---| -----------------------| --------- | --------- | --------------------------------------------------|
1  | provider_country       | No        | Hash      | To update/create country for provider_hotel       |
2  | provider_location      | No        | Hash      | To update/create location for provider_hotel      |
3  | provider_district      | No        | Hash      | To update/create country for provider_hotel       |
4  | provider_property_type | No        | Hash      | To update/create property_type for provider_hotel |
5  | provider_brand         | No        | Hash      | To update/create brand for provider_hotel         |
6  | provider_themes        | No        | String    | To update/create themes for provider_hotel        |
7  | provider_amenities     | No        | String    | To update/create amenities for provider_hotel     |


### Example

```
POST partners/hotels

{
  "name":"{\"en\""\"Silat Hostel\"}",
  "address":"{\"en\""\"150 Silat Ave #01-34\"}",
  "former_name":"{\"en\""\"Hostel at Silat\"}",
  "latitude":1.276767,
  "longitude":103.831342,
  "star":"2.0",
  "city_code":"SIN",
  "name_en":"Silat Hostel",
  "amenity_ids":"[1,2]",
  "theme_ids":[1, 2],
  "district_id":"724",
  "brand_id":"146",
  "check_in":"14"00"00",
  "check_out":"12"00"00",
  "postal_code":"160150",
  "description":"{\"en\""\"Nice Hotels at Silat Avenue\"}",
  "property_type_id":"2",
  "floors_count":"5",
  "rooms_count":"10",
  "built_year":"2005",
  "renovated_year":"1010",
  "reservation_phone":"84078313",
  "create_provider_hotel":true,
  "whodunnit":3,
  "provider_hotel": {
    "provider_id":100,
    "provider_country":{"country_id":197, "name":"Singapore", "code":"SG"},
    "provider_location":{"location_id":6667, "name":{"en":"Singapore"}, "provider_location_code":"SIN"},
    "provider_brand":{"brand":{"name":{"en":"Hotels and Preference"}, "brand_id":146}},
    "provider_district":{"district_id":724, "name":{"en":"Chinatown"}, "provider_district_code":724},
    "provider_property_type":{"name":{"en":"Hostel / Backpacker"}, "provider_property_type_code":2, "property_type_id":2 },
    "name":{"en"":"Silat Hostel"},
    "address":{"en"":"150 Silat Ave #01-34"},
    "former_name":{"en"":"Hostel at Silat"},
    "description":{"en"":"Nice Hotels at Silat Avenue"},
    "latitude":1.276767,
    "longitude":103.831342,
    "floors_count":"5",
    "rooms_count":"10",
    "built_year":"2005",
    "renovated_year":"1010",
    "reservation_phone":"84078313",
    "star":"2.0",
    "check_in":"14"00"00",
    "check_out":"12"00"00",
    "postal_code":"160150",
    "provider_amenities":"[1,2]",
    "provider_themes":[1, 2],
    "provider_property_id":"5bf6fe30-46bc-0136-1318-705681ae2afd"
  }
}

```

### Response

```
{
  "id":1985691,
  "name":"{\"en\":\"Silat Hostel\"}",
  "address":"{\"en\":\"150 Silat Ave #01-34\"}",
  "former_name":"{\"en\":\"Hostel at Silat\"}",
  "city_code":"SIN",
  "district_id":724,
  "brand_id":146,
  "latitude":"1.276767",
  "longitude":"103.831342",
  "star":2,
  "check_in":"14:00:00",
  "check_out":"12:00:00",
  "postal_code":"160150",
  "description":"{\"en\":\"Nice Hotels at Silat Avenue\"}",
  "property_type_id":2,
  "floors_count":5,
  "rooms_count":10,
  "built_year":"2005",
  "renovated_year":"1010",
  "reservation_phone":"84078313",
  "create_provider_hotel":true,
  "name_en":"Silat Hostel",
  "amenity_ids":"[1,2]",
  "theme_ids":[1, 2],
  "permalink":"silat-hostel-1985691",
  "live":false
}
```

---

## Update Hotel

```
PUT partners/hotels/hotel_id
```

When hotel update is called, it does not directly update the hotel record but update the corresponding provider_hotel record of that hotel with provider_id = 100 (this is what we call Wego provider_hotel). Then hotel syncing is called to sync provider_hotels data to hotels table. Paramenters for updating provider_hotel:

Primitive Params

No | Property                | Required? | Data Type | Description                                      |
---| ------------------------| --------- | --------- | -------------------------------------------------|
1  | name                    | No        | Hash      | name as a hash of locale and translation         |
2  | former_name             | No        | Hash      | former_name as a hash of locale and translation  |
3  | address                 | No        | Hash      | address as a hash of locale and translation      |
4  | description             | No        | Hash      | description as a hash of locale and translation  |
5  | star                    | No        | String    |                                                  |
6  | native_currency         | No        | String    |                                                  |
7  | longitude               | No        | Float     |                                                  |
8  | latitude                | No        | Float     |                                                  |
9  | built_year              | No        | String    |                                                  |
10 | renovated_year          | No        | String    |                                                  |
11 | source                  | No        | String    |                                                  |
12 | time_zone               | No        | String    |                                                  |
13 | gmt_offset              | No        | String    |                                                  |
14 | postal_code             | No        | String    |                                                  |
15 | email                   | No        | String    |                                                  |
16 | yearly_closures         | No        | String    |                                                  |
17 | reservation_phone       | No        | String    |                                                  |
18 | phone_1                 | No        | String    |                                                  |
19 | phone_2                 | No        | String    |                                                  |
20 | phone_3                 | No        | String    |                                                  |
21 | fax                     | No        | String    |                                                  |
22 | check_in                | No        | String    |                                                  |
23 | check_out               | No        | String    |                                                  |
24 | accessible_rooms_count  | No        | Number    |                                                  |
25 | non_smoking_rooms_count | No        | Number    |                                                  |
26 | rooms_count             | No        | Array     |                                                  |
27 | suites_count            | No        | Number    |                                                  |
28 | floors_count            | No        | Number    |                                                  |
29 | url                     | No        | String    |                                                  |
30 | url_params              | No        | String    |                                                  |


Related Params

No | Property               | Required? | Data Type | Description                                       |
---| -----------------------| --------- | --------- | --------------------------------------------------|
1  | provider_country       | No        | Hash      | To update/create country for provider_hotel       |
2  | provider_location      | No        | Hash      | To update/create location for provider_hotel      |
3  | provider_district      | No        | Hash      | To update/create country for provider_hotel       |
4  | provider_property_type | No        | Hash      | To update/create property_type for provider_hotel |
5  | provider_brand         | No        | Hash      | To update/create brand for provider_hotel         |
6  | provider_themes        | No        | String    | To update/create themes for provider_hotel        |
7  | provider_amenities     | No        | String    | To update/create amenities for provider_hotel     |


### Example

```
PUT partners/hotels/258074

{
  "provider_hotel": {
    "provider_id":100,
    "provider_country":
      {
        "country_id":197,
        "name":"Singapore",
        "code":"SG"
      },
    "provider_location": 
      {
        "location_id":6667
        "name": {"en":"Singapore"},
        "provider_location_code":"SIN"
      },
    "provider_property_id":258074",
    "hotel_id":"258074",
    "renovated_year:"2000",
    "provider_themes":"[1, 5],
    "whodunnit":3
  }
}
```

### Response

```
{
  "id":258074,
  "district_id":721,
  "city_code":"SIN",
  "name":"{\"en\":\"Village Hotel Changi\"}",
  "address":"{\"en\":\"1 Netheravon Road\"}",
  "description":nil,
  "amenity_ids":"[]",
  "floors_count":nil,
  "rooms_count":380,
  "suites_count":nil,
  "accessible_rooms_count":nil,
  "non_smoking_rooms_count":nil,
  "star":4,
  "longitude":"103.986",
  "latitude":"1.39054",
  "native_currency":"SGD",
  "time_zone":"Asia/Singapore",
  "gmt_offset":"8",
  "postal_code":"508502",
  "website":nil,
  "email":nil,
  "built_year":nil,
  "renovated_year":"2000",
  "yearly_closures":nil,
  "reservation_phone":nil,
  "phone_1":nil,
  "phone_2":nil,
  "phone_3":nil,
  "fax":nil,
  "check_in":"14:00:00",
  "check_out":"12:00:00",
  "created_at":"2016-12-11T20:09:33.000Z",
  "updated_at":"2018-05-31T02:25:53.000Z",
  "brand_id":392,
  "property_type_id":2
}
```

---

## Delete Hotel

```
DELETE partners/hotels/hotel_id
```

Params

No | Property                | Required? | Data Type | Description                       |
---| ------------------------| --------- | --------- | ----------------------------------|
1  | whodunnit               | No        | Hash      | id of user who trigger the action |

### Example

```
DELETE partners/hotels/1985691
{
  whodunnit: 3
}

```

### Response

```
status: 200
```
---

## Update city_code for Hotels

This endpoint is called from ```place-services``` in a callback of a city instance when its code changed. Let say when code of a city changes, city_code for hotels in that city need to be changed accordingly. That's when ```place-services``` sends a request to this endpoint to update city_code of hotels

```
POST partners/hotels/update_city_code
```

Params

No | Property                | Required? | Data Type | Description                       |
---| ------------------------| --------- | --------- | ----------------------------------|
1  | old_city_code           | No        | String    | Update hotels of this city_code   |
2  | district_id             | No        | Number    | Update hotels of this district_id |
3  | new_city_code           | Yes       | Stirng    | New city_code of hotels           |

### Example

```
POST partners/hotels/update_city_code
{
  old_city_code: "12345",
  new_city_code: "THD"
}

```

### Response

```
status: 200
```
---

## Update Images

In images syncing, we do not want lambda to save images directly to the db so it will do that via this endpoint.

```
POST partners/hotels/update_images
```

Params

Its an array of images, each has the following params:

No | Property    | Required? | Data Type | Description           |
---|-------------|-----------|-----------|-----------------------|
1  | id          | No        | String    | Image id              |
2  | url         | No        | String    | Image url             |
3  | description | No        | String    | Image Description     |
4  | hotel_id    | No        | Number    | id of image hotel     |
5  | primary     | No        | Boolean   | Primary image or not  |
6  | width       | No        | Number    | Image width           |
7  | height      | No        | Number    | Image height          |
8  | phash       | No        | String    | Image phash           |
9  | score       | No        | Number    | Image score           |
10 | source      | No        | String    | Image provider        |


### Example

```
POST partners/hotels/update_city_code
{
  images: [
    { id: 57169, url: "https://res.cloudinary.com/wego/image/upload/v1488816283/Partner/hotels/20903/57169.jpg", hotel_id: 20903 }
    { id: 88487, url: "https://res.cloudinary.com/wego/image/upload/v1488572432/Partner/hotels/769537/88487.jpg", hotel_id: 769537 }
    { id: 98453, url: "https://res.cloudinary.com/wego/image/upload/v1489349579/Partner/hotels/480931/98453.jpg", hotel_id: 480931 }
  ]
}

```

### Response

```
status: 200
```
---

## Bulk Update

Sometimes we want to update attributes for a bunch of hotels (mostly by the means of uploading csv file from neo). This endpoint is for that purpose

```
POST partners/hotels/bulk_update
```

Params

Its an array of hotel attributes:

No | Property    | Required? | Data Type | Description           |
---|-------------|-----------|-----------|-----------------------|
1  | id          | No        | String    | id of hotel to update |
2  | city_code   | No        | String    | updated city_code     |
3  | district_id | No        | Number    | updated district_id   |
4  | brand_id    | No        | Number    | updated brand_id      |
5  | name        | No        | String    | updated name          |
6  | locale      | No        | String    | locale for name       |

### Example

```
POST partners/hotels/bulk_update
{
  hotels: [
    { id: 1, district_id: 2 }
    { id: 2, district_id: 2 }
    { id: 3, district_id: 2 }
  ]
}

```

### Response

```
{
  success: [
    '1: Sucessfully updated',
    '2: Sucessfully updated',
    '3: Sucessfully updated'
  ]
}
```
---

## GET Activity

```
GET partners/activity
```

Parameters

No | Property             | Required? | Data Type | Description                                               |
---| ---------------------| --------- | --------- | ----------------------------------------------------------|
1  | locale               | Yes       | String    | User selected locale                                      |
2  | site_code            | Yes       | String    | User selected site_code                                   |
3  | currency_code        | No        | String    | User selected currency                                    |
4  | keyTransform         | No        | String    | Default camelCase. Can be underscore                      |

### Example

* `partners/activity?locale=en&site_code=SG&currency=AUD`

### Response

```
{
  "providerCode": "getyourguide.com",
  "deeplinkUrl": "https://www.getyourguide.com?partner_id=OKVBRN8&currency=AUD"
}
```

---
