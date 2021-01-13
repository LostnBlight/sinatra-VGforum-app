require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "VGforum_app"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
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

    def authorized_to_edit?(complaint)
      complaint.user == current_user
    end
    
  end



end
