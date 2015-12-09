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

  @user_car = {
  "make" => params[:make],
  "model" => params[:model],
  "style" => params[:style],
  "color" => params[:color],
  "state" => params[:state],
  "plate" => params[:plate]
  }

  # need @type_of_search logic (i need it on the other side)

  # (below is pseudo code)

  # if user car object coming in has state + plate
  #   @type_of_search= 'plate'
  # else
  #   @type_of_search= 'plate'
  # end

  p '--------------posted search params received and stored in user_car'
  p 'user_car: '
  p user_car

  @possible_matched_cars = search_for_matches(user_car)
  @plate_match_car = nil


  erb :results

  if @possible_matched_cars[0][:plate] == @user_car[:plate]
    @plate_match_car = @possible_matched_cars[0]
    erb :plate_results
  else
    erb :car_results
  end


end
