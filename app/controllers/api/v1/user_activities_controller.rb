require ‘open-uri’
require ‘net/http’
require ‘json’

class Api::V1::UserActivitiesController < ApplicationController
    before_action :find_user_activity, only: [:show, :update, :destroy]

    def index
        user_activities = UserActivity.all
        render json: user_activities
    end

    def by_user
        user = User.find_by(username: params[:username])
        user_data = user.user_activities
        render json: user_data
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

    def fetch_weather 
        location = params[:location]
        url = https://community-open-weather-map.p.rapidapi.com/weather?units=imperial&q=${uriEncodedCity}
    end

    const getForecast = e => {
        e.preventDefault()
        fetch(`https://community-open-weather-map.p.rapidapi.com/weather?units=imperial&q=${uriEncodedCity}`, {
            "method": "GET",
            "headers": {
              "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
                "x-rapidapi-key": "ea4deba157msh20974ba3dd19506p11f45djsna288c2eedde7"
             }
        })
        .then(res => res.json())
        .then(res => {
          setResponseObj(res)
        })
        .catch(err => {
            console.log(err);
        });
    
    private
    
    def find_user_activity
        @user_activity = UserActivity.find(params[:id])
    end

    def user_activity_params
        params.permit(:position, :user_id, :activity_id, :completed)
    end
end
