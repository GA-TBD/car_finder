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

end
