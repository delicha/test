Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users

  resources :users do
    post :details
  end
  
  resources :evaluations, only: [:index, :new, :create, :destroy]
end
