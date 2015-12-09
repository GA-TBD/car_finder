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

post '/' do
  # filter data

  user_car = {
  "make" => params[:make],
  "model" => params[:model],
  "style" => params[:style],
  "color" => params[:color],
  "state" => params[:state],
  "plate" => params[:plate],
  }

  p '--------------posted search params received and stored in user_car'
  p 'user_car: '
  p user_car

  @possible_matched_cars = search_for_matches(user_car)
  
  redirect '/results'

end

end
