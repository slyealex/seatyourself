Rails.application.routes.draw do

  root ''

  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
    resources :reservations
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :destroy]
end
