Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
        get 'users/login/:username', to: 'users#login', as: 'user_login'
        get 'users/:id/user_activities', to: 'users#routine_items', as: 'user_routine_items'
      resources :user_activity_logs  
      resources :user_activities
      resources :activities
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
