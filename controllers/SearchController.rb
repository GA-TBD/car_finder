class SearchController < ApplicationController

get '/' do
  erb :register_login
end

get '/results' do
  erb :results
end


get '/register_login' do
  erb :register_login
end

end
