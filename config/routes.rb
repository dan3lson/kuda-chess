Rails.application.routes.draw do
  resources :users
  resources :games do
    resources :moves, only: [:index, :new, :create]
  end
end
