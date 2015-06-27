Rails.application.routes.draw do
  root "games#index"
  get "/scorebook"  => "games#index"
  get "/profile"  => "users#show"
  resources :users
  resources :games
end
