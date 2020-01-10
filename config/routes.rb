Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    resources :products
    devise_for :users

    root 'welcome#index'
  end
end
