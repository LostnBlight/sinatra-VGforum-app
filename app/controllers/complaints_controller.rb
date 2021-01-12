class ComplaintsController < ApplicationController
    #GOALS: be able to create a complaint for others to see and be able to choose the game you are complaining about!

    get '/complaints/new' do
        erb :'/complaints/new'
    end

end
