class SessionsController < ApplicationController
    def new
        #code
    end

    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else
            flash[:errors] = ["Invalid combination"]
            redirect_to sessions_new_path
        end
    end

    def destroy
        session.clear
        redirect_to '/sessions/new'
    end
end
