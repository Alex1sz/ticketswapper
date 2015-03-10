Rails.application.routes.draw do
  root 'static_pages#home'
  resources :tickets
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
