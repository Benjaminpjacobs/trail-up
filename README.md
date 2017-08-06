# Trail Up! The social hiking app

## A solution for the social hiker. 

The live version of the site can be found [here](https://trail-up.herokuapp.com).

![alt text](screen_shots/TrailUpSS1.png)

### The Idea:

Bringing together the Hiking Project API with the power of the Google Maps platfom, this application offers the user the power to browse from thousands of trails across North America and create events centered around a particular trail. They can then connect with other outdoor enthusiasts to create organized social outings.

![alt text](screen_shots/TrailUpSS2.png)

### The Stack:
In addition to a Rails backend TrailUp utilizes:
  * Postgres Databse
  * AWS cloud storage 
  * Meetup and Fitbit OAuth 
  * JavaScript and JQuery 
  * SASS


### The Flow:

As a user, one might beging by navigating to the Find Trails page to search and browse for trails in a given location(zipcode, address, state, etc). Once a trail has been found, the user can retrieve directions directly to that trailhead or select the trail in order to create an event. If the user would like to generate an event based on a new trail that option can be fufilled through the create a trail tab. There photos can be uploaded, trails can be geolocated and details can be entered. From there, event specifics or entered and the event will become searchable by any active users. Users can also join the event once logged in. Creating an account can be accomplished both through internal authorization or through the Meetup application OAuth.

### The Future:

This project is an active work in progress and future features include implementations of a friend network, internal chat and message boards regarding events, the ability to make events private or public and expansion into other outdoor APIs to include sports like climbing, cycling and trail running.
