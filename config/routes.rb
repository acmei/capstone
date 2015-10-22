Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :therapists
  resources :diaries
  resources :sessions, only: [:new, :create, :destroy]

  # Login/Logout
  get    "signup"             => "users#new"
  get    "therapist_signup"   => "therapists#new"
  get    "login"              => "sessions#new"
  post   "login"              => "sessions#create"
  delete "logout"             => "sessions#destroy"

  # Account Activation
  resources :account_activations, only: [:edit]

  # Password Reset
  resources :password_resets, only: [:new, :create, :edit, :update]

  # OmniAuth
  get "auth/:provider/callback" => 'sessions#google'
  get "auth/:provider" => 'sessions#google', as: 'google'
end
