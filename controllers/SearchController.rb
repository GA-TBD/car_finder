class SearchController < ApplicationController

get '/' do
  erb :index
end

post '/' do
  # filter data
  p '--------------posted search params!!!'

  user_car = {
  "make" => params[:make],
  "model" => 'asdf',
  "style" => "4D",
  "color" => "BLK",
  "state" => params[:state],
  "plate" => params[:plate],
  }

  p user_car

  @possible_matched_cars = search_for_matches(user_car)


  erb :index
end

end
