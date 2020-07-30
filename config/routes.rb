Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
        get 'users/login/:username', to: 'users#login', as: 'user_login'
        get 'users/:id/user_activities', to: 'users#routine_items', as: 'user_routine_items'
      resources :user_activity_logs
        get 'logs/user_activity/user/:id', to: 'user_activity_logs#by_user'
        get 'user_activity_logs/remember', to: "user_activity_logs#remember"
      resources :user_activities
        get 'user_activities/user/:username', to: 'user_activities#by_user'
        get "user_activities/weather/:location", to: 'user_activities#fetch_weather'
        get "user_activities/activities/news/", to: 'user_activities#fetch_news'
      resources :activities
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
