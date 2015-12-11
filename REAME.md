# TODO ITEMS

## OPEN ISSUES/BUGS
* httparty only retrieves 1000 items
* fix no match happening
* protect against multiple adds of same car for a user
* only allow adds for license match / exact match
* guard against failed database calls
  * .destroy on nil object because didn't find it first

## FEATURES/TODOS - NEEDED FOR MVC

* user authorization helper function -d
* Car search -- add NO MATCH response -s

* make RESPONSIVE!!!!! - s

* install on server - tomorrow

* README.md
  * installation instructions
  * description, technology used, etc.  see james

* test the shiz outta it

## FUTURE FEATURES - WANTED
* add 4th tier match (2 attributes only) -s
* handle httparty error - d
  * offline
  * doesn't respond.  timeout. This happened while testing!
* update saved car


## FEATURES - IMPLEMENTED
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
