class ComplaintsController < ApplicationController
    #GOALS: be able to create a complaint for others to see and be able to choose the game you are complaining about!

    get '/complaints/new' do
        erb :'/complaints/new'
    end

    post '/complaints' do
        if !logged_in?
            redirect '/'
        end
        


        if params[:content] != ""
            @complaint = Complaint.create(content: params[:content], user_id: current_user.id)
            redirect "/complaints/#{@complaint.id}"
        else
            redirect '/complaints/new'
        end
    end

    get '/complaints/:id' do
        set_complaint
        erb :'complaints/show'
    end

    get '/complaints/:id/edit' do
        set_complaint
        if logged_in?
            if @complaint.user == current_user
                erb :'/complaints/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/complaints/:id' do
        set_complaint
        if logged_in?
            if @complaint.user == current_user

                @complaint.update(content: params[:content])

                redirect "/complaints/#{@complaint.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end



    def set_complaint
        @complaint = Complaint.find(params[:id])
    end

end
