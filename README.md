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

**POST `/api/v1/food_trucks`**

- This endpoint will add a new food truck to the database.

**Expected Request Format:**

```json
{
  "name": "name_of_food_truck", (required)
  "food_type": "mexican fusion",  (required)
  "contact_name": "for booking events",  (required)
  "phone": "who can they call?",  (required)
  "email": "who can they email?",  (required)
  "logo_image": "WIP, ok to leave blank",
  "website": "ok to leave this blank if not available"
}
```
- A successful request will return `status code: 201`.
- An unsuccessful request will return `status code: 404` and
```json
{
  "message": "Failed"
}
```

**PUT `/api/v1/food_trucks/:id`**

- This endpoint will allow you to edit the food_truck.

**Expected Request Format:**
```json
{
 "name": "name_of_food_truck", (required)
  "food_type": "mexican fusion",  (required)
  "contact_name": "for booking events",  (required)
  "phone": "who can they call?",  (required)
  "email": "who can they email?",  (required)
  "logo_image": "WIP, ok to leave blank",
  "website": "ok to leave this blank if not available"
}
```

- A successful request will return `status code: 200`.
- An unsuccessful request will return `status code: 404` with
```json
{
  "message": "Food Truck not found with ID #{params[:id]}"
}
```

**DELETE `/api/v1/food_trucks/:id`**

- This endpoint will delete the specified food_truck.

- If successful, will return `status code: 204`.
- If unsuccessful, will return `status code: 404` with
```json
{
  "message": "Food Truck not found with ID #{params[:id]}"
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

**POST `/api/v1/breweries`**

- This endpoint will create a new brewery to add to the database.

**Expected Request Format:**
```json
{
  "name": "Heads Of State",  (required)
  "address": "123 Main St, Denver, CO 80203",  (required)
  "contact_name": "Pamala",  (required)
  "phone": "344.694.9247",  (required)
  "email": "young@champlin.biz",  (required)
  "website": "http://hosbeer.com",
  "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/11.png"
 }
 ```
  
 - A successful requet will return `status code: 201`.
 - An unsuccessful request will return `status code: 404` with
 ```json
 {
   "message": "Failed"
 }
 ```
  
**PUT `/api/v1/breweries/:id`**

- This endpoint will allow you to edit an existing brewery.

**Expected Request Format:**
```json
{
  "name": "Heads Of State",  (required)
  "address": "123 Main St, Denver, CO 80203",  (required)
  "contact_name": "Pamala",  (required)
  "phone": "344.694.9247",  (required)
  "email": "young@champlin.biz",  (required)
  "website": "http://hosbeer.com",
  "logo_image": "https://pigment.github.io/fake-logos/logos/medium/color/11.png"
}
```
- A successful requet will return `status code: 200`.
- An unsuccessful request will return `status code: 404` with
```json
{
  "message": "Brewery not found with ID #{params[:id]}"
}
```

**DELETE `/api/v1/breweries/:id`**

- This endpoint will delete the specified brewery from the database.

- A successful request will return `status code: 204`.
- An unsuccessful request will return `status code: 404` with
```json
{
  "message": "Brewery not found with ID #{params[:id]}"
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

**GET `/api/v1/food_trucks/:food_truck_id/open_dates/:id`**

- This endpoint will return the specified Open Date for the food truck.

**Example Response**
```json
{
    "data": {
        "id": "2",
        "type": "open_date",
        "attributes": {
            "id": 2,
            "date": "2019-01-01",
            "booked?": false
        }
    }
}
```

**Error Response**

- If either the food truck or the Open Date do not exist, the response will include `status code: 404` with
```json
{
  "message": "Could not locate resource"
}
```


**POST `/api/v1/food_trucks/:food_truck_id/open_dates`**

-This will create a new open_date object for the truck specified in the path.

**Request Format:**
```json
{
  "date": "Tue, 16 Apr 2019" 
}
```
*Note: The date format does not need the day of the week. Can also be in `YY-MM-DD` format or `YYYY-MM-DD`.

The attribute of `booked?` will default to `false`. If you want to create the open_date with `booked?` set to `true`, you can send it as an additional parameter in the request.
```json
{
  "date": "Tue, 16 Apr 2019",
  "booked?": true
}
```

**Example Response**
 - If successful, response will return `status code: 201`.
 
 - If not successful, response will return `status code: 404` with
 ```json
 {
   "message": "Could not save, please try again."
 }
 ```
 
 **PUT `/api/v1/food_trucks/:food_truck_id/open_dates/:id`**
 - This endpoint will allow the user to edit the specified open date.
 
 **Request Format:**
 ```json
{
  "date": "Tue, 16 Apr 2019",
  "booked?": true
}
```
*Note: The date format does not need the day of the week. Can also be in `YY-MM-DD` format or `YYYY-MM-DD`.

(Request can include one or both of the above listed attributes.)

**Example Response**
 - If successful, response will return `status code: 200`.
 
 - If not successful, response will return `status code: 404` with
 ```json
 {
   "message": "Could not update, please try again."
 }
 ```
