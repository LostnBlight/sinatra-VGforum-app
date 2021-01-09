require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "VGforum_app"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?

      !!current_user # double bang
    end

    def current_user
      # find gives an error and we want it to give us nil so im using find_by
      # pretty sure this saves how many times the "current user" is called
      @current_user ||= User.find_by(id: session[:user_id])
    end


end
