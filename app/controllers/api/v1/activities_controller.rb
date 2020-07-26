class Api::V1::ActivitiesController < ApplicationController

    def index 
        activities = Activity.all
        render json: activities
    end

    def show
        activity = Activity.find_by(name: params[:name])
        render json: activity
    end
    
end
