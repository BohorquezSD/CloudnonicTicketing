# README

## Cloudnonic Event Ticke0ng API

This project is an API for managing events and tickets. The following operations can be performed:

- Login.  **POST   /login**
- Logout.  **DELETE   /logout**
- Create a new event.  **POST   /api/events**
- Retrieve a list of all events.  **GET /api/events**
- Retrieve a single event by its ID. **GET /api/events/{event_id}**
- Create a new ticket purchase. **POST /api/ticket**
- Retrieve ticket purchase details by ticket ID.**GET /api/ticket/{ticket_id}**
- Retrieve a list of ticket purchases for a specific event. **GET /api/ticket/by_event{event_id}**
- Update event details (name, description, location, start_time, end_time, 
ticket_price).  **PUT    /api/events/:id**
- Update ticket purchase details (buyer_name, quan7ty). **PUT    /api/tickets/:id *The total price is automatically calculated**

For creation or update operations, you must be authenticated in the system.


### Run the application

This application run with ruby "3.2.2" and "rails 7.1.2" the database is sqlite3. You must have installed ruby in version 3.2.2

1. In the root of the app run

        `bundle install`


2. after install the required gems configure the database with

        `rails db:prepare
        rails db:seed`
    
3. you can run the app with

        `rails server`
    
4. for check the endpoint tests created with rspec run

        `rails db:create db:migrate RAILS_ENV=test
        bundle exec rspec`
    
5. for analize the code run

        `bundle exec rubocop`

6. finaly for test the endpoints you can use postmant or use curl, there is an example of login request using curl

        `curl --location 'http://localhost:3000/login' \
        --header 'Content-Type: application/json' \
        --header 'Cookie: _cloudnonic_ticketing_session=3gNDDyZ8xyCfA2QA%2FGrpmxe%2FvpvtVgCTiGSdn2dOVFxmTbuCsa2sG8vEbkUKRG%2FNb%2F%2Bnl6WuvpM8SoIV0p4B%2FrVLqJveUhd%2B94x09%2B7POp8LurVHK%2FyyvVRS7SpBxNv4qqigwuofARXF6I9nVOj9B88z5mnrSZ1%2B2h%2FMs1OGDv%2FM38SfjxBp6oayqexIZgy3nyrpBaLrtZdlI0RlEYgOdqOqvSTWzzz2GREbJqqMeTFSskAzzjbuefm3tzTVS%2F1pawsromIWfa1hbp4segvBpBCK4PHa4DU9YHUFk%2BEsxArFUjdTAg%3D%3D--71qbd56g67122NyW--MCbPHBSBJf3jHtuMVA30dw%3D%3D' \
        --data-raw '{
        "user": {
            "email": "user1@example.com",
            "password": "password123"
        }
        }'`
