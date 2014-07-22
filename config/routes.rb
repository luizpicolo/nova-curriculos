Rails.application.routes.draw do
  
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

end
