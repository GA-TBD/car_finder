class SearchController < ApplicationController

get '/' do
  erb :index
end

post '/' do
  # filter data
  p '--------------posted search params!!!'

  user_car = {
  "model" => params[model],
  "inventory_number" => "6834053",
  "style" => "4D",
  "color" => "BLK",
  "towed_to_address" => "701 N. Sacramento",
  "state" => "IL",
  "plate" => "E540000**",
  "tow_facility_phone" => "(773) 265-7605",
  "tow_date" => "2015-12-08T00:00:00",
  "make" => "BMW"
  }

  @possible_matched_cars = search_for_matches(user_car)

  erb :index
end

end
