require 'sinatra/base'

# require controllers, views, helpers
Dir.glob('./{controllers,models,helpers}/*.rb').each { |file| require file }

map('/') { run SearchController }
map('/session') { run SessionController }
