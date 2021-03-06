class ApplicationController < Sinatra::Base
  require "bundler"
  Bundler.require

  # Establish connection to database
  ActiveRecord::Base.establish_connection(
    :database => 'car_finder',
    :adapter => 'postgresql'
  )

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  # will be used to display 404 error pages
  not_found do
    erb :not_found
  end

  # enable session support for our application
  enable :sessions

  ############################ HELPER FUNCTIONS BELOW #########################
  #############################################################################

  ########## ACCOUNT RELATED HELPERS ########

  def user_is_logged_in
    if session[:current_user] != nil
      return true
    else
      return false
    end
  end

  def authorization_check
    if session[:current_user] == nil
      redirect '/not_authorized'
    else
      return true
    end
  end

  def add_car_that_user_tried_to_add_before_being_logged_in
    p '---------trying to add stashed car'
    # if a car was stashed from user trying to add a car before being logged in or registered
    if user_is_logged_in && session[:stashed_car] != nil
      p '-------going to save a stashed car'
      car = Saved_Car.new
      p session[:stashed_car]['plate']
      p session[:stashed_car]['state']
      p session[:stashed_car]['make']
      p session[:stashed_car]['mode']
      p session[:stashed_car]['style']
      p session[:stashed_car]['color']
      p session[:current_user].id

      car.plate = session[:stashed_car]['plate']
      car.state = session[:stashed_car]['state']
      car.make = session[:stashed_car]['make']
      car.model = session[:stashed_car]['mode']
      car.style = session[:stashed_car]['style']
      car.color = session[:stashed_car]['color']
      car.id_of_user = session[:current_user].id
      car.save
    end

    session[:stashed_car] = nil
  end

  # helper functions will go here
  def authorization_check
    if session[:current_user] == nil
      redirect '/not_authorized'
    else
      return true
    end
end
  ########## SEARCH HELPERS ########

  def search_by_plate(user_car)
    # get all cars towed in database
    # modeled after example in article https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
    url = 'https://data.cityofchicago.org/resource/ygr5-vcbg.json'
    response = HTTParty.get(url)
    all_cars = response.parsed_response

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

    if user_car['tow_date'] == nil
      user_car['tow_date'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
    end

    # binding.pry

    all_cars.each do |towed_car|
      if user_car['plate'] == towed_car['plate'] &&
           user_car['state'] == towed_car['state']
           exact_match_car = towed_car
           p '--------found plate match!!! towed_car:'
           return towed_car
      end
    end

    # no plate match found
    p '----------no plate match found'
    return nil
  end


  def search_by_car_description(user_car)
    # get all cars towed in database
    # modeled after example in article https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
    url = 'https://data.cityofchicago.org/resource/ygr5-vcbg.json'
    response = HTTParty.get(url)
    all_cars = response.parsed_response

    # create temporary match arrays
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

    if user_car['tow_date'] == nil
      user_car['tow_date'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
    end

    p '------------------search_for_matches()'
    p 'sanitized user_car: '
    p user_car

    all_cars.each do |towed_car|
      if user_car['make'] == towed_car['make'] &&
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

    p '------------tier2_match_cars----------'
    p @tier2_match_cars.length
    p '------------tier3_match_cars----------'
    p @tier3_match_cars.length

    return possible_matched_cars = @tier2_match_cars + @tier3_match_cars

  # binding.pry
  end






end
