Rails.application.routes.draw do
  root "games#index"
  resources :users
  resources :games do
    resources :moves, except: [:show]
  end
end
