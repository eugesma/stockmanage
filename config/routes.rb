Rails.application.routes.draw do
  resources :stores
  devise_for :users

  root 'welcome#index'

  resources :products
end
