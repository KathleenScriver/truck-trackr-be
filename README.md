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
          "name": "Ernie",
          "food_type": "Risotto with Seafood",
          "contact_name": "Pamala",
          "phone_number": "344.694.9247",
          "email": "young@champlin.biz",
          "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/11.png"
        }
      },
      {
        "id": "2",
        "type": "food_truck",
        "attributes": {
            "name": "D.P",
            "food_type": "Cheeseburger",
            "contact_name": "King",
            "phone_number": "580.638.7089",
            "email": "cherly@oconnerlarson.info",
            "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/10.png"
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
        "name": "Ernie",
        "food_type": "Risotto with Seafood",
        "contact_name": "Pamala",
        "phone_number": "344.694.9247",
        "email": "young@champlin.biz",
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

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
