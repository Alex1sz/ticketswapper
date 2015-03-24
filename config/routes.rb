Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  resources :tickets

  get :search, :to => 'static_pages#search', :as => 'search'

  get 'users/dashboard', to: 'users#dashboard'
  resources :payments, only: [:new, :create]
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
