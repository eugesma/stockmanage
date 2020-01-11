Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root 'welcome#index'
    
    #Products
    resources :products
    
    #Users
    devise_for :users

    # Stores
    resources :stores do
      member do
        get "delete"
      end
    end
    
  end
end
