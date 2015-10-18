Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  # Custom Routes
  get    "login"  => "sessions#new"
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy"
end
