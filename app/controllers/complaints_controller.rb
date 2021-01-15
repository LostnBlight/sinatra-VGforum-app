class ComplaintsController < ApplicationController

    get '/complaints' do
        @complaints = Complaint.all
        erb :'complaints/index'
    end


    get '/complaints/new' do
        erb :'/complaints/new'
    end

    post '/complaints' do
        redirect_if_not_logged_in

        if params[:content] != ""
            @complaint = Complaint.create(content: params[:content], user_id: current_user.id)
            redirect "/complaints/#{@complaint.id}"
        else
            flash[:errors] = "Please add text to complaint."
            redirect '/complaints/new'
        end
    end

    get '/complaints/:id' do
        set_complaint
        if authorized_to_edit?(@complaint)
            erb :'complaints/show_user'
        else
            erb :'complaints/show'
        end
    end

    get '/complaints/:id/edit' do
        set_complaint
        redirect_if_not_logged_in
        if authorized_to_edit?(@complaint)
            erb :'/complaints/edit'
        else
            redirect "users/#{current_user.id}"
        end
    end

    patch '/complaints/:id' do
        set_complaint
        redirect_if_not_logged_in
        if @complaint.user == current_user && params[:content] != ""

            @complaint.update(content: params[:content])

            redirect "/complaints/#{@complaint.id}"
        else
            flash[:errors] = "Cannot edit complaint as empty, you can always delete complaints."
            redirect "/complaints/#{@complaint.id}"
        end
    end

    delete '/complaints/:id' do
        set_complaint
        if authorized_to_edit?(@complaint)
            @complaint.destroy
            redirect '/complaints'
        else
            redirect '/complaints'
        end
    end



    def set_complaint
        @complaint = Complaint.find(params[:id])
    end

end
