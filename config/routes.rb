Rails.application.routes.draw do
  root "static_pages#home"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "my_games" => "current_user_games#index"
  resources :users
  resources :games do
    resources :moves, except: [:show]
  end
end
