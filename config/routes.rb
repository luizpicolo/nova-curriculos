Rails.application.routes.draw do
  
  # Devise Routes
  devise_for :user, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'register',
      sign_up: 'signup'
  }, controllers: {
      :registrations => 'registrations',
      #:sessions => 'sessions',
      #:omniauth_callbacks => 'omniauth_callbacks'
  }
  
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Routes
  get "/oportunidades/:slug" => "jobs#show", :as => :opportunities
  get "/cadastro/candidatos" => "candidates#new", :as => :registration_candidates
  get "/cadastro/recrutadores" => "recruiters#new", :as => :registration_recruiters

  # Route Root
  root 'home#index'

end
