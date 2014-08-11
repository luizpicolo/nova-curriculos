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

  resource :candidates

  # Routes
  get "/oportunidades/:slug" => "jobs#show", :as => :opportunities
  get "/candidato/cadastro" => "candidates#new", :as => :registration_candidate
  get "/recrutador/cadastro" => "recruiters#new", :as => :registration_recruiter
  get "/candidato/curriculo" => "candidates#show", :as => :curriculum_candidate
  get "/candidato/curriculo" => "candidates#show", :as => :candidate
  post "/candidato/curriculo" => "candidates#create"
  patch "/candidato/curriculo" => "candidates#update"

  # Route Root
  root 'home#index'

end
