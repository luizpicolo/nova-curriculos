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
  get "/candidato/cadastro" => "candidates#new", :as => :registration_candidate
  get "/recrutador/cadastro" => "recruiters#new", :as => :registration_recruiter
  get "/candidato/curriculo" => "candidates#show_curriculum", :as => :curriculum_candidate

  # Route Root
  root 'home#index'

end
