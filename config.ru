require 'sinatra/base'


# work around because the loop below tries to require AccountController.rb first but fails because ApplicationController is not yet defined
require './controllers/ApplicationController'
# require controllers, views, helpers
Dir.glob('./{controllers,models,helpers}/*.rb').each { |file| require file }


map('/') { run SearchController }
map('/account') { run AccountController }
