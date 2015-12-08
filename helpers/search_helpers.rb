def search_for_matches(user_car)
  # get all cars towed in database
  # modeled after example in article https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
  url = 'https://data.cityofchicago.org/resource/ygr5-vcbg.json'
  response = HTTParty.get(url)
  all_cars = response.parsed_response

  # create temporary match arrays
  @tier1_match_car = Array.new # Match: plate & state
  @tier2_match_cars = Array.new # Match: make, model, color, style
  @tier3_match_cars = Array.new # Match: make, color, style

  # user attributes will be nil if not selected by the user
  # towed car objec attributes will be nil if that field is returned by API for a given towed car
  # Set dummy values in user car to avoid false car matches
  # i.e. (user plate = nil) & (towed-car-plate = nil) would be a faulty match we want to avoid
  if user_car['plate'] == nil
    user_car['plate'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end
  if user_car['state'] == nil
    user_car['state'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end
  if user_car['style'] == nil
    user_car['style'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end
  if user_car['color'] == nil
    user_car['color'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end
  if user_car['make'] == nil
    user_car['make'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end
  if user_car['model'] == nil
    user_car['model'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end

  # if user_car['towed_to_address'] == nil
  #   user_car['towed_to_address'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  # end
  # if user_car['tow_facility_phone'] == nil
  #   user_car['tow_facility_phone'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  # end
  # if user_car['inventory_number'] == nil
  #   user_car['inventory_number'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  # end

  if user_car['tow_date'] == nil
    user_car['tow_date'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
  end

  p user_car

  all_cars.each do |towed_car|
    # p all_cars.index(towed_car)
    # binding.pry

    if user_car['plate'] == towed_car['plate'] &&
         user_car['state'] == towed_car['state']
        #  p '***************** got a tier1_match'
         @tier1_match_car.push(towed_car)
         break
    elsif user_car['make'] == towed_car['make'] &&
          user_car['model'] == towed_car['model'] &&
          user_car['color'] == towed_car['color'] &&
          user_car['style'] == towed_car['style']
          # p '***************** got a tier2_match'
          @tier2_match_cars.push(towed_car)
    elsif user_car['make'] == towed_car['make'] &&
          user_car['color'] == towed_car['color'] &&
          user_car['style'] == towed_car['style']
          # p '******************got a tier3_match'
          @tier3_match_cars.push(towed_car)
    end

  end

  p '------------tier1_match_car----------'
  p @tier1_match_car.length
  p '------------tier2_match_cars----------'
  p @tier2_match_cars.length
  p '------------tier3_match_cars----------'
  p @tier3_match_cars.length

  return possible_matched_cars = @tier1_match_car + @tier2_match_cars + @tier3_match_cars

# binding.pry
end
