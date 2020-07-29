require "net/http"
require "open-uri"
require "json"
require 'openssl'

WEATHER_API_KEY = ENV['weather_api_key']

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
        location = params[:location].split(' ').join('%20')
        source = "https://community-open-weather-map.p.rapidapi.com/weather?units=imperial&q=#{location}"
        url = URI(source)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'
        request["x-rapidapi-key"] = 'ea4deba157msh20974ba3dd19506p11f45djsna288c2eedde7'
        response = http.request(request)
        data = response.read_body
        render json: data
    end

    def fetch_news

    end
    

    private
    
    def find_user_activity
        @user_activity = UserActivity.find(params[:id])
    end

    def user_activity_params
        params.permit(:position, :user_id, :activity_id, :completed)
    end
end
