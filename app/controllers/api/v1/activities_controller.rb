class Api::V1::ActivitiesController < ApplicationController

    def index 
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity, :include => {
            :user_activities => {:include => :user_activity_logs}}
    end


    
end
