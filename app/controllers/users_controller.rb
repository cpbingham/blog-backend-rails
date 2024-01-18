class UsersController < ApplicationController
    before_action :set_user, only: %i[ destroy ]

    def index
        @users = User.all
        render json: @users
    end

    def create
        # TODO investigate issue with password being filtered out of user_params (strong params) 
        @user = User.new(username: user_params[:username], email: user_params[:email], password: params[:password])
        if @user.save
            render json: {status: 'ok', message: 'created', data: @user}, 
                status: :created, 
                location: @user
        else
            render json: @user.errors, status: :unprocessable_entity 
        end
    end

    def destroy
        @user.destroy
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end