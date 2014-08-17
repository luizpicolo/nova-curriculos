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

  # Academic Trainings
  get "/candidato/curriculo/fa/:academic_training_id" => "candidates#show", :as => :edit_academic_trainings
  get "/academic_trainings" => "academic_trainings#index", :as => :academic_trainings
  get "/academic_trainings" => "academic_trainings#index", :as => :academic_training
  post "/academic_trainings" => "academic_trainings#create", :as => :create_academic_trainings
  patch "/academic_trainings" => "academic_trainings#update", :as => :update_academic_trainings
  delete "/academic_trainings/:id" => "academic_trainings#destroy", :as => :destroy_academic_trainings

  # Route Root
  root 'home#index'

end
