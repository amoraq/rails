class UsersController < ApplicationController
    def show
        @user = User.find(session[:user_id])
    end

    def new
        user = User.new
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to "/users/#{user.id}"
        else
            flash[:messages] = user.errors.full_messages
            redirect_to '/users/new'
        end
    end

    def edit
        @user = User.find(session[:user_id])
    end

    def update

        user = User.find(session[:user_id])

        user.update(email: user_params[:email], name: user_params[:name])

        if user.save
            redirect_to "/users/#{user.id}"
        else
            flash[:messages] = user.errors.full_messages
            redirect_to "/users/#{user.id}/edit"
        end
    end

    def destroy
        user = User.find(session[:user_id])

        user.destroy

        session[:user_id] = nil

        redirect_to '/sessions/new'
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
