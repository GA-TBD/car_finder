# CHICAGO TOW TRACKER
Find out if your car is towed in the city of Chicago!  
--A TEAM TBD creation

![ChiTowTracker](http://i.imgur.com/wnjYIMs.jpg)
=======
#### Dude? Where's your car?

## Technologies Used
* FRONT-END: HTML, CSS, Javascript
* BACK-END: Ruby, Sinatra Framework, ActiveRecord ORM, postgresql

## Approach taken

#### Planning Phase
We started by discussing user stories and then doodled out all the possible actions a user would take on our page.
This helped us to create our detailed wire frame that lays out every possible route, view, and functionality we would need to build in.

![MainWireFrame](https://ga-students.slack.com/files/simkhosla/F0G3VBG6A/fullmap.jpg)

## Installation Instructions
## Unsolved problems



#

# TODO ITEMS
=======
We started by discussing user stories and then doodled out all the possible actions a user would take on our page.
This helped us to create our detailed wire frame that lays out every possible route, view, and functionality we would need to build in.

![MainWireFrame](https://dl.dropboxusercontent.com/u/102602916/Wireframing/FULLMAP.jpg)

We tried to map out the entire scope of the project early so we wouldn't be stepping on each others' toes during production. Wireframing is wonderful.


##INSTALLATION INSTRUCTIONS
#### Login and setup servers
From a handy guide written by James Traver
##### Provision the server
1. ssh root@[your.ip.address.here] (if you have ssh setup)
2. apt-get update > y at prompt
3. apt-get install git
4. apt-get install ruby
5. gem install bundler
6. gem install pry
7. gem install json -v '1.8.2' (makes sure this works before bundling)
8. bundle
10. apt-get install build-essential -- plox
11. apt-get install ruby-dev
#### Install the app
1. git clone https://github.com/GA-TBD/car_finder.git

#### Create database
1. psql
2. Run the commands in /db/migrations.sql

#### Run the app
1. nohup bundle exec rackup -p 80 --host 0.0.0.0 &
  * nohup - Allows the app to run even after terminal is closed.
  * "-p 80"  specifies port 80
  * "--host" specifies local host
  * "&" run in the background


## LIVE LINK:
http://159.203.25.108

## HOW IT WORKS/FEATURES:
* use the search functionality on the left to find you car either by PLATE # or CAR DESCRIPTION

### Plate Search:
  - if your car is found, it'll show you which lot it's at and a map of how to get there
  - you also have the option to save this search as your car for future tow tracker searches.

### Car Description Search:
  - in case you don't have your plate number on you,

## OPEN ISSUES/BUGS
* httparty only retrieves 1000 items
* protect against multiple adds of same car for a user
* only allow adds for license match / exact match ??  i think we should still
* guard against failed database calls
  * .destroy on nil object because didn't find it first
* edit car = should we allow?


## FUTURE FEATURES - WANTED
* remove "state" match stuff because searcher doesn't really need it
* add 4th tier match (2 attributes only) -s
* handle httparty error - d
  * offline
  * doesn't respond.  timeout. This happened while testing!
* update saved car
