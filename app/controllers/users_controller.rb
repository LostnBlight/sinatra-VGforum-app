class UsersController < ApplicationController

    # GET and POST routes for login/signup
    # GET route renders(displays) login/signup page
    get '/login' do
        erb :login
    end

    get '/signup'
        erb :signup
    end

end
