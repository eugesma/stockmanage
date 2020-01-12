Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'welcome#index'
  
    # Users
    devise_for :users
    
    #Products
    resources :products

    # Stores
    resources :stores do
      member do
        get "delete"
      end
    end
  
    # Clients
    resources :clients
  end
end
