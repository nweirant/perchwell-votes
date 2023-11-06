# Perchwell Full Stack App 
A full stack web app to vote for your favorite guitar player.

![Screen Shot 2023-11-06 at 1 15 11 PM](https://github.com/nweirant/perchwell-votes/assets/34401822/91bfcce4-4a64-432f-be60-bbf1fda43517)


## Dependencies
Other versions not tested.
1. Rails 7.1
2. Ruby 3.2.2
3. Sqlite3 3.37
4. Node 14.17

 ## Back-end Setup
 1. Install dependencies. In the ```/back-end``` directory, run ```bundle install```
 2. Setup Database. In the ```/back-end``` directory, run ```rails db:migrate```
 3. Seed Database. In the ```/back-end``` directory, run ```rails db:seed```
 4. Start Rails Server. In the ```/back-end``` directory, run ```rails server``` on a new terminal
 5. This will start a server on ```localhost:5000```

 ## Front-end Setup
 1. Install dependencies. In the ```/front-end``` directory, run ```npm install```
 2. Start front-end. In the ```/front-end``` directory, run ```npm start``` on a new terminal
 3. This will run the front-end on ```localhost:3000```

  ## APIs
  Base API url: ```localhost:5000```
  ### GET /clients 
  Return an array of clients with their client_id <br>
  Example Response
  ```
    [
        {
            "client_id": 1,
            "client_name": "Jimi Hendrix",
            "vote_count": 1,543,872
        },
        {
            "client_id": 2,
            "client_name": "Eddie Van Halen",
            "vote_count": 876,456,612
        },
        {
            "client_id": 3,
            "client_name": "Randy Rhoads",
            "vote_count": 166,256,193
        }
    ]
  ```
  ### GET /votes/{client_id} 
  Returns the count of votes performed for a client_id <br>
  Example Response
  ```
      {
          "client_id": 1,
          "client_name": "Jimi Hendrix",
          "vote_count": 1,543,872
      }
  ```
  ### POST /votes/{client_id} 
  Add a row to the votes table for a client id and returns the current count of votes for the client <br>
  Example Response
  ```
      {
          "client_id": 1,
          "client_name": "Jimi Hendrix",
          "vote_count": 1,543,873
      }
  ```

 ### Running Tests
 1. Back-end tests. In ```/back-end``` directory run ```bundle exec rspec```
 2. Front-end tests. In ```/front-end``` directory run ```npm test```
 
