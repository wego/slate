# Bookmarks Api

| Type   | Endpoint                                                   | Description         |
| -----  | ---------------------------------------------------------- | ------------------- |
| GET    | [/story/v1/bookmarks](#create-bookmark)                    | List Bookmarked Stories   |
| POST   | [/story/v1/bookmarks](#create-bookmark)                    | Create Bookmarks    |
| DELETE | [/story/v1/bookmarks/:story_id](#delete-bookmark)          | Delete Bookmarks    |

## List Bookmarked Stories

```
GET /story/v1/bookmarks?page=<page>&per_page=<per_page>
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Get list of stories bookmarked.

### Parameters

| Property      | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| page      | Optional       | Integer   | page number                                 |
| per_page      | Optional       | Integer   | result per page default 10                                 |


### Request Headers
| Property        | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| X-User-ID-Hash  | Yes       | String    | user `id_hash`                              |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

``` 
Request: story/v1/bookmarks?page=1&per_page=10

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>
```

### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
{
  [
    {
        "id": 34,
        "title": "Think Food Hunting Is the Best Part Of Travelling? Try Our 6 Tips to Find and Enjoy Good Street Food Anywhere",
        "excerpt": "Food remains the foundation of society in so many ways. Families gather together, friendships are formed, and lovers unite all over a meal. Regardless of where you might find yourself in the world, the most basic form of cultural exchange occurs on the gastronomical level. Everyone knows the power of bonding with a stranger over […]\n",
        "url": "https://blog.wego.com/?p=26466",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/v1563348837/shutterstock_159755636_k0bija.jpg",
        "favicon_url": null,
        "source_name": null,
        "url_hash": "b7a8eddec01c1c17a47f60762730e566",
        "created_at": "2019-07-17T09:45:00.000Z",
        "bookmark_id": 226
    },
    {
        "id": 40,
        "title": "8 Things That Will Definitely Send Any Traveller into SERIOUS Panic Mode (And How to Fix Them!)",
        "excerpt": "For many of us, the word “travel” conjures up images of adventure and excitement. We imagine ourselves jetting off into the sunset to some far-off destination with our best mates (or alone!) for a relaxing getaway. The anticipation and enjoyment of all the fun that comes along with our travels often make our trips abroad […]\n",
        "url": "https://blog.wego.com/?p=26593",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/v1563779663/shutterstock_793653961_qsseyd.jpg",
        "favicon_url": null,
        "source_name": null,
        "url_hash": "82bc162b18ba7d723c60e327916eccc8",
        "created_at": "2019-07-22T07:21:35.000Z",
        "bookmark_id": 225
    }
 ]
}
```

___


## Create Bookmark

```
POST /story/v1/bookmarks
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Required parameters are by database level validation. Not application validation.
2. `story_id` and `user_id` has to be unique combination.

### Parameters

| Property      | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| story_id      | Yes       | Integer   | story id                                  |

### Request Headers
| Property        | Required? | Data Type | Description                               |
| X-User-ID-Hash  | Yes       | String    | user `id_hash`                             |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

``` 
Request: story/v1/bookmarks

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>
```

#### Example Request Body

``` JSON
{
    "story_id": 1
}
```

### Response

``` text
HTTP/1.1 201 Created
```

``` JSON
{
    "id": 1,
    "story_id": 1
}
```

___

## Delete Bookmark

```
DELETE /story/v1/bookmarks/:story_id
X-User-ID-Hash: <id_hash>
Authorization: Bearer <access_token>
```

### Logic

1. Return status 200 ok if delete successful
2. Return status 401 Unauthorised if verification fails
2. Return status 404 Not Found if bookmark does not exist

### Example

```
Request: story/v1/bookmarks/1

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>

```

### Response

#### Successful

``` text
HTTP/1.1 200 OK
```

#### Unauthorized

``` text
HTTP/1.1 401 Unauthorized
```

#### Bookmark does not exist

``` text
HTTP/1.1 404 Not Found
```

___
