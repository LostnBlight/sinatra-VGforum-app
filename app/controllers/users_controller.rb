class UsersController < ApplicationController

    # GET and POST routes for login/signup
    # GET route renders(displays) login/signup page
    # POST is to create the session (receiving the login form, finding the user, loging in the user.)
    get '/login' do
        erb :login
    end

    # We want to be able to.. (find the user, verify user, log in the user, redirect user.)
    post '/login' do
        # Do not forget the key (email)
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            # success
            session[:user_id] = @user.id

            redirect "users/#{@user.id}" # interpulate
        else
            # false
        end
    end

    get '/signup' do
        
    end

    get '/users/:id' do
        "This is going to be the show route"
    end

end
