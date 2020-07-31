class Api::V1::UserActivityLogsController < ApplicationController
    before_action :find_user_activity_log, only: [:show, :update, :destroy]

    def index
        user_activity_logs = UserActivityLog.all
        render json: user_activity_logs, :include => {
            :user_activity => {:include => :user}
        }
    end

    def by_user
        user_id = params[:id]
        logs = UserActivityLog.all
        user_logs = logs.select { |log| log.user_activity.user.id == user_id} 
        render json: user_logs
    end



    def create
        user_activity_log = UserActivityLog.create!(user_activity_log_params)
        render json: user_activity_log 
    end


    def destroy
        @user_activity_log.destroy!
        render json: {}
    end
   
    private
    
    def find_user_activity_log
        @user_activity_log = UserActivityLog.find(params[:id])
    end

    def user_activity_log_params
        params.require(:user_activity_log).permit!
    end
    
end
