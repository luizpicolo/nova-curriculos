Rails.application.routes.draw do
  
  # Devise Routes
  devise_for :users
  
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

end
