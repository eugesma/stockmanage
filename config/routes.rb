Rails.application.routes.draw do
  root 'welcome#index'
  
  # Users
  devise_for :users
  
  resources :clients do
    member do
      get "delete"
    end
  end

  # Stores
  resources :stores do
    member do
      get "delete"
    end
  end
  
  # Products
  resources :products
end
