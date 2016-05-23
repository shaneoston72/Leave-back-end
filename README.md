# Leave, a smart alarm for London Transport
Leave is an app that intelligently sets a mobile device notification to tell the user to leave the London Tube station. Based on a starting station and an ending station, the app queries TFL's system for the route and any anticipated disruptions effecting the timeliness of the journey. Leave also compensates for weather conditions, allowing more time for inclement weather. 

## Rails Backend
This repo holds the Rails backend that queries external services and performs a complex calculation to determine the best departure time given transport and weather conditions. Rails is configured as an API that receives RESTful calls from the Ionic front end application (see (Leave front end)[https://github.com/shaneoston72/smartAlarm-mobile]). 

## Technologies used
* Rails
* rails-api
* HTTPParty
* Active Model Serializers
* Postgresql

## Challenges
This project was executed leveraging Rails' built-in scaffolding to quickly turn up the API. At first, we did not configure Rails as an API application which caused significant issues when it came time to have the front end app "talk" with Rails server. Rather than troubleshoot that issue, we elected to scrap our work thus far and start again, this time using the rails-api gem. Within an hour we had a working application that responded to the front end's requests for data.

