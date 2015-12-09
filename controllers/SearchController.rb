class SearchController < ApplicationController

get '/' do
  erb :register_login
end

get '/car_results' do
  erb :car_results
end

get '/plate_results' do
  erb :plate_results
end


get '/register_login' do
  erb :register_login
end


post '/' do
  # filter data

  @user_car = {
  :make => params[:make],
  model: params[:model],
  :style => params[:style],
  :color => params[:color],
  :state => params[:state],
  plate: params[:plate]
  }

  p '--------------YoYoYO posted search params received and stored in user_car'
  p '@user_car: '
  p @user_car

  # Binding.pry

  # if a plate search
  if @user_car[:plate] != nil
    p '---------------This is a plate search!'
    @plate_match_car = search_by_plate(@user_car)
    erb :plate_results
  else
    @possible_matched_cars = search_by_car_description(@user_car)
    erb :car_results
  end
end

end
