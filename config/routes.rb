Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  resources :tickets
  get 'users/dashboard', to: 'users#dashboard'
  resources :payments, only: [:new, :create]
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
