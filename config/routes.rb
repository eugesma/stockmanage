Rails.application.routes.draw do
  root 'welcome#index'
  
  # Users
  devise_for :users
  
  # Stores
  resources :stores do
    member do
      get "delete"
    end
  end
  
  # Products
  resources :products
end
