Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :products
    devise_for :users

    root 'welcome#index'    
  end
end
