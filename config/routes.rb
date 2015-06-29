Rails.application.routes.draw do
  root "games#index"
  resources :users
  resources :games do
    resources :moves, only: [:index, :new, :create]
  end
end
