Rails.application.routes.draw do
  
  # Devise Routes
  devise_for :users
  
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Jobs
  get "/oportunidades/:slug" => "jobs#show", :as => :opportunities

  root 'home#index'

end
