class AccountController < ApplicationController

  get '/mycars' do
    authorization_check

    p session[:current_user].id
    # binding.pry
    @saved_cars = Saved_Car.where(id_of_user: session[:current_user]['id'])

    erb :account_view
  end


  post '/register' do
    p '------------------inside /register route!'
    puts params

    # binding.pry

    current_user = Account.find_by(user_name: params[:username])
    p current_user

    # current username doesn't exists
    if current_user == nil
      # selected password is not empty & the password matches password confirmation
      if ( params[:password] != nil ) && (params[:password] == params[:password_confirm])
        # create database entry for user
        current_user = Account.new
        current_user.user_name = params[:username]
        current_user.user_email = params[:email]
        current_user.password = params[:password]
        current_user.is_admin = false
        current_user.save

        # save current user in session
        session[:current_user] = current_user

        # set status msg and redirect to shopping list
        @status_msg = 'Thanks for registering, ' + current_user.user_name + '!'
        p '-----------------registration successful------------------'
        # @items = session[:current_user].shopping_items
        # erb :item_read
        add_car_that_user_tried_to_add_before_being_logged_in
        redirect '/account/mycars'

      else
        @status_msg = 'Invalid password or password doesn\'t match'
        p '-----------------Invalid password or password doesn\'t match------------------'
        erb :register_login
      end
    # username already taken
    else
      @status_msg = 'Username taken already!'
      p '-----------------Username taken already!-----------------'

      erb :register_login
    end

  end



  post '/login' do
    p params
    #binding.pry

    # Search for user base on username from form
    current_user = Account.find_by(user_name: params[:username])

    # Current user found
    if current_user != nil
      # Password matches database! Go to list!
      if current_user.password == params[:password]
        session[:current_user] = current_user
        # @items = session[:current_user].shopping_items
        # return erb :item_read
        p '--------------User Logged in Successfully!  going to erb :account_view'
        add_car_that_user_tried_to_add_before_being_logged_in
        redirect '/account/mycars'

      else
        @status_msg = "Invalid password!"
        p '-----------------Invalid password!---------------'
        return erb :register_login
      end

    # Current user not found
    else
      @status_msg = 'Username not found!'
      p '-----------------Username not found!----------------'

      return erb :register_login
    end
  end

  get '/logout' do
    authorization_check
    session[:current_user]=nil
    erb :register_login
  end

  get '/register_login' do
    erb :register_login
  end

  post '/add_car' do


    p '--------------/add_car route.  params are:'
    p params

    if user_is_logged_in
      car = Saved_Car.new
      car.plate = params[:plate]
      car.state = params[:state]
      car.make = params[:make]
      car.model = params[:model]
      car.style = params[:style]
      car.color = params[:color]
      car.id_of_user = session[:current_user].id
      car.save
      p '------------car should be now be added in DB. check it yo'
      redirect '/account/mycars'

    else
      p '------------trying to save car but not logged in!!'
      # stash the car to be saved
      session[:stashed_car] = {
        'plate' => params[:plate],
        'state' => params[:state],
        'make' => params[:make],
        'model' => params[:model],
        'style' => params[:style],
        'color' => params[:color]
      }
      @status_msg = 'Log in or register to save that car!'
      erb :register_login

    end # user_is_logged_in
  end   # end post '/add_car' route

  post '/delete_car' do
    # authorization_check
    # binding.pry
    @car_to_delete = Saved_Car.find_by(id: params['id'])
    @car_to_delete.destroy

    redirect "/account/mycars"

  end

  get 'not_authorized' do
    @status_msg = "Trying to sneak in the back door, eh?  Please log in or register!"
    erb :register_login
  end
end
