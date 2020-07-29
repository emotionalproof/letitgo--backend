class Api::V1::UserActivityLogsController < ApplicationController
    before_action :find_user_activity_log, only: [:show, :update, :destroy]

    def index
        user_activity_logs = UserActivity.all
        render json: user_activity_logs
    end

    def by_user
        user_id = params[:id]
        logs = UserActivityLog.all
        user_logs = logs.select { |log| log.user_activity.user.id == user_id} 
        render json: user_logs
    end

    def show
        render json: @user_activity_log
    end

    def create
        user_activity_log = UserActivity.create!(user_activity_log_params)
        render json: user_activity_log 
    end

    def update
        @user_activity_log.update!(user_activity_log_params)
        render json: @user_activity_log 
    end

    def destroy
        @user_activity_log.destroy!
        render json: {}
    end
   
    private
    
    def find_user_activity_log
        @user_activity_log = UserActivity.find(params[:id])
    end

    def user_activity_log_params
        params.permit(:position, :user_id, :activity_id, :completed)
    end
    
end
