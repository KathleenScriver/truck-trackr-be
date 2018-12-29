# Truck Trackr API

[![CircleCI](https://circleci.com/gh/KathleenYruegas/truck-trackr-be.svg?style=svg)](https://circleci.com/gh/KathleenYruegas/truck-trackr-be)

Visit deployed api at https://truck-trackr-api.herokuapp.com/
(This is also the base URL for all api endpoints.)

#### API Endpoints

**GET `/api/v1/food_trucks`**

- This endpoint will return a list of all food-trucks in the database along with their name.
```json
[
  {
    "data": [
      {
        "id": "1",
        "type": "food_truck",
        "attributes": {
          "name": "Hot Pasta"
        }
      },
      {
        "id": "2",
        "type": "food_truck",
        "attributes": {
            "name": "Hell On Wheels",
        }
      }
    ]
  }
]
```

**GET `/api/v1/food_trucks/:id`**

- This endpoint will return a selected food truck in the database along with it's attributes when an id is given
```json

{
  "data": [
    {
      "id": "1",
      "type": "food_truck",
      "attributes": {
        "name": "Hot Pasta",
        "food_type": "Risotto with Seafood",
        "contact_name": "Pamala",
        "phone": "344.694.9247",
        "email": "young@champlin.biz",
        "website": "http://hopo.com",
        "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/11.png"
      }
    }
  ]
}
```

**GET `/api/v1/breweries`**
- Will return a list of all breweries in the database along with their name.

```json
{
    "data": [
              {
                "id": "1",
                "type": "brewery",
                "attributes": {
                    "name": "Lockman Inc"
                }
              },
              {
                "id": "2",
                "type": "brewery",
                "attributes": {
                    "name": "Cremin, Nikolaus and Volkman"
                }
              }
            ]
}
```

**GET `/api/v1/breweries/:id`**

- This endpoint will return a selected brewery in the database along with it's attributes when an id is given
```json

{
  "data": [
    {
      "id": "1",
      "type": "brewery",
      "attributes": {
        "name": "Heads Of State",
        "address": "Risotto with Seafood",
        "contact_name": "Pamala",
        "phone": "344.694.9247",
        "email": "young@champlin.biz",
        "website": "http://hosbeer.com",
        "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/11.png"
      }
    }
  ]
}
```

**GET `/api/v1/food_trucks/:food_truck_id/open_dates`**

Lists all listed open_dates for a given food truck.

**Example Response**
```json
{
   "data": {
        "id": "22",
        "type": "food_truck",
        "attributes": {
            "name": "Skeeter",
            "food_type": "Katsu Curry",
            "contact_name": "Rosalia",
            "phone": "1-267-595-6285",
            "email": "blairwiegand@streichritchie.info",
            "website": null,
            "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/10.png"
        },
        "relationships": {
            ...
        }
    },
    "included": [
        {
            "id": "1",
            "type": "open_date",
            "attributes": {
                "id": 1,
                "date": "2019-02-24",
                "booked?": true
            }
        },
        {
            "id": "3",
            "type": "open_date",
            "attributes": {
                "id": 3,
                "date": "2019-04-07",
                "booked?": false
            }
        }
      ]
}
```
**Error Response**

If the truck cannot be located, the response will include `status: 400` with `"message": "Sorry, that food truck does not exist, please try again."`


**POST `/api/v1/food_trucks/:food_truck_id/open_dates`**

-This will create a new open_date object for the truck specified in the path.

**Request Format:**
```json
{
  "date": "Tue, 16 Apr 2019"
}
```
The attribute of `booked?` will default to `false`. If you want to create the open_date with `booked?` set to `true`, you can send it as an additional parameter in the request.
```json
{
  "date": "Tue, 16 Apr 2019",
  "booked?": true
}
```

**Example Response**
 - If successful, response will return `status code: 201`.
 
 - If not successful, response will return `status code: 400` with
 ```json
 {
   "message": "Could not save, please try again."
 }
 ```
