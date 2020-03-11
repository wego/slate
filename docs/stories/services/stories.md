# Stories Api

| Type  | Endpoint                                                 | Description     |
| ----- | -------------------------------------------------------- | --------------- |
| GET   | [/story/v1/stories](#list-stories)                       | List Stories    |
| GET   | [/story/v1/stories/:story_id](#get-story-by-id)          | Get Story by ID |



## List Stories

```GET story/v1/stories```

### Logic

1. Stories returned are sorted by `created_at` in `DESC` order (i.e. lastest story will appear at the top of the list).
2. Stories will only have `bookmark_id` for valid `access_token` and `user_id_hash`

### Parameters

| Property      | Required? | Data Type | Description                                                                                   |
| ------------- | --------- | --------- | --------------------------------------------------------------------------------------------- |
| locale        | No        | String    | Story's locale is based on the blog source (e.g. story from blog.wego.com locale will be `en`)|
| search        | No        | String    | Search within stories title and categories name |
| site_code     | No        | String    | Accept only one site code. Allow `*` as value to retrieve stories regardless of site code     | 
| page          | No        | String    | Offset number. Default 1 |
| per_page      | No        | String    | number to return. Default 10 |

### Request Headers
| Property        | Required? | Data Type | Description                               |
| ------------- | --------- | --------- | ----------------------------------------- |
| X-User-ID-Hasd  | Yes       | String    | user id_hash                              |
| Authorization   | Yes       | Integer   | access token to authenticate user format `Bearer <access_token>` |

### Example

```
Request: story/v1/stories?locale=en&site_code=us&search=travel&page=1&per_page=2

Headers: X-User-ID-Hash: <id_hash>
         Authorization: Bearer <access_token>

```

#### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
[
    {
        "id": 1,
        "title": "Travel Post",
        "excerpt": "Overseas trip.",
        "url": "https://blog.wego.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 5
    },
    {
        "id": 2,
        "title": "Big Ben",
        "excerpt": "London.",
        "url": "https://external.source.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/external/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 8,
        "favicon_url": "https://external.source.com/favicon.ico",
        "source_name": "External Source"
    }
]
```

#### Notice

1. Responses with `favicon_url` and `source_name` indicate stories from external sources.

___

## Get Story by ID

```GET story/v1/stories/:story_id```

### Example

```story/v1/stories/10```

#### Response

``` text
HTTP/1.1 200 OK
```

``` JSON
[
    {
        "id": 10,
        "title": "Travel Post",
        "excerpt": "<p>Overseas trip.</p>",
        "url": "https://blog.wego.com/?p=0",
        "featured_media_url": "https://res.cloudinary.com/wegowordpress/image/upload/example.jpg",
        "created_at": "2019-01-01T00:00:00.000Z",
        "bookmark_id": 1
    }
]
```

___
