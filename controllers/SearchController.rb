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


post '/' do
  @user_car = {
    'make' => params[:make],
    'model' => params[:model],
    'style' => params[:style],
    'color'=> params[:color],
    'state' => params[:state],
    'plate' => params[:plate]
    }

  p '--------------YoYoYO posted search params received and stored in user_car'
  p '@user_car: '
  p @user_car

  # Binding.pry ??? Why doesn't this let me see @user_car.  it was nil??!!

  # if a plate search
  if @user_car['plate'] != nil
    p '---------------This is a plate search! Calling helper search_by_plate()'
    @plate_match_car = search_by_plate(@user_car)
    erb :plate_results
  else
    p '---------------This is a car description search! Calling helper search_by_car_description()'
    # @no_match = false
    @possible_matched_cars = search_by_car_description(@user_car)
    if @possible_matched_cars.length < 1
      @no_match = true
    end
    # binding.pry
    erb :car_results
  end
end

end
