Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :therapists
  resources :sessions, only: [:new, :create, :destroy]

  # Login/Logout
  get    "signup"             => "users#new"
  get    "therapist_signup"   => "therapists#new"
  get    "login"              => "sessions#new"
  post   "login"              => "sessions#create"
  delete "logout"             => "sessions#destroy"

  # Account Activation
  resources :account_activations, only: [:edit]

  # OmniAuth
  get "auth/:provider/callback" => 'sessions#create'
  get "auth/:provider" => 'sessions#create', as: 'google'
end
