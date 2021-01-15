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
        if @user && @user.authenticate(params[:password])
            # success

            #remember this is how we log someone in!!!
            session[:user_id] = @user.id 

            puts session
            redirect "users/#{@user.id}" # interpulate
        else
            # false
            flash[:errors] = "Invalid Email or Password, please try again or signup."
            redirect '/login'
        end
    end

    get '/signup' do
        erb :signup
    end

    post '/users' do
        
        @user = User.new(params)
        

        if @user.save

            redirect "users/#{@user.id}"
        else 
            flash[:errors] = "#{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        redirect_if_not_logged_in

        erb :'users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end
