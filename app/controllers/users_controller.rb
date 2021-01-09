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

            puts session
            redirect "users/#{@user.id}" # interpulate
        else
            # false

        end
    end

    get '/signup' do
        erb :signup
    end

    post '/users' do
        
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            #success
            @user = User.create(params)

            redirect "users/#{@user.id}"
        else 
            #false

        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

end
