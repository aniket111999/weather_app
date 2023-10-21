# README

weather_app is simple application to get sign_up/sign_in and get to know weather condition of city you want to know.


* Ruby version: 2.6.3
* Rails version: 6.0.1 

Steps to be followed to run app:

- get app code into your local from this git repo

- enter into 'weather_app' folder and hit 'bundle install' in your terminal. this will install all necessary gems and dependencies.

* Database creation
- create DB connection: (make sure you have postgres installed on your system)
- hit 'rails db:create' to create postgres development and test databases in your local.
- hit 'rails db:migrate' to do migrations on both databases.
- hit 'rails db:seed' to have seed.rb dummy data to be added in your databases.

- run application on local server:
  - hit 'rails s -b 0.0.0.0 -p 3000' in your terminal (make sure you are not running any other task on port 3000)
  - this will run app in web browser with login screen

    
