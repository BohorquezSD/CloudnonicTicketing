# README

## Cloudnonic Event Ticketing API

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
- Update ticket purchase details (buyer_name, quan7ty). **PUT    /api/tickets/:id  The total price is automatically calculated**

For creation or update operations, you must be authenticated in the system.


### Run the application

This application run with ruby "3.2.2" and "rails 7.1.2" the database is sqlite3. You must have installed ruby in version 3.2.2

1. In the root of the app run

        bundle install


2. Install the required gems configure the database with

        rails db:prepare
        rails db:seed
    
3.Run the app (localhost:3000) with

        rails server
    
4. Check the endpoints tests created with rspec 

        rails db:create db:migrate RAILS_ENV=test
        bundle exec rspec
    
5. Analize the code run

        bundle exec rubocop

6. Test the endpoints. You can use postman or use curl, there is an example of login request using curl

        curl --location 'http://localhost:3000/login' \
        --header 'Content-Type: application/json' \
        --header 'Cookie: _cloudnonic_ticketing_session=3gNDDyZ8xyCfA2QA%2FGrpmxe%2FvpvtVgCTiGSdn2dOVFxmTbuCsa2sG8vEbkUKRG%2FNb%2F%2Bnl6WuvpM8SoIV0p4B%2FrVLqJveUhd%2B94x09%2B7POp8LurVHK%2FyyvVRS7SpBxNv4qqigwuofARXF6I9nVOj9B88z5mnrSZ1%2B2h%2FMs1OGDv%2FM38SfjxBp6oayqexIZgy3nyrpBaLrtZdlI0RlEYgOdqOqvSTWzzz2GREbJqqMeTFSskAzzjbuefm3tzTVS%2F1pawsromIWfa1hbp4segvBpBCK4PHa4DU9YHUFk%2BEsxArFUjdTAg%3D%3D--71qbd56g67122NyW--MCbPHBSBJf3jHtuMVA30dw%3D%3D' \
        --data-raw '{
        "user": {
            "email": "user1@example.com",
            "password": "password123"
        }
        }'
Once authenticated, yoy can perform creation and updating operations.

## BONUS
1) The Devise gem was used for login authentication for the data modification operations.
2) The max_tickets attribute was added as a limit for tickets per event, and a callback was used to verify that the ticket can be created.

## Future developments:
As possible improvements in the future, pagination of records, log handling, and deletion methods can be added.

## TEST CASES

### Login

![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/49f7d9a5-6f3a-4872-b9c0-94a2cfafd4fa)

### logout

![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/ac896061-1435-40d9-a5d3-83014f9f6d1f)

### Create a new event.
- Not logged
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/c3865140-c67a-49b9-a08a-e6b61bb90da3)
- Success
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/7ae51063-ac89-4934-9b41-9218ecef9554)
- Validation fail
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/77e98b6a-949c-436d-b7b4-4a501a2ce21a)


### Retrieve a list of all events.
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/786fd155-cf3c-4246-9cb5-d52767a0cc46)

### Retrieve a single event by its ID.
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/7068b9b1-d576-45f2-9e1d-d221242850ae)

### Create a new ticket purchase.
- Not logged
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/75abd89d-767f-4a4a-9bd6-1d7f1c122fe8)

- Success
          
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/f964ad11-5ade-42d6-af53-099d8df434e9)
       
- Validations fail
        
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/600e9c6a-e9e6-473f-ade5-57e660eb6c36)
        
- Bonus
        
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/2c977ab2-3e15-47b8-9768-12ff9cb58a8c)

### Retrieve ticket purchase details by ticket ID.
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/9b95cd44-68cb-4936-8832-4c67a3a666a2)

### Retrieve a list of ticket purchases for a specific event.
- success
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/2a23d958-db52-47f8-bbfc-2711b29fe448)

- not found event
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/09ac9ccd-dc71-46fa-82f5-359db253c038)

### Update event details (name, description, location, start_time, end_time, 
ticket_price).
- not logged
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/f6835f12-ff9c-42d3-a374-29f2a5b39258)

- success
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/64f60925-cf7c-4a5f-b9da-63fad4db6789)

- validation fail
  
![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/b2cc30f1-c081-429f-af0f-9b2ff52b1296)
  
### Update ticket purchase details (buyer_name, quantity).
- not logged
  
 ![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/37f42d92-0256-4cc1-97e2-8bc85cd69eee)
 
- success
  
 ![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/5ac8756b-024d-45f7-9688-fc4fadb16531)
 
- validation fail

![image](https://github.com/BohorquezSD/CloudnonicTicketing/assets/24967174/4f2c8a07-f838-4fee-9281-37e13c55ffcf)

