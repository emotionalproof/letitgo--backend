class Api::V1::UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :routine_items]

    def index
        users = User.all
        render json: users
    end

    def login
        @user = User.find_by(username: params[:username])
        render json: @user.to_json(:include => {
            :user_activities => {:include => :user_activity_logs}
        })
    end
    
    def show
        render json: @user.to_json(:include => {
            :user_activities => {:include => :user_activity_logs}
        })
    end

    def create
        user = User.create!(user_params)

        render json: user
    end

    def update
        @user.update!(user_params)

        render json: user
    end

    def routine_items
        routine_items = @user.user_activities.select { |user_activity| user_activity.completed == false}
        render json: routine_items
    end

    def destroy
        @user_activity.destroy!
        render json: {}
    end

    private
    
    def find_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.permit(:first_name, :last_name, :username, :password, :password_confirmation)
    end
end
