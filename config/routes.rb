Rails.application.routes.draw do

  root 'sessions#new'

  resources :restaurants do
    resources :reservations
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
