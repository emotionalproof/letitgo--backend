Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :user_activity do
        resources :user_activity_logs
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :user_activities
    end
  end
  namespace :api do
    namespace :v1 do
      resources :activities
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
