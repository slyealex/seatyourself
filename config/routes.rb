Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants do
    resources :reservations
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
