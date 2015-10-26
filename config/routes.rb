Rails.application.routes.draw do
  root 'home#index'

  resources :answers
  resources :questions
  resources :skills, only: [:index, :show]
  resources :users, except: [:show]
  resources :contacts, except: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  # Settings
  get     "settings" => "users#show"
  post    "settings" => "questions#create"
  delete  "settings" => "questions#destroy"
  post    "photo"    => "photos#create", as: 'change_photo'

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
