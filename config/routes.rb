Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
   }

  resources :users do
    post :details
  end
  
  resources :evaluations, only: [:index, :new, :create, :destroy]
end
