# Wego Redis Static Data

### [Places](#places)

* [Airports](#airports)
* [Cities](#cities)
* [Districts](#districts)
* [States](#states)
* [Countries](#countries)
* [World regions](#world-regions)
* [Currencies](#currencies)

* * *

### [Flights](#flights)

* [Aircrafts](#aircrafts)
* [Airlines](#airlines)
* [Providers](#providers)
* [Provider Routes](#provider-routes)
* [Routes](#routes)
* [Payment Methods](#payment-methods)
* [Payment Fees](#payment-fees)
* [Flight Ecpcs](#flight-ecpcs)
* [Fare Conditions](#fare-conditions)

* * *

### [Hotels](#hotels)

* [Hotels](#hotels)
* [Providers](#hotel-providers)
* [Brands](#brands)
* [Chains](#chains)
* [Property Types](#property-types)
* [Themes](#themes)
* [Amenites](#amenites)
* [Rate Amenities](#rate_amenities)
* [Baseline Scores](#baseline-scores)
* [Experiment Scores](#experiment-scores)
* [Base Scores](#base-scores)
* [Default Hosts](#default-hosts)
* [Site Configs](#site-configs)
* [Usual Prices](#usual-prices)
* [Room Type Categories](#room-type-categories)
* [Hotel Name Language](#hotel-name-language)

* * *

### [Partners](#partners)

* [Provider Location](#provider-location)
* [Provider District](#provider-district)

---

## Places

### Airports

List of all airports with key including airport code:

| Key format        | Value type| Command                 |
|-------------------|-----------|-------------------------|
| `place:airports`  | Hash      | hget, hgetall, hvals    |

Example:

```
"place:airports": {
  "<airportCode1>"=>"{"code":<airportCode1>,"cityCode":<cityCode1>","nameI18n":{"en":"English name},"stationType":"airport"}"
}
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| cityCode    | String    | city code of the airport      |
| nameI18n    | Hash      | name with locale translations |
| stationType | String    | airport                       |

#### Query

```
hget place:airports SIN

"{"code":"SIN","cityCode":"SIN","nameI18n":{"en":"Singapore Changi Airport","es":"Changi","it":"Changi"},"stationType":"airport"}"
```


### Cities

List of all cities with key including city code:

| Key format                    | Value type| Command     |
|-------------------------------|-----------|-------------|
| `place:city:code:<cityCode>`  | String    | get         |

```
"place:city:code:<cityCode1>": "{"id": "id1","code":<cityCode1>,"nameI18n":{"en":"English name},"countryCode":"countryCode1","stateCode":"stateCode1","timeZone":"timeZone1","dstStartTime":"dstStartTime1","dstEndTime":"dstEndTime2","dstTimeZone":"dstTimeZone1"}"

"place:city:code:<cityCode2>": "{"id": "id2","code":<cityCode2>,"nameI18n":{"en":"English name},"countryCode":"countryCode2","stateCode":"stateCode2","timeZone":"timeZone2","dstStartTime":"dstStartTime2","dstEndTime":"dstEndTime2","dstTimeZone":"dstTimeZone2"}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description                |
| -------------|-----------| ------------------------------|
| id           | Integet   | airport code                  |
| code         | String    | city code                     |
| nameI18n     | Hash      | name with locale translations |
| countryCode  | String    | country code                  |
| stateCode    | String    | state code                    |
| timeZone     | String    | time zone                     |
| dstStartTime | String    |                               |
| dstEndTime   | String    |                               |
| dstTimeZone  | String    |                               |

#### Query

```
get place:city:code:SIN

"{"id":6667,"code":"SIN","nameI18n":{"de":"Singapur","pl":"Singapur","en":"Singapore"},"countryCode":"SG","stateCode":null,"timeZone":"+08:00","dstStartTime":null,"dstEndTime":null,"dstTimeZone":null}"
```


### Districts

List of all districts with key including district id:

| Key format                           | Value type| Command     |
|--------------------------------------|-----------|-------------|
| `place:district:id:<districtId>`     | String    | get         |

```
"place:district:id:<districtId1>": "{"id":<districtId1>,"cityCode":<cityCode1>,"nameI18n":{"en":"English name}"}"

"place:district:id:<districtId2>": "{"id":<districtId2>,"cityCode":<cityCode2>,"nameI18n":{"en":"English name}"}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| id          | Integer   | district id                   |
| nameI18n    | Hash      | name with locale translations |
| cityCode    | String    | city code of the district     |

#### Query

```
get place:district:id:1

"{"id":1,"nameI18n":{"en":"Recoleta","fr":"Recoleta","it":"Recoleta","cityCode":"BUE"}"
```


### States

List of all states with key including state code:

| Key format                             | Value type| Command     |
|----------------------------------------|-----------|-------------|
| `place:state:code:<stateCode>`         | String    | get         |

```
"place:state:<stateCode1>": "{"code":<stateCode1>,"nameI18n":{"en":"English name},,"countryCode":<countryCode1>",

"place:state:<stateCode2>": "{"code":<stateCode2>,"nameI18n":{"en":"English name},,"countryCode":<countryCode2>",

...
```

#### Attributes in value

|  Attribute Name | Data type | Description                   |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| nameI18n    | Hash      | name with locale translations |
| countryCode | String    | country code of the state     |

#### Query

```
get place:state:IA

"{"code":"IA","nameI18n":{"en":"Iowa"},"countryCode":"US"}"
```


### Countries

List of all countries with key including country code:

| Key format                             | Value type| Command     |
|----------------------------------------|-----------|-------------|
| `place:country:code:<countryCode>`     | String    | get         |

```
"place:country:code:<countryCode1>": "{"code":<countryCode1>,"worldRegionCode":<worldRegionCode1>","nameI18n":{"en":"English name},"currencyCode":"currencyCode1"}"

"place:country:code:<countryCode2>": "{"code":<countryCode2>,"worldRegionCode":<worldRegionCode2>","nameI18n":{"en":"English name},"currencyCode":"currencyCode2"}"

...
```

#### Attributes in value

|  Attribute Name    | Data type | Description                                   |
| -------------------|-----------| ----------------------------------------------|
| code               | String    | country code                                  |
| worldRegionCode    | String    | world region code of the country in upper case|
| nameI18n           | Hash      | name with locale translations                 |
| currencyCode       | String    | currency code of the country                  |

#### Query

```
get place:country:code:SIN

"{"code":"SG","worldRegionCode":"I","nameI18n":{"es":"Singapur","en":"Singapore"},"currencyCode":"SGD"}"
```


### World regions

List of all world regions with key including world region code in uppercase:

| Key format                                   | Value type| Command     |
|----------------------------------------------|-----------|-------------|
| `place:worldRegion:code:<worldRegionCode>`   | String    | get         |

```
"place:worldRegion:code:<worldRegionCode1>": "{"code":<worldRegionCode1>,"nameI18n":{"en":"English name}}"

"place:worldRegion:code:<worldRegionCode2>": "{"code":<worldRegionCode2>,"nameI18n":{"en":"English name}}"

...
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|---------------| ------------------------------|
| code        | String        | world region code upper case  |
| nameI18n    | Hash          | name with locale translations |

#### Query

```
get place:worldRegion:code:i

{"code":"i","nameI18n":{"fr":"Asie","en":"Asia"}}"

```

---

### Currencies

List of all country currencies

| Key format                      | Value type| Command                   |
|---------------------------------|-----------|---------------------------|
| `place:currencies`              | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
"place:currencies": {
  "AED"=>"{\"code\":\"AED\",\"base\":\"USD\",\"rate\":\"3.673014\"}",
  "SGD"=>"{\"code\":\"SGD\",\"base\":\"USD\",\"rate\":\"1.362432\"}"
}
```

##### Query

```
hget "place:currencies" "SGD"

"{\"code\":\"SGD\",\"base\":\"USD\",\"rate\":\"1.362432\"}"

```

#### Attributes in value

| Attribute | Data type | Description                                   |
| ----------|-----------| ----------------------------------------------|
| code      | String    | Currency code                                 |
| base      | String    | Base currency code (USD)                      |
| rate      | Double    | Rate of the currency compared to the base one |

---


## Flights

### Aircrafts

List of all aircrafts

| Key format                             | Value type| Command              |
|----------------------------------------|-----------|----------------------|
| `flight:aircrafts`                     | Hash      | hget, hgetall, hvals |

Example:

```
"flight:aircrafts": {
  "<aircraftCode1>"=>"{"code":<aircraftCode1>,"nameI18n":{"en":"English name},"starRating":1}",
}
```

#### Attributes in value

|  Attribute Name | Data type | Description               |
| ------------|-----------| ------------------------------|
| code        | String    | airport code                  |
| nameI18n    | Hash      | name with locale translations |
| starRating  | Integer   |                               |

##### Query

```
hget flight:aircrafts ERJ

"{"code":"ERJ","nameI18n":{"en":"Embraer RJ 135/140/145"},"starRating":3.0}"
```


### Airlines

List of all airlines

| Key format                           | Value type| Command               |
|--------------------------------------|-----------|-----------------------|
| `flight:airlines`                    | Hash      | hget, hgetall, hvals  |

```
"flight:airlines": {
  "OF"=>"{\"code\":\"OF\",\"starRating\":12.0,\"nameI18n\":{\"en\":\"Overland Airways\",\"tr\":\"Overland Hava Yollar\xc4\xb1\"},\"allianceCode\":null,\"marketingAirlineCode\":\"OF\",\"direct\":false,\"excludedDirectPos\":[]}",
}
```

#### Attributes in value

|  Attribute Name | Data type | Description                   |
| ----------------|-----------| ------------------------------|
| code            | String    | airport code                  |
| nameI18n        | Hash      | name with locale translations |
| starRating      | Integer   |                               |
| allianceCode    | String    |                               |
| marketingAirlineCode | String	|			      |
| direct	  | boolean   | true if the airline has restriction |


##### Query

```
hget flight:airlines OF

"{\"code\":\"OF\",\"starRating\":12.0,\"nameI18n\":{\"en\":\"Overland Airways\",\"tr\":\"Overland Hava Yollar\xc4\xb1\"},\"allianceCode\":null,\"marketingAirlineCode\":\"OF\",\"direct\":false,\"excludedDirectPos\":[]}"
```


### Providers

List of all flight providers

| Key format                             | Value type| Command              |
|----------------------------------------|-----------|----------------------|
| `flight:providers`                     | Hash      | hget, hgetall, hvals |

```
"flight:providers": {
  "wego.com"=>"{\"code\":\"wego.com\",\"name\":\"wego.com\",\"parentCode\":\"wego.com\",\"type\":\"ota\",\"mobileFriendly\":null,\"facilitatedBooking\":false,\"airlineCode\":null,\"configs\":null,\"deviceTypes\":\"[\\\"mobile\\\",\\\"tablet\\\",\\\"desktop\\\"]\",\"appTypes\":\"[\\\"*\\\"]\",\"ecpcRank\":null,\"status\":\"production\",\"onlyAirportSupported\":\"false\",\"faresLimit\":100,\"onewayFaresLimit\":10,\"siteCodes\":null,\"noSiteCodes\":null,\"locales\":\"[\\\"*\\\"]\",\"departureCodes\":null,\"passengerTypes\":\"[\\\"adults\\\",\\\"children\\\"]\",\"cabins\":\"[\\\"economy\\\",\\\"business\\\",\\\"first\\\"]\"}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                            |
| ----------------------|-----------| ---------------------------------------|
| code                  | String    | provider code                          |
| name                  | String    | provider name                          |
| parentCode            | String    | provider parent code                   |
| type                  | String    | provider type                          |
| mobileFriendly        | String    | is provider mobile friendly            |
| facilitatedBooking    | String    | take part in wego facilitated booking? |
| airlineCode	          | String	  | code of the tied airline               |           
| configs               | String    | configuration info                     |
| deviceTypes           | String    | list of supported device types         |
| appTypes              | String    | list of supported app types            |
| status                | String    | status of provider                     |
| onlyAirportSupported  | Bolean    | is airport only supported              |
| faresLimit            | Integer   | fares limit number                     |
| onewayFaresLimit      | Integer   | oneway fare limit number               |
| siteCodes             | String    | list of supported site codes           |
| noSiteCodes           | String    | list of unsupported side codes         |
| locales               | String    | list of supported locales             |
| departureCodes        | String    | list of supported departure codes      |
| passengerTypes        | String    | list of supported passenger types       |
| cabins                | String    | list of supported cabins               |

##### Query

```
hget flight:providers wego.com

{\"code\":\"wego.com\",\"name\":\"wego.com\",\"parentCode\":\"wego.com\",\"type\":\"ota\",\"mobileFriendly\":null,\"facilitatedBooking\":false,\"airlineCode\":null,\"configs\":null,\"deviceTypes\":\"[\\\"mobile\\\",\\\"tablet\\\",\\\"desktop\\\"]\",\"appTypes\":\"[\\\"*\\\"]\",\"ecpcRank\":null,\"status\":\"production\",\"onlyAirportSupported\":\"false\",\"faresLimit\":100,\"onewayFaresLimit\":10,\"siteCodes\":null,\"noSiteCodes\":null,\"locales\":\"[\\\"*\\\"]\",\"departureCodes\":null,\"passengerTypes\":\"[\\\"adults\\\",\\\"children\\\"]\",\"cabins\":\"[\\\"economy\\\",\\\"business\\\",\\\"first\\\"]\"}"
```

### Provider Routes

List of all flight provider routes including with pos provider code

| Key format                                                 | Value type| Command              |
|------------------------------------------------------------|-----------|----------------------|
| `flight:providerRoutes:posProviderCode:<posProviderCode>`  | Hash      | hget, hgetall, hvals |

```
"flight:providers:posProviderCode:wego.com": {
  "1220775"=>"{\"t\":1,\"r\":\"*-*\",\"d\":true}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                                                              |
| ----------------------|-----------| -------------------------------------------------------------------------|
| t                     | String    | route type(1 is airport, 2 is country, 3 is no airport, 4 is no country) |
| r                     | String    | route (the combination of departure code and arrival code)               |
| d                     | Boolean   | flag for direct flight filter                                            |

##### Query

```
hget flight:providers:posProviderCode:wego.com 1220775

"{\"t\":1,\"r\":\"*-*\",\"d\":true}"

```

### Routes

List of all flight routes including with airline code

| Key format                                                 | Value type| Command              |
|------------------------------------------------------------|-----------|----------------------|
| `flight:routes:airlineCode:<airlineCode>`                  | Hash      | hget, hgetall, hvals |

```
"flight:routes:airlineCode:SQ": {
  "4915962"=>"{\"r\":\"SIN-YVR\",\"st\":\"active\"}"
}
...
```

#### Attributes in value

|  Attribute Name       | Data type | Description                                                             |
| ----------------------|-----------| ------------------------------------------------------------------------|
| r                     | String    | route (the combination of departure code and arrival code)              |
| st                    | String    | status                                                                  |

##### Query

```
hget flight:routes:airlineCode:SQ 4915962

"{\"r\":\"SIN-YVR\",\"st\":\"active\"}"

```


### Payment Methods

List of all payment methods for flight

| Key format                           | Value type| Command              |
|--------------------------------------|-----------|----------------------|
| `flight:paymentMethods`              | Hash      | hget, hgetall, hvals |

```
"flight:paymentMethods": {
  "VISA"=>"{\"id\":14,\"name\":\"Visa\",\"code\":\"VISA\"}"
}
...
```

#### Attributes in value

|  Attribute Name | Data type | Description     |
| ----------------|-----------| --------------------|
| id              | Integer   | Payment method id   |
| name            | String    | Payment method name |
| code            | String    | Payment method code |

##### Query

```
hget flight:paymentMethods VISA

"{\"id\":14,\"name\":\"Visa\",\"code\":\"VISA\"}"
```

### Payment Fees

List of all payment fees for flight

| Key format                           | Value type| Command              |
|--------------------------------------|-----------|----------------------|
| `flight:paymentFees`                 | Hash      | hget, hgetall, hvals |

```
"flight:paymentFees": {
  "2892"=>"{\"id\":2892,\"paymentMethodCode\":\"MASTERCARD_CREDIT\",\"posProviderCode\":\"hop2.com\",\"siteCode\":\"*\",\"amount\":0.0,\"amountMin\":0.0,\"amountMax\":0.0,\"percentage\":0.0,\"currencyCode\":null,\"departureCountry\":null,\"arrivalCountry\":null,\"alliance\":null,\"tripType\":null}"
}
...
```

#### Attributes in value

|  Attribute Name   | Data type | Description           |
| ------------------|-----------| ----------------------|
| id                | Integer   | payment fee id        |
| paymentMethodCode | Integer   | payment method code   |
| posProviderCode   | String    | pos provider cod      |
| amount            | Float     | amount                |
| amountMin         | Float     | min amount            |
| amountMax         | Float     | max amount            |
| percentage        | Float     | percentage            |
| currencyCode      | String    | currency code         |
| departureCountry  | String    | departure country     |
| arrivalCountry    | String    | arrival country       |
| alliance          | String    | aliance               |
| tripType          | String    | trip type             |

##### Query

```
hget flight:paymentFees 2892

"{\"id\":2892,\"paymentMethodCode\":\"MASTERCARD_CREDIT\",\"posProviderCode\":\"hop2.com\",\"siteCode\":\"*\",\"amount\":0.0,\"amountMin\":0.0,\"amountMax\":0.0,\"percentage\":0.0,\"currencyCode\":null,\"departureCountry\":null,\"arrivalCountry\":null,\"alliance\":null,\"tripType\":null}"
```


### Flight Ecpcs

List of all flight ecpc with key including provider code and value will be a hash in which fields are site_code:

| Key format                                  | Value type| Command           |
|---------------------------------------------|-----------|-------------------|
| `flight:ecpc:providerCode:<provider_code>`  | Hash      | hvals/hkeys/hget  |

```
"flight:ecpc:providerCode:<providerCode1>": {
  "ZA": "providerCode":<providerCode1>,"siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67},
  "BR": "providerCode":<providerCode1>,"siteCode":"BR","amountUsd":0.31,"percentMobile":48.67}
}

"flight:ecpc:providerCode:<providerCode2>": {
  "SG": "providerCode":<providerCode2>,"siteCode":"SG","amountUsd":0.67,"percentMobile":49.76},
  "HK": "providerCode":<providerCode2>,"siteCode":"HK","amountUsd":0.67,"percentMobile":49.76}
}
...
```

#### Attributes in value

| Attribute Name | Data type | Description                  |
| --------------|-----------| ------------------------------|
| providerCode  | String    | provider code                 |
| siteCode      | String    | site code                     |
| amountUsd     | Integer   | ecpc value in USD             |
| percentMobile | Integer   |                               |

##### Query

```
hkeys flight:ecpc:providerCode:expedia.com.ph

 1) "ZA"
 2) "BR"
 3) "QA"
 ...

```

```
hvals flight:ecpc:providerCode:expedia.com.ph

 1) "{"providerCode":"expedia.com.ph","siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67}"
 2) "{"providerCode":"expedia.com.ph","siteCode":"BR","amountUsd":0.31,"percentMobile":48.67}"
 3) "{"providerCode":"expedia.com.ph","siteCode":"QA","amountUsd":0.31,"percentMobile":48.67}"
 ...

```

```
hget flight:ecpc:providerCode:expedia.com.ph ZA

"{"providerCode":"expedia.com.ph","siteCode":"ZA","amountUsd":0.31,"percentMobile":48.67}"

```



### Fare Conditions

List of all Fare Conditions with key including id and value will be a string of full object or key alias by code with value is the id.

| Key format                         | Value type | Command |
| ---------------------------------- | ---------- | ------- |
| `flight:fareCondition:id:<id>`     | String     | get     |
| `flight:fareCondition:code:<code>` | String     | get     |

```
"flight:fareCondition:id:<id>": "{"id":<id>,"code":"<code>","nameI18n":{"en":"English name","ar":"Arabic name"}}"
```

Or by Alias:

```
"flight:fareCondition:code:<code>": "<id>"
```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| -------------- | --------- | ----------------------------- |
| id             | Integer   | id                            |
| code           | String    | fare condition code           |
| nameI18n       | Hash      | name with locale translations |

##### Query

```
get flight:fareCondition:id:1

"{\"id\":1,\"code\":\"REFUNDABLE\",\"nameI18n\":{\"en\":\"Refundable\",\"ar\":\"\xd9\x82\xd8\xa7\xd8\xa8\xd9\x84\xd8\xa9 \xd9\x84\xd9\x84\xd8\xa7\xd8\xb3\xd8\xaa\xd8\xb1\xd8\xaf\xd8\xa7\xd8\xaf\"}}"
```

Or by Alias:

```
get flight:fareCondition:code:REFUNDABLE

"1"
```



## Hotels

### Hotels

Hotels are grouped by City Codes.

List of all hotels

| Key format                           | Value type| Command           |
|--------------------------------------|-----------|-------------------|
| `hotel:hotel:cityCode:<cityCode>`     | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
  "hotel:hotel:cityCode:SIN": {
    "258080": "{\"id\":258080,\"cityCode\":\"SIN\",\"districtId\":719,\"brandId\":212,\"propertyTypeId\":14,\"longitude\":\"103.837875723839\",\"latitude\":\"1.3007086725967\",\"star\":5,\"distanceToCityCentre\":2.23319,\"nearestAirportCode\":\"SIN\",\"distanceToNearestAirport\":18.0136,\"name\":{\"vi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"en\":\"Pan Pacific Serviced Suites\",\"id\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ko\":\"팬 패시픽 서비스 스위트 오차드, 싱가폴\",\"ja\":\"パン パシフィック サービスド スイーツ オーチャード シンガポール\",\"ru\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"fr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"it\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"sv\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"pt\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"de\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ar\":\"أجنحة بان باسيفيك المخدومة أوركارد\",\"th\":\"แพน แปซิฟิค เซอร์วิส สวีท ออร์ชาร์ด สิงคโปร์\",\"pl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"tr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"es\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"hi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ml\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"nl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"cs\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"zh-tw\":\"泛太平洋服務公寓\",\"zh-cn\":\"新加坡泛太平洋服务公寓\",\"es-419\":\"Pan Pacific Serviced Suites Orchard, Singapore\"},\"address\":{\"en\":\"96 Somerset Road\",\"fr\":\"96 Somerset Road\",\"es\":\"96 Somerset Road\",\"de\":\"96 Somerset Road\",\"it\":\"96 Somerset Road\",\"nl\":\"96 Somerset Road\",\"sv\":\"96 Somerset Road\",\"es-419\":\"96 Somerset Road\"},\"amenityIds\":[1,2,3,5,6,7,9,10,11,18],\"themeIds\":[1],\"imagesCount\":29,\"images\":[{\"url\":\"http://res.cloudinary.com/wego/image/upload/v1465380566/hotels/258080/652636.jpg\",\"description\":{\"en\":\"Exterior View\"}},],\"reviews\":[{\"score\":92,\"count\":145,\"percentage\":100.0,\"reviewerGroup\":\"ALL\"},{\"score\":91,\"count\":18,\"percentage\":13.0,\"reviewerGroup\":\"COUPLE\"},{\"score\":88,\"count\":82,\"percentage\":57.0,\"reviewerGroup\":\"FAMILY\"},{\"score\":92,\"count\":43,\"percentage\":30.0,\"reviewerGroup\":\"SOLO\"}],\"badges\":[{\"text\":{\"ar\":\"الأفضل قيمه الفطور\",\"de\":\" Ausgezeichnete Lage\",\"en\":\"Excellent Location\",\"es\":\"Ubicación excelente\",\"fr\":\"Excellent emplacement\",\"id\":\"Lokasi yangTerbaik\",\"it\":\"Ottima posizione\",\"ja\":\"最高のロケーション\",\"ko\":\"최상급의 위치\",\"ms\":\"Lokasi Terbaik\",\"nl\":\"Fantastische locatie\",\"pl\":\"Świetna lokalizacja\",\"pt\":\"Excelente localização\",\"pt-br\":\"Excelente localização\",\"ru\":\"Прекрасное расположение\",\"sv\":\"Utmärkta läge\",\"th\":\"ที่ดีที่สุด สถานที่ตั้ง\",\"tr\":\"Mükemmel Konum\",\"vi\":\"Địa điểm Tốt nhất\",\"zh-cn\":\"极好的地点\",\"zh-tw\":\"極佳的位置\"},\"subtext\":{\"ar\":\"في المدينة 6% الآعلى\",\"de\":\"Top 6% der Stadt\",\"en\":\"Top 6% in city\",\"es\":\"Top 6% en la ciudad\",\"fr\":\"Top 6% en ville\",\"id\":\"Top 6% di kota\",\"it\":\"Top 6% in città\",\"ja\":\"市内でTop6%\",\"ko\":\"도시 내 TOP 6%\",\"ms\":\"6% teratas di bandar raya\",\"nl\":\"Top 6% in de stad\",\"pl\":\"Top 6% w mieście\",\"pt\":\"Top 6% na cidade\",\"pt-br\":\"Top 6% na cidade\",\"ru\":\"В числе лучших 6% в этом городе\",\"sv\":\"Topp 6% i stan\",\"th\":\"ยอดนิยม 6% ในเมือง\",\"tr\":\"En iyi %6 içinde\",\"vi\":\"Thuộc nhóm 6% đầu trong thành phố\",\"zh-cn\":\"市里首选6%\",\"zh-tw\":\"市排名前6%\"}},{\"text\":{\"ar\":\"ممتاز جدا  فندق  مناسب للعائلات\",\"de\":\"Ausgezeichnetes Familienhotel\",\"en\":\"Excellent Family Hotel\",\"es\":\"Excelente hotel familiar\",\"fr\":\"Excellent hôtel familial\",\"id\":\"Hotel Keluarga yang unggul\",\"it\":\"Ottimo hotel per famiglie\",\"ja\":\"すばらしいファミリーホテル\",\"ko\":\"최상급의 패밀리 호텔\",\"ms\":\"Hotel Keluarga yang Sangat Baik\",\"nl\":\"Uitstekend familiehotel\",\"pl\":\"Rewelacyjny hotel rodzinny\",\"pt\":\"Excelente hotel familiar\",\"pt-br\":\"Excelente hotel familiar\",\"ru\":\"Отличный семейный отель\",\"sv\":\"Utmärkt familjehotell\",\"th\":\"ยอดเยี่ยม โรงแรมสำหรับครอบครัว\",\"tr\":\"Aile için Mükemmel Otel\",\"vi\":\"Khách sạn Gia đình Xuất sắc \",\"zh-cn\":\"极佳的 家庭型酒店\",\"zh-tw\":\"極佳的 家庭型酒店\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}},{\"text\":{\"ar\":\"ممتازجدا  تصنيف كلي\",\"de\":\"Hervorragendes Ranking\",\"en\":\"Excellent Overall Ranking\",\"es\":\"Excelente clasificación general\",\"fr\":\"Excellent classement global\",\"id\":\"Peringkat Keseluruhan yang Hebat\",\"it\":\"Ottima classifica complessiva\",\"ja\":\"総合ランキング：すばらしい\",\"ko\":\"종합 랭킹: 최상급\",\"ms\":\"Kedudukan Keseluruhan yang Sangat Baik\",\"nl\":\"Fantastische  algemene score\",\"pl\":\"Ogólnie rewelacyjny wynik w rankingu\",\"pt\":\"Excelente classificação geral\",\"pt-br\":\"Excelente classificação geral\",\"ru\":\"Отличная общая оценка\",\"sv\":\"Utmärkt övergripande betyg\",\"th\":\"ยอดเยี่ยม คะแนนโดยรวม\",\"tr\":\"Genel Olarak: Mükemmel\",\"vi\":\"Xuất sắc Tổng Xếp hạng\",\"zh-cn\":\"整体排名极佳\",\"zh-tw\":\"整體排名極佳\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}}]}"
  }

```

#### Attributes in value

| Attribute Name           | Data type | Description                            |
| -------------------------|-----------| -------------------------------------- |
| id                       | Integer   | hotel ID                               |
| cityCode                 | String    |                                        |
| districtId               | Integer   |                                        |
| brandId                  | Integer   |                                        |
| propertyTypeId           | Integer   |                                        |
| longitude                | Float     |                                        |
| latitude                 | Float     |                                        |
| star                     | Integer   |                                        |
| distanceToCityCentre     | Float     |                                        |
| nearestAirportCode       | String    |                                        |
| distanceToNearestAirport | Float     |                                        |
| name                     | Hash      | Translated Names, key as locale        |
| formerName               | Hash      | Translated Former Names, key as locale |
| address                  | Hash      | Translated Addresses, key as locale    |
| amenityIds               | Array     | List of amenity IDs                    |
| themeIds                 | Array     | List of theme IDs                      |
| imagesCount              | Array     | Number of Images available             |
| images                   | Array     | List of Image objects                  |
| reviews                  | Array     | List of Review objects                 |
| badges                   | Hash      | List of Badges                         |


##### Query

```
hget hotel:hotel:cityCode:SIN 258080

"{\"id\":258080,\"cityCode\":\"SIN\",\"districtId\":719,\"brandId\":212,\"propertyTypeId\":14,\"longitude\":\"103.837875723839\",\"latitude\":\"1.3007086725967\",\"star\":5,\"distanceToCityCentre\":2.23319,\"nearestAirportCode\":\"SIN\",\"distanceToNearestAirport\":18.0136,\"name\":{\"vi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"en\":\"Pan Pacific Serviced Suites\",\"id\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ko\":\"팬 패시픽 서비스 스위트 오차드, 싱가폴\",\"ja\":\"パン パシフィック サービスド スイーツ オーチャード シンガポール\",\"ru\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"fr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"it\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"sv\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"pt\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"de\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ar\":\"أجنحة بان باسيفيك المخدومة أوركارد\",\"th\":\"แพน แปซิฟิค เซอร์วิส สวีท ออร์ชาร์ด สิงคโปร์\",\"pl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"tr\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"es\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"hi\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"ml\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"nl\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"cs\":\"Pan Pacific Serviced Suites Orchard, Singapore\",\"zh-tw\":\"泛太平洋服務公寓\",\"zh-cn\":\"新加坡泛太平洋服务公寓\",\"es-419\":\"Pan Pacific Serviced Suites Orchard, Singapore\"},\"formerName\":{\"en\":\"Sheraton Krabi Beach Resort\"},\"address\":{\"en\":\"96 Somerset Road\",\"fr\":\"96 Somerset Road\",\"es\":\"96 Somerset Road\",\"de\":\"96 Somerset Road\",\"it\":\"96 Somerset Road\",\"nl\":\"96 Somerset Road\",\"sv\":\"96 Somerset Road\",\"es-419\":\"96 Somerset Road\"},\"amenityIds\":[1,2,3,5,6,7,9,10,11,18],\"themeIds\":[1],\"imagesCount\":29,\"images\":[{\"url\":\"http://res.cloudinary.com/wego/image/upload/v1465380566/hotels/258080/652636.jpg\",\"description\":{\"en\":\"Exterior View\"}},],\"reviews\":[{\"score\":92,\"count\":145,\"percentage\":100.0,\"reviewerGroup\":\"ALL\"},{\"score\":91,\"count\":18,\"percentage\":13.0,\"reviewerGroup\":\"COUPLE\"},{\"score\":88,\"count\":82,\"percentage\":57.0,\"reviewerGroup\":\"FAMILY\"},{\"score\":92,\"count\":43,\"percentage\":30.0,\"reviewerGroup\":\"SOLO\"}],\"badges\":[{\"text\":{\"ar\":\"الأفضل قيمه الفطور\",\"de\":\" Ausgezeichnete Lage\",\"en\":\"Excellent Location\",\"es\":\"Ubicación excelente\",\"fr\":\"Excellent emplacement\",\"id\":\"Lokasi yangTerbaik\",\"it\":\"Ottima posizione\",\"ja\":\"最高のロケーション\",\"ko\":\"최상급의 위치\",\"ms\":\"Lokasi Terbaik\",\"nl\":\"Fantastische locatie\",\"pl\":\"Świetna lokalizacja\",\"pt\":\"Excelente localização\",\"pt-br\":\"Excelente localização\",\"ru\":\"Прекрасное расположение\",\"sv\":\"Utmärkta läge\",\"th\":\"ที่ดีที่สุด สถานที่ตั้ง\",\"tr\":\"Mükemmel Konum\",\"vi\":\"Địa điểm Tốt nhất\",\"zh-cn\":\"极好的地点\",\"zh-tw\":\"極佳的位置\"},\"subtext\":{\"ar\":\"في المدينة 6% الآعلى\",\"de\":\"Top 6% der Stadt\",\"en\":\"Top 6% in city\",\"es\":\"Top 6% en la ciudad\",\"fr\":\"Top 6% en ville\",\"id\":\"Top 6% di kota\",\"it\":\"Top 6% in città\",\"ja\":\"市内でTop6%\",\"ko\":\"도시 내 TOP 6%\",\"ms\":\"6% teratas di bandar raya\",\"nl\":\"Top 6% in de stad\",\"pl\":\"Top 6% w mieście\",\"pt\":\"Top 6% na cidade\",\"pt-br\":\"Top 6% na cidade\",\"ru\":\"В числе лучших 6% в этом городе\",\"sv\":\"Topp 6% i stan\",\"th\":\"ยอดนิยม 6% ในเมือง\",\"tr\":\"En iyi %6 içinde\",\"vi\":\"Thuộc nhóm 6% đầu trong thành phố\",\"zh-cn\":\"市里首选6%\",\"zh-tw\":\"市排名前6%\"}},{\"text\":{\"ar\":\"ممتاز جدا  فندق  مناسب للعائلات\",\"de\":\"Ausgezeichnetes Familienhotel\",\"en\":\"Excellent Family Hotel\",\"es\":\"Excelente hotel familiar\",\"fr\":\"Excellent hôtel familial\",\"id\":\"Hotel Keluarga yang unggul\",\"it\":\"Ottimo hotel per famiglie\",\"ja\":\"すばらしいファミリーホテル\",\"ko\":\"최상급의 패밀리 호텔\",\"ms\":\"Hotel Keluarga yang Sangat Baik\",\"nl\":\"Uitstekend familiehotel\",\"pl\":\"Rewelacyjny hotel rodzinny\",\"pt\":\"Excelente hotel familiar\",\"pt-br\":\"Excelente hotel familiar\",\"ru\":\"Отличный семейный отель\",\"sv\":\"Utmärkt familjehotell\",\"th\":\"ยอดเยี่ยม โรงแรมสำหรับครอบครัว\",\"tr\":\"Aile için Mükemmel Otel\",\"vi\":\"Khách sạn Gia đình Xuất sắc \",\"zh-cn\":\"极佳的 家庭型酒店\",\"zh-tw\":\"極佳的 家庭型酒店\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}},{\"text\":{\"ar\":\"ممتازجدا  تصنيف كلي\",\"de\":\"Hervorragendes Ranking\",\"en\":\"Excellent Overall Ranking\",\"es\":\"Excelente clasificación general\",\"fr\":\"Excellent classement global\",\"id\":\"Peringkat Keseluruhan yang Hebat\",\"it\":\"Ottima classifica complessiva\",\"ja\":\"総合ランキング：すばらしい\",\"ko\":\"종합 랭킹: 최상급\",\"ms\":\"Kedudukan Keseluruhan yang Sangat Baik\",\"nl\":\"Fantastische  algemene score\",\"pl\":\"Ogólnie rewelacyjny wynik w rankingu\",\"pt\":\"Excelente classificação geral\",\"pt-br\":\"Excelente classificação geral\",\"ru\":\"Отличная общая оценка\",\"sv\":\"Utmärkt övergripande betyg\",\"th\":\"ยอดเยี่ยม คะแนนโดยรวม\",\"tr\":\"Genel Olarak: Mükemmel\",\"vi\":\"Xuất sắc Tổng Xếp hạng\",\"zh-cn\":\"整体排名极佳\",\"zh-tw\":\"整體排名極佳\"},\"subtext\":{\"ar\":\"في المدينة 8% الآعلى\",\"de\":\"Top 8% der Stadt\",\"en\":\"Top 8% in city\",\"es\":\"Top 8% en la ciudad\",\"fr\":\"Top 8% en ville\",\"id\":\"Top 8% di kota\",\"it\":\"Top 8% in città\",\"ja\":\"市内でTop8%\",\"ko\":\"도시 내 TOP 8%\",\"ms\":\"8% teratas di bandar raya\",\"nl\":\"Top 8% in de stad\",\"pl\":\"Top 8% w mieście\",\"pt\":\"Top 8% na cidade\",\"pt-br\":\"Top 8% na cidade\",\"ru\":\"В числе лучших 8% в этом городе\",\"sv\":\"Topp 8% i stan\",\"th\":\"ยอดนิยม 8% ในเมือง\",\"tr\":\"En iyi %8 içinde\",\"vi\":\"Thuộc nhóm 8% đầu trong thành phố\",\"zh-cn\":\"市里首选8%\",\"zh-tw\":\"市排名前8%\"}}]}"
```

---

### Hotel Providers

| Key format                            | Value type | Command              |
|---------------------------------------|------------|----------------------|
| `hotel:providers`                     | Hash       | hget, hgetall, hvals |

Example:

```
 "hotel:providers": {
   "expedia.com.au" => "{\"id\":109,\"parentCode\":"\expedia.com\",\"code\":\"expedia.com.au\",\"name\":\"Expedia.com.au\",\"url\":\"http://www.expedia.com.au\",\"providerType\":\"ota\",\"status\":\"production\",\"mobile\":true,\"localTax\":\"breakdown\",\"siteCodes\":[\"*\"],\"noSiteCodes\":null,\"locales\":[\"*\"],\"deviceTypes\":[\"mobile\",\"tablet\",\"desktop\"]}"
```

#### Attributes in value

| Attribute Name | Data type |
| ---------------|-----------|
| id             | Integer   |
| parentId       | Integer   |
| code           | String    |
| name           | String    |
| url            | String    |
| providerType   | String    |
| status         | String    |
| mobile         | Boolean   |
| localTax       | String    |
| siteCodes      | Array     |
| noSiteCodes    |           |
| locales        | Array     |
| deviceTypes    | Array     |

##### Query

```
hget hotel:providers booking.com

"{\"id\":6,\"parentCode\":null,\"code\":\"booking.com\",\"name\":\"Booking.com\",\"url\":\"http://www.booking.com\",\"providerType\":\"ota\",\"status\":\"production\",\"mobile\":true,\"localTax\":\"breakdown\",\"siteCodes\":[\"*\"],\"noSiteCodes\":null,\"locales\":[\"*\"],\"deviceTypes\":[\"mobile\",\"tablet\",\"desktop\"]}"
```

---

### Brands

List of all Hotel Brands

| Key format                      | Value type| Command                   |
|---------------------------------|-----------|---------------------------|
| `hotel:brands`                  | Hash      | hvals/hkeys/hget/hgetall  |

Example:

```
"hotel:brands": {
  "772"=>"{\"id\":772,\"name\":{\"en\":\"Swiss-Belinn\"},\"chainId\":762,\"isChain\":true}",
  "362"=>"{\"id\":362,\"name\":{\"en\":\"Adagio Premium\"},\"chainId\":null,\"isChain\":false}",
  "543"=>"{\"id\":543,\"name\":{\"en\":\"Yitel\"},\"chainId\":542,\"isChain\":false}",
  "110"=>"{\"id\":110,\"name\":{\"en\":\"Six Senses Resorts \\u0026 Spas\",\"ar\":\"سيكس سينسز ومنتجعات\"},\"chainId\":null,\"isChain\":false}"
}
```

##### Query

```
hget "hotel:brands" "40"

"{\"id\":40,\"name\":{\"en\":\"Interstate Hotels and Resorts\",\"ar\":\"الطريق السريع للفنادق والمنتجعات\"},\"chainId\":null,\"isChain\":false}"

```

#### Attributes in value

| Attribute Name | Data type | Description                |
| ------------|-----------| ------------------------------|
| id        | Integer    | brand ID  |
| name    | Hash      | name with locale translations |
| chainId | Integer | Chain ID |
| isChain | Boolean | Indicates whether brand is a chain or not |

---

### Chains

List of all Hotel Chains

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:chains`                  | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:chains": {
    "965"=>"{\"id\":965,\"name\":{\"en\":\"Red Planet\"}}",
    "204"=>"{\"id\":204,\"name\":{\"en\":\"Preferred Hotel Group\",\"ar\":\"فنادق مفضلة، ومنتجعات في جميع أنحاء العالم\"}}",
    "879"=>"{\"id\":879,\"name\":{\"en\":\"Residhome Aparthotel\"}}"
 }

```

##### Query

```
hget "hotel:chains" "775"

"{\"id\":775,\"name\":{\"en\":\"Bennecke \"}}"

```

#### Attributes in value

| Attribute Name | Data type | Description                |
| ------------|-----------| ------------------------------|
| id        | Integer    | chain ID  |
| name    | Hash      | name with locale translations |

---

### Property Types

List of all hotel property types

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:propertyTypes`           | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:propertyTypes": {
    "8"=>"{\"id\":8,\"name\":{\"en\":\"City Hotel\"}}",
    "17"=>"{\"id\":17,\"name\":{\"en\":\"Beach Hotel\",\"ar\":\"فنادق مفضلة، ومنتجعات في جميع أنحاء العالم\"}}"
 }

```

##### Query

```
hget hotel:propertyTypes 8

"{\"id\":8,\"name\":{\"en\":\"City Hotel\"}}",

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ------------   |-----------| ------------------------------|
| id             | Integer   |                               |
| name           | Hash      | name with locale translations |

---

### Themes

List of all Hotel Themes

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:themes`                     | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:themes": {
    "1"=>"{\"id\":1,\"name\":{\"en\":\"Airport Hotel\"}}",
    "2"=>"{\"id\":2,\"name\":{\"en\":\"Lake Hotel\"}}"
 }

```

##### Query

```
hget hotel:themes 1

"{\"id\":1,\"name\":{\"en\":\"Airport Hotel\"}}

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | ID                            |
| name           | Hash      | name with locale translations |

---

### Amenites

List of all Hotel Amenites

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:amenities`                  | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:amenities": {
    "12"=>"{\"id\":12,\"name\":{\"en\":\"Business Centre\"}}",
    "17"=>"{\"id\":17,\"name\":{\"en\":\"Golfcourse\"}}"
 }

```

##### Query

```
hget hotel:amenities 12

"{\"id\":12,\"name\":{\"en\":\"Business Centre\"}}

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | ID                            |
| name           | Hash      | name with locale translations |

---

### Rate Amenities

List of all Rate Amenities

| Key format                      | Value type| Command           |
|---------------------------------|-----------|-------------------|
| `hotel:rateAmenities`           | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:rateAmenities": {
    "2" => "{\"id\":2,\"code\":\"FREE_CANCELLATION\",\"type\":\"AMENITY\",\"name\":{\"en\":\"Free Cancellation\"}}",
    "12" => "{\"id\":12,\"code\":\"NO_MEAL\",\"type\":\"AMENITY\",\"name\":{\"en\":\"No meal\"}}"
    "13" => "{\"id\":12,\"code\":\"NO_CREDIT_CARD_NEEDED\",\"type\":\"PAYMENT\",\"name\":{\"en\":\"No creedit card needed\"}}"
    "14" => "{\"id\":14,\"code\":\"MOBILE_EXCLUSIVE\",\"type\":\"USER\",\"name\":{\"en\":\"Mobile exclusive\"}}"
 }

```

##### Query

```
hget hotel:rateAmenities 12

"{\"id\":12,\"code\":\"NO_MEAL\",\"name\":{\"en\":\"No meal\"}}"

```

#### Attributes in value

| Attribute Name | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| id             | Integer   | chain ID                      |
| name           | Hash      | name with locale translations |
| code           | String    | name with locale translations |

---

### Baseline Scores

| Key format                                                      | Value type  | Command           |
|-----------------------------------------------------------------|-------------|-------------------|
| `hotel:scores:baseline:siteLocale:<siteLocale>`                 | String      | hvals/hkeys/hget  |

Example:

```
 "hotel:scores:baseline:city:SIN:siteLocale:sa_ar": 
	{
	"SIN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}",
	"HAN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}"
	}

```

---

### Experiment Scores

| Key format                                                      | Value type  | Command           |
|-----------------------------------------------------------------|-------------|-------------------|
| `hotel:scores:experiment:siteLocale:<siteLocale>`               | String      | hvals/hkeys/hget  |

Example:

```
 "hotel:scores:experiment:city:SIN:siteLocale:sa_ar": 
	{
	"SIN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}",
	"HAN": "{\"258095\":10098822,\"576156\":10060066,\"576154\":10060004,\"571651\":10053133,\"258255\":10060066}"
	}

```

---

### Base Scores

Baseline values for hotels in each city

| Key format                         | Value type| Command           |
|------------------------------------|-----------|-------------------|
| `hotel:baseScores`                 | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:baseScores": {
    "SIN" => "{\"258302\":267.765,\"258283\":251.451}",
    "HLZ" => "{\"967827\":120.924,\"118396\":147.785}"
 }

```

##### Query

```
hget hotel:baseScores SIN

"{\"258302\":267.765,\"258283\":251.451}"

```

#### Attributes in value

| Attribute      | Data type | Description                   |
| ---------------|-----------| ------------------------------|
| `<hotel_id>`   | String    | hotel ID                      |
| `<base_value>` | Double    | Base value for the hotel_id   |


---

### Site Configs

Configutions for all sites

| Key format              | Value type| Command           |
|-------------------------|-----------|-------------------|
| `configs:siteConfigs`   | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "configs:siteConfigs": {
    "www.wego.ir"=>"{\"host\":\"www.wego.ir\",\"name\":\"Iran\",\"siteCode\":\"IR\",\"currency\":\"IRR\",\"locale\":\"fa\",\"supportedLocales\":[\"fa\",\"en\"]}",
    "sa.wego.com"=>"{\"host\":\"sa.wego.com\",\"name\":\"Saudi Arabia\",\"siteCode\":\"SA\",\"currency\":\"SAR\",\"locale\":\"ar\",\"supportedLocales\":[\"ar\",\"en\"]}"
 }

```

##### Query

```
hget configs:siteConfigs www.wego.com.sg

"{\"host\":\"www.wego.com.sg\",\"name\":\"Singapore\",\"siteCode\":\"SG\",\"currency\":\"SGD\",\"locale\":\"en\",\"supportedLocales\":[\"en\",\"ms\",\"zh-cn\"]}"

```

#### Attributes in value

| Attribute Name   | Data type | Description      |
| -----------------|-----------| -----------------|
| host             | String    |                  |
| name             | String    | Country name     |
| siteCode         | String    | Country name     |
| currency         | String    | Country currency |
| locale           | String    |                  |
| supportedLocales | List      | Country name     |

---

### Default Hosts

List of all default hosts for each locale

| Key format             | Value type| Command           |
|------------------------|-----------|-------------------|
| `configs:defaultHosts` | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "configs:defaultHosts": {
    "en"=>"www.wego.com",
    "ar"=>"www.wego.ae"
 }

```

##### Query

```
hget defaultHostByLocale ar

"www.wego.ae"

```
---
### Usual Prices

Usual prices for hotels

| Key format                              | Value type| Command           |
|-----------------------------------------|-----------|-------------------|
| `hotel:usualPrices:cityCode:<cityCode>` | Hash      | hvals/hkeys/hget  |

#### Example:

```
 "hotel:usualPrices:cityCode:SIN": {
    "716563"=>"{\"01-1\":125.247,\"02-1\":126.155,\"06-1\":135.527,\"07-1\":125.039,\"12-7\":124.067}",
    "258023"=>"{\"06-1\":201.824,\"07-1\":215.944,\"08-1\":215.757,\"09-1\":210.635,\"12-7\":233.641}"
 }

```

##### Query

```
hget hotel:usualPrices:cityCode:SIN 716563

"{\"01-1\":125.247,\"02-1\":126.155,\"06-1\":135.527,\"07-1\":125.039,\"12-7\":124.067}"

```

#### Attributes in value

| Attribute           | Data type | Description                                             |
| --------------------|-----------| --------------------------------------------------------|
| `<month_dayOfWeek>` | String    | Month and day of week                                   |
| `<usual_price>`     | Float     | Hotel usual price on that day of week and in that month |

---

### Room Type Categories

Room Type Categories for hotels

| Key format                           | Value type | Command | Description |
| ------------------------------------ | ---------- | ------- | ----------- |
| `hotel:roomTypeCategory:code:<code>` | String     | get/set |             |
| `hotel:roomTypeCategory:id:<id>`     | String     | get/set | Alias       |

#### Example:

```
 "hotel:roomTypeCategory:code:PRIVATE_ROOM": "{\"id\":1,\"code\":\"PRIVATE_ROOM\",\"nameI18n\":{\"en\":\"Private room\"}}"
 "hotel:roomTypeCategory:id:1": "PRIVATE_ROOM"
```

##### Query

```
get "hotel:roomTypeCategory:code:PRIVATE_ROOM"

"{\"id\":1,\"code\":\"PRIVATE_ROOM\",\"nameI18n\":{\"en\":\"Private room\"}}"
```

#### Attributes in value

| Attribute    | Data type | Description             |
| ------------ | --------- | ----------------------- |
| `<id>`       | Integer   | Room Type Category Id   |
| `<code>`     | String    | Room Type Category Code |
| `<nameI18n>` | String    | name with translation   |

---

### Hotel Name Language

Detection langugage of live hotel names (ex: Airbnb property name)

| Key format                             | Value type | Command | Description |
| -------------------------------------- | ---------- | ------- | ----------- |
| `hotel:nameLocale:cityCode:<cityCode>` | String     | get/set |             |

#### Example:

```
 "hotel:nameLocale:cityCode:DXB": "{\"c7AwfvlFT8iztt4WojtJ+g==\":\"en\",\"L1P9xyVdZMFGw/fj5luSXg==\":\"en\",\"9wy8eE1YlGki6Uf8RX0rrw==\":\"ar\"}"
```

##### Query

```
get "hotel:nameLocale:cityCode:DXB"

"{\"c7AwfvlFT8iztt4WojtJ+g==\":\"en\",\"L1P9xyVdZMFGw/fj5luSXg==\":\"en\",\"9wy8eE1YlGki6Uf8RX0rrw==\":\"ar\"}"
```

#### Attributes in value

| Attribute    | Data type | Description                          |
| ------------ | --------- | ------------------------------------ |
| `<key_name>` | String    | A unique hash of cleaning hotel name |
| `<locale>`   | String    | Detected locale of hotel name        |

---

## Partners

### Provider Location

Provider Location to be used in metasearch incase we have live hotels

| Key format                                         | Value type | Command          | Description                     |
| -------------------------------------------------- | ---------- | ---------------- | ------------------------------- |
| `partner:providerLocation:providerId:<providerId>` | Hash       | hvals/hkeys/hget | Field: `<providerLocationCode>` |

#### Example:

```
 "partner:providerLocation:providerId:613": {
   "manggis__id": "{\"id\":2964967,\"code\":\"manggis__id\",\"cityCode\":\"34188\",\"providerId\":613}",
  "marinadelrey__us": "{\"id\":2967583,\"code\":\"marinadelrey__us\",\"cityCode\":\"8441\",\"providerId\":613}"
 }
```

##### Query

```
hget "partner:providerLocation:providerId:613" "singapore__sg"

"{\"id\":2964560,\"code\":\"singapore__sg\",\"cityCode\":\"SIN\",\"providerId\":613}"
```

#### Attributes in value

| Attribute      | Data type | Description            |
| -------------- | --------- | ---------------------- |
| `<id>`         | Integer   | Provider location id   |
| `<code>`       | String    | Provider location code |
| `<cityCode>`   | String    | Wego city code         |
| `<providerId>` | Integer   | Provider id            |

---

### Provider District

Provider District to be used in metasearch incase we have live hotels.

| Key format                                         | Value type | Command          | Description                     |
| -------------------------------------------------- | ---------- | ---------------- | ------------------------------- |
| `partner:providerDistrict:providerId:<providerId>` | Hash       | hvals/hkeys/hget | Field: `<providerDistrictCode>` |

#### Example:

```
 "partner:providerDistrict:providerId:613": {
    "villaurquiza_villaurquiza": "{\"id\":89969,\"code\":\"villaurquiza_villaurquiza\",\"districtId\":3240 \"providerId\":613}",
    "portaromana_milano": "{\"id\":89874,\"code\":\"portaromana_milano\",\"districtId\":22343,\"providerId\":613}"
 }
```

##### Query

```
hget "partner:providerDistrict:providerId:613" "lichtenberg_berlin"

"{\"id\":89586,\"code\":\"lichtenberg_berlin\",\"districtId\":3085,\"providerId\":613}"
```

#### Attributes in value

| Attribute      | Data type | Description            |
| -------------- | --------- | ---------------------- |
| `<id>`         | Integer   | Provider district id   |
| `<code>`       | String    | Provider district code |
| `<districtId>` | Integer   | Wego district id       |
| `<providerId>` | Integer   | Provider id            |

---
