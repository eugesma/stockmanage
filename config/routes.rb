Rails.application.routes.draw do
  devise_for :users
  
  #unless Rails.application.config.consider_all_requests_local
    # having created corresponding controller and action
    get '*path', to: 'errors#error_404', via: :all
  #end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
