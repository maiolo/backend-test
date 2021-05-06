# Readme

## Intro
This is the Version 0.9 of the project.

## How to run

You'll need:
* Ruby Version '2.6.5'
* Rails Version '6.0.3.4'
* sqlite3 1.4

Then:
* Clone the repository to your machine
* run the commands:
 ´´´
 bundle
 yarn
 rails db:create
 rails db:migration
 rails server
 ´´´
 * access: localhost:3000 on your browser
 * use the url https://raw.githubusercontent.com/maiolo/backend-test/master/app/assets/payload.json to make the parsing and request to the API

### Database schema
Project used to prepare the database:
https://kitt.lewagon.com/db/30242

## Next updates

* refactor of the libs
* relocation of the request method, and exclusion of the send_data lib
