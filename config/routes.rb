Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'welcome#index'
  
    # Users
    devise_for :users
    
    #Products
    resources :products
      
    # Clients
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
  end
end
