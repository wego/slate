# Wego Users API

| Endpoint                                                            | Description               | Status       |
| ------------------------------------------------------------------- | ------------------------- | ------------ |
| [POST /users/sign_in](#users-sign-in)                               | Users sign in             | `Deprecated` |
| [POST /users/sign_up](#users-sign-up)                               | Users sign up             | `Active`     |
| [POST /users/oauth/token](#users-oauth-token)                       | Users Login               | `Active`     |
| [POST /users/oauth/revoke](#users-oauth-revoke)                     | Users Logout              | `Active`     |
| [PUT PATCH /users/update](#users-update)                            | Users info Update         | `Active`     |
| [GET /users/info](#users-info)                                      | Users info                | `Active`     |
| [GET /users/preferences](#users-preferences)                        | Users preferences         | `Active`     |
| [GET /users/right_to_forget](#users-right-to-forget)                | Users right to forget     | `Active`     |
| [POST /users/resend_confirmation](#users-resend-confirmation-email) | resend confirmation email | `Active`     |
| [POST /users/email_confirmation](#users-email-confirmtaion)         | Confirm user email        | `Active`     |
| [POST /users/forgot_password](#users-password-forgot)               | Send password reset email | `Active`     |
| [POST /users/update_password](#users-password-update)               | Change user password      | `Active`     |
| [POST /users/reset_password](#users-password-reset)                 | Reset user password       | `Active`     |
| [GET /users/affiliates/:aid](#get-affiliate)                        | Get Affiliate Info        | `Active`     |
| [POST /users/affiliates](#create-affiliate)                         | Create Affilicate         | `Active`     |
| [PUT /users/affiliates](#update-affiliate)                          | Update Affilicate         | `Active`     |
| [GET /users/verify](#verify-token)                          	      | Verify user token         | `Active`     |

## Users Sign-In

### Parameters

There 2 ways to sign in. The direct Email and Password way and the Oauth.

#### Email and Password

| Param         | Required? | Data Type | Description   |
| ------------- | --------- | --------- | ------------- |
| user.email    | Yes       | String    | Email address |
| user.password | Yes       | String    | The password  |

#### Oauth

| Param           | Required? | Data Type | Description                                      |
| --------------- | --------- | --------- | ------------------------------------------------ |
| user.auth_token | Yes       | String    | Oauth token from the preferred identity provider |

### Examples

#### Request Path

`POST /users/sign_in`

#### Request Body

**Email and Password**

```
{
  "user": {
    "email": "kusumah@ganteng.com",
    "password": "johndoepassword"
  },
  "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
  },
  "locale": "en"
}
```

**Oauth**

```
{
  "provider": "facebook",
  "token": "dummytoken"
    "device": {
    "device_id": "13E72D97-37DE-40D9-9BA1-1651752D4653",
    "app_version": "5.4.1.637",
    "device_type": "ios"
  },
  "locale": "en"
}
```

#### Response

```
{
  "id": 36328,
  "email": "kusumah@ganteng.com",
  "token": "ZAMBY4Zoco6Yz1zS_-xw",
  "needs_to_set_password": false,
  "sign_in_count": 6782,
  "user_hash": "a707f1075a5d85c025b1c2977314786b",
  "user_confirmed": false,
  "cs_restore_id": "test6"
}
```

## Users Sign-Up

### Parameters

There 2 ways to sign up. The direct Email and Password way and the Oauth.

#### Email and Password Sign-Up

| Param              | Required? | Data Type   | Description           |
| ------------------ | --------- | ----------- | --------------------- |
| user.email         | No        | String      | User email to sign up |
| user.password      | No        | String      | Password              |
| device.device_id   | String    | Device id   |
| device.app_version | String    | App version |
| device.device_type | String    | Device type |
| locale             | No        | String      |                       |

#### Oauth Signup

| Param              | Required? | Data Type   | Description        |
| ------------------ | --------- | ----------- | ------------------ |
| provider           | Yes       | String      | Facebook, Google.. |
| token              | Yes       | String      | Some random string |
| device.device_id   | String    | Device id   |
| device.app_version | String    | App version |
| device.device_type | String    | Device type |
| locale             | No        | String      |                    |

### Examples

#### Request Path

`POST /users/sign_up`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Email and Password**

```
{
  "user": {
    "email": "ahmad_k102@yahoo.com",
    "password": "password",
    "password_confirmation": "password",
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  }

}
```

**Oauth**

```
{
  "user": {
    "newsletter_opt_in": "0",
    "geo_country_code": "ID",
    "geo_city": "",
    "time_zone": "",
    "locale": "id",
    "cctld": "www.wego.co.id",
    "source": "desktop_web"
  },
  "device": {
    "device_id": "",
    "device_type": "ios_app",
    "app_version": ""
  },
  "provider": "<provider (google/ facebook)>",
  "token": "<provider_token>"
}
```

#### Response

```
{
  "id": 2609997,
  "email": "ahmad_k1021234@yahoo.com",
  "token": "7E92xbFwNBymACCgDSxu",
  "needs_to_set_password": false,
  "sign_in_count": 0,
  "user_hash": "a707f1075a5d85c025b1c2977314786b",
  "user_confirmed": false,
  "cs_restore_id": null
}
```

## Users Oauth Token

### Parameters

There 2 ways to sign in. The direct Email and Password way and the Oauth.

#### Email and Password

| Param      | Required? | Data Type | Description                                |
| ---------- | --------- | --------- | ------------------------------------------ |
| email      | Yes       | String    | Email address                              |
| password   | Yes       | String    | The password                               |
| client_id  | Yes       | String    | Oauth registered Client ID                 |
| grant_type | Yes       | String    | signin method                              |
| scope      | Yes       | String    | application scope <user, users, affiliate> |

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| client_id             | Yes       | String    | Oauth registered Client ID               |
| client_secret         | Yes       | String    | Oauth registered Client Secret           |
| grant_type            | Yes       | String    | signin method                            |
| prvider               | Yes       | String    | 3rd party service <google/facebook>      |
| provider_access_token | Yes       | String    | signin method auth token                 |
| scope                 | Yes       | String    | application scope <user/users/affiliate> |

### Examples

#### Request Path

`POST /users/oauth/token`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Email and Password**

```
{
    "client_id": "e8ab8c92713155c4e66a2d5fe79e1843d6bc6939c70154c5ff6629504265b1dd",
    "email": "wego_test103@yahoo.com",
    "grant_type": "password",
    "password": "password",
    "scope": "user"
}
```

**Oauth**

```
{
  "client_id": "d03c13d00944731e07d1d06cac015242eb3cc52616d77b466fa9de96c19ebc1d",
  "client_secret": "730a214ed0e329e85aea3d4705ed4a48f82dfb19a2359b99d81c1ebc2d9feaef",
  "grant_type": "password",
  "provider": "google",
  "provider_access_token": "<servie provider auth token>",
  "scope": "users"
}
```

#### Response

```
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjkwMDQ3Niwic3ViIjoiYWhzYW5fdGVzdDEwM0B5YWhvby5jb20iLCJhdWQiOiJ1c2VyIiwiZXhwIjoxNTUwNTA1ODM1LCJpYXQiOjE1NTA0NjI2MzUsImlzcyI6ImlueWlnbyIsImp0aSI6ImE1MWI2OGQxYmI3N2UxNDAwMzdhYThjMmQxODdhODMzIiwiYWlkIjoiMzEyMyJ9.Stze7Dhj5itaEM7ICet50G9c3KfczV8ncyRIOP74NTw",
    "token_type": "bearer",
    "expires_in": 43199,
    "refresh_token": "74992ddb94ee7e09a4639f4606b59cefcd8297850ef52379e485883d53c87c5a",
    "scope": "user",
    "created_at": 1550462635,
    "authentication_token": "GrRzFRuy2gpsmkFS5dNQ",
    "user_confirmed": false,
    "user_hash": "ecaec7f4dbeb2f472f74223eb244bc1a",
    "needs_to_set_password": false,
    "sign_in_count": 0,
    "cs_restore_id": "test6"
}
```

## Users Oauth Revoke

### Parameters

To revoke the token upon logout.

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| client_id             | Yes       | String    | Oauth registered Client ID               |
| client_secret         | Yes       | String    | Oauth registered Client Secret           |
| token                 | Yes       | String    | access token                             |


### Examples

#### Request Path

`POST /users/oauth/revoke`

### Headers

`X-Wego-Version: 1`

#### Request Body

**Oauth**

```
{
    "client_id": "e8ab8c92713155c4e66a2d5fe79e1843d6bc6939c70154c5ff6629504265b1dd",
    "client_secret": "730a214ed0e329e85aea3d4705ed4a48f82dfb19a2359b99d81c1ebc2d9feaef",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjkwMDQ5OCwic3ViIjoiYWhzYW5fdGVzdDExNUB5YWhvby5jb20iLCJhdWQiOiJ1c2VyIiwiZXhwIjoxNTY2ODQxNDg4LCJpYXQiOjE1NjY3OTgyODgsImlzcyI6ImlueWlnbyIsImp0aSI6IjNiNjgxYmZkYTJiZmVlMTY0YzhiZGE0YTE5NjFiNzNhIiwiYWlkIjoiMzEyMyJ9.YO2rocoMpNhCqrjLGRCvxzKjh0OUq3uR1-a2RalynME"
}
```

#### Response
[Always returns 200 OK, even if token doesn't exist or has already been revoked.](https://github.com/doorkeeper-gem/doorkeeper/wiki/API-endpoint-descriptions-and-examples#post-oauthrevoke)

```
{}
```


## Users Update

### Parameters

To update the user info

#### Oauth

| Param                 | Required? | Data Type | Description                              |
| --------------------- | --------- | --------- | ---------------------------------------- |
| user                  | Yes       | Hash   	| key value pair of fields being updated   |


### Examples

#### Request Path

`PUT|PATCH /users/update`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

#### Request Body

**Oauth**

```
{
    "user": {
        "cs_restore_id": "test6"
    }
}
```

#### Response
 
```
200 

{
    "id": 2611297,
    "email": "test103@yahoo.com",
    "name": " ",
    "photo_url": null,
    "country_code": null,
    "user_hash": "dee245a61cebb420507bdc599fc5ead1",
    "id_hash": "38e7a1b5c61331b1e2f13c1e9be08118",
    "cs_restore_id": "test6"
}
```

## Users info

### Parameters

`NA`

### Examples

### Request Path

`GET /users/info`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "id": 900476,
    "email": "wego_test103@yahoo.com",
    "name": null,
    "photo_url": null,
    "country_code": null,
    "user_hash": "2f970f6c134859c34d190180d72b8267",
    "id_hash": "38e7a1b5c61331b1e2f13c1e9be08118",
    "cs_restore_id": "test6"
}
```

## Users preferences

### Parameters

`NA`

### Examples

### Request Path

`GET /users/preferences`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "user": {
        "first_name": null,
        "last_name": null,
        "email": "wego_test103@yahoo.com",
        "cctld": "www.wego.com",
        "locale": "id",
        "time_zone": "America/New_York",
        "newsletter_opt_in": false,
        "id": 900476,
        "status": "ACTIVE",
        "site_code": null,
        "user_hash": "2f970f6c134859c34d190180d72b8267"
    },
    "travellers": [],
    "billing_addresses": [],
    "contacts": [],
    "fare_alert_subscriptions": []
}
```

## Users right to forget

### Parameters

`NA`

### Examples

### Request Path

`GET /users/right_to_forget`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

### Response

```
{
    "id": 900476,
    "email": "wego_test103@yahoo.com",
    "user_hash": "ecaec7f4dbeb2f472f74223eb244bc1a"
}
```

## Users Resend Confirmation email

### Parameters

| Param | Required? | Data Type | Description                                                         |
| ----- | --------- | --------- | ------------------------------------------------------------------- |
| email | Yes       | String    | User's email address that will be use for sending confirmation link |

### Examples

#### Request Path

`POST /users/resend_confirmation`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com"
  }
}
```

#### Response

No response body will be sent.

## Users Email Confirmation

### Parameters

| Param              | Required? | Data Type | Description                                                         |
| ------------------ | --------- | --------- | ------------------------------------------------------------------- |
| email              | Yes       | String    | User's email address that will be use for sending confirmation link |
| confirmation_token | Yes       | String    | confirmatio token send in URL with same name                        |

### Examples

#### Request Path

`POST /users/email_confirmation`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com",
    "confirmation_token": "FeMGTjs19M9d6rkUvM_c"
  }
}
```

#### Response

No response body will be sent.

## Users Forgot Password Email

### Parameters

| Param  | Required? | Data Type | Description                                                                 |
| ------ | --------- | --------- | --------------------------------------------------------------------------- |
| email  | Yes       | String    | User's email address that will be use for sending reset link                |
| locale | No        | String    | The locale in which the password reset instruction email will be written in |

### Examples

#### Request Path

`POST /users/forgot_password`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
  "user": {
    "email": "somebody@some-address.com",
    "locale": "en"
  }
}
```

#### Response

No response body will be sent.

## Users Password Update

### Parameters

| Param                 | Required? | Data Type | Description                    |
| --------------------- | --------- | --------- | ------------------------------ |
| current_password      | Yes       | String    | current user password          |
| password              | Yes       | String    | new user password              |
| password_confirmation | Yes       | String    | new user password confirmation |

### Examples

#### Request Path

`POST /users/update_password`

### Headers

`X-Wego-Version: 1`
`Authorization: Bearer <access token>`

#### Request Body

```
{
	"user": {
	"current_password": "password",
	"password":"password1",
	"password_confirmation": "password1"
 }
}
```

#### Response

No response body will be sent.

## Users Password Reset

### Parameters

| Param                 | Required? | Data Type | Description                                                   |
| --------------------- | --------- | --------- | ------------------------------------------------------------- |
| reset_password_token  | Yes       | String    | token is in the params of the reset email link with same name |
| password              | Yes       | String    | new user password                                             |
| password_confirmation | Yes       | String    | new user password confirmation                                |

### Examples

#### Request Path

`POST /users/reset_password`

### Headers

`X-Wego-Version: 1`

#### Request Body

```
{
	"user": {
	"reset_password_token": "8bd042fea8508314a0a2",
	"password":"password1",
	"password_confirmation": "password1"
 }
}
```

#### Response

No response body will be sent.

---

## Get Affiliate

### Parameters

| Param | Required? | Data Type | Description                                          |
| ----- | --------- | --------- | ---------------------------------------------------- |
| aid   | Yes       | String    | Affiliate ID aka TS Code. The value is from kumonosu |

### Examples

`/users/affiliates/69cd6`

### Request Path

`GET /users/affiliates/:aid`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

### Response

```
{
    "name": "Arrivedo",
    "client_id": "ef1e338d29697ddd5e0985649a65c548d7954c05ec19c57fcc6f5660e62c2533",
    "client_secret": "893234d60e0b66b6707098e0b32f25fe976d95a418e6d989e647015a8412cd55",
    "aid": "69cd6",
    "email": "rodrigo@arrivedo.com",
    "expires_in": "2018-11-02"
}
```

--

## Create Affiliate

### Parameters

| Param      | Required? | Data Type | Description                                   |
| ---------- | --------- | --------- | --------------------------------------------- |
| aid        | Yes       | String    | TS Code / Affiliate ID. Generated by kumonosu |
| name       | Yes       | String    | Affiliate Name                                |
| email      | Yes       | String    | Affiliate Email                               |
| expires_in | Yes       | String    | Format: "YYYY-MM-DD"                          |

#### Request Path

`POST /users/affiliates`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

#### Request Body

```
{
  "aid": "12345",
  "name": "Inigo",
  "email": "inigo@wego.com",
  "expires_in": "2020-01-01"
}
```

#### Response

```
{
    "name": "Inigo",
    "client_id": "4d6d1e4c8d0dc7394d369604",
    "client_secret": "422b2971828b2335782d1404",
    "aid": "12345",
    "email": "inigo@wego.com",
    "flights_rate_limit": 600,
    "hotels_rate_limit": 600,
    "expires_in": "2020-01-01"
}
```

## Update Affiliate

Endpoint for updating expiry and rate limit of an affiliate account

### Parameters

| Param              | Required? | Data Type | Description            |
| ------------------ | --------- | --------- | ---------------------- |
| flights_rate_limit | Yes       | String    | Flights API Rate Limit |
| hotels_rate_limit  | Yes       | String    | Hotels API Rate Limit  |
| expires_in         | Yes       | String    | Format: "YYYY-MM-DD"   |

#### Request Path

`POST /users/affiliates/:aid`

### Headers

`Authorization: Bearer <access token>`

_This endpoint only accepts `accessToken` of admin accounts._

#### Request Body

```
{
  "expires_in": "2019-12-19",
  "hotels_rate_limit": 1000,
  "flights_rate_limit": 1000
}
```

#### Response

```
{
    "name": "Inigo",
    "client_id": "4d6d1e4c8d0dc7394d369604",
    "client_secret": "422b2971828b2335782d1404",
    "aid": "12345",
    "email": "inigo@wego.com",
    "flights_rate_limit": 600,
    "hotels_rate_limit": 600
}
```

## Verify Token

### Examples

`/users/verify`

### Request Path

`GET /users/verify`

### Headers

`Authorization: Bearer <access token>`

`X-User-Id-Hash: <User ID Hash>`

_This endpoint is only accessible internally to services._

### Response

```
{
    "expires_in": 43200,
    "created_at": "2019-07-29T04:12:27.000Z"
}
```

_wego-services-rb should be used to access this endpoint, it will give you time to cache the token based on remaining validity under `valid_for`._

### Response wego-services-rb
```
#<Wego::Services::User::Verifier::Session:0x0000562b7df6fd20 @valid_for=40583>
```
