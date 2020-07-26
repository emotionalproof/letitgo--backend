class Api::V1::UserActivitiesController < ApplicationController
    before_action :find_user_activity, only: [:show, :update, :destroy]

    def index
        user_activities = UserActivity.all
        render json: user_activities
    end

    def show
        render json: @user_activity
    end

    def create
        user_activity = UserActivity.create!(user_activity_params)
        render json: user_activity 
    end

    def update
        @user_activity.update!(user_activity_params)
        render json: @user_activity 
    end

    def destroy
        @user_activity.destroy!
        render json: {}
    end

    private
    
    def find_user_activity
        @user_activity = UserActivity.find(params[:id])
    end

    def user_activity_params
        params.permit(:position, :user_id, :activity_id, :completed)
    end
end
