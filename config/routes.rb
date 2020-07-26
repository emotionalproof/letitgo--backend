Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_activity_logs
    end
  end
  namespace :api do
    namespace :v1 do
      resources :user_activities
    end
  end
  namespace :api do
    namespace :v1 do
      resources :activities, except: [:show]
        get: 'activities/:name', to: "activities#show", as: 'activity'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
        get 'users/login/:username', to: 'users#show', as: 'user_login'
        get 'users/:id/user_activities', to: 'users#user_activities', as: 'user_user_activities'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
