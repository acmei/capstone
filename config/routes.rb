Rails.application.routes.draw do
  root 'home#index'

  resources :users, except: [:show]
  resources :answers, as: 'diary'
  resources :sessions, only: [:new, :create, :destroy]

  # Settings
  get     "settings" => "users#show"
  post    "settings" => "questions#create"
  delete  "settings" => "questions#destroy"

  # Login/Logout
  get    "signup"             => "users#new"
  get    "therapist_signup"   => "users#new"
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
