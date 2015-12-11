# CHICAGO TOW TRACKER
Find out if your car is towed in the city of Chicago!  
--A TEAM TBD creation

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

## OPEN ISSUES/BUGS
* httparty only retrieves 1000 items
* protect against multiple adds of same car for a user
* only allow adds for license match / exact match ??  i think we should still
* guard against failed database calls
  * .destroy on nil object because didn't find it first
* edit car = should we allow?


## FEATURES/TODOS - NEEDED FOR MVC
* add car
* make RESPONSIVE!!!!! - s

* test the shiz outta it
* install on server - tomorrow
* README.md
  * installation instructions
  * description, technology used, etc.  see james


## FUTURE FEATURES - WANTED
* remove "state" match stuff because searcher doesn't really need it
* add 4th tier match (2 attributes only) -s
* handle httparty error - d
  * offline
  * doesn't respond.  timeout. This happened while testing!
* update saved car


## FEATURES - IMPLEMENTED
* fix no match happening
* Car search -- add NO MATCH response -s
* user authorization helper function -d
* Search function implemented and unit tested
* Rename session controller to account controller
* database
  * define relationships
  * add database
* x Not found route/erb
x build out car_results:
 * x add dynamic list viewing
 * x loop through ERB
* x add car from search results page
   * x if logged in save car
   * x if not logged in go to register page and save car if registered successfully
   * x delete saved car
   * x add car button from plate search results & description results
    * x go to register page and pass on data if
* user login/registering
      * x allow registration
      * x allow login
      * x hide show elements/features based on if you are logged in or not
* x build out account_view
        * @ all_cars
        * seperate search algorithm by plate & by car info        
* write backend ruby that designates @saved_cars as specific to current user


## CLOSED ISSUES
* got food and nap in on monday afternoon after freaking out


## Interesting stories
* embedded ruby hack
