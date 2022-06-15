Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords:     'users/passwords',
    sessions:      'users/sessions',
  }

  resources :users do
    post :details
  end
  
  resources :evaluations, only: [:index, :new, :create, :destroy]
end
