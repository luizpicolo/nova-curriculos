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
      :omniauth_callbacks => 'omniauth_callbacks'
  }

  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resource :candidates

  # candidate
  get "/candidato/cadastro" => "candidates#new", :as => :new_candidate
  get "/contratante/cadastro" => "contractors#new", :as => :new_contractor
  get "/candidato/curriculo" => "candidates#show", :as => :show_curriculum_candidate
  get "/candidato/curriculo" => "candidates#show", :as => :candidate
  get "/candidato/vagas" => "candidates#show_vacancies", :as => :show_vacancies
  get "/curriculo/:slug" => "candidates#show_profile", :as => :show_candidate_profile
  post "/candidato/curriculo" => "candidates#create"
  patch "/candidato/curriculo" => "candidates#update"

  # Company
  get "contratante/empresa" => "company#show", :as => :companies
  get "contratante/empresa" => "company#show", :as => :company
  get "/contratante/vaga/:id/candidatos" => "company#show_candidates_for_vancancy", :as => :candidate_for_vacancies
  post "contratante/empresa" => "company#create"
  patch "contratante/empresa" => "company#update"

  # jobs
  get "/oportunidades" => "jobs#index", :as => :jobs
  get "/oportunidades/:slug" => "jobs#show", :as => :show_job
  get "/oportunidades/:id" => "jobs#show", :as => :job
  get "/contratante/cadastrar-vaga" => "jobs#new", :as => :new_vacancy
  get "/contratante/vagas" => "jobs#index", :as => :vacancies
  get "/contratante/vagas/:id" => "jobs#edit", :as => :edit_vacancy
  post "/oportunidades" => "jobs#create"
  patch "/oportunidades/:slug" => "jobs#update"
  delete "/oportunidades/:id" => "jobs#destroy", :as => :destroy_job
  post "/oportunidades/:job/candidatar" => "candidates#apply_for_job", :as => :apply_for_job

  # Academic Trainings
  get "/candidato/curriculo/fa/:academic_training_id" => "candidates#show", :as => :edit_academic_trainings
  get "/academic_trainings" => "academic_trainings#index", :as => :academic_trainings
  get "/academic_trainings" => "academic_trainings#index", :as => :academic_training
  post "/academic_trainings" => "academic_trainings#create", :as => :create_academic_trainings
  patch "/academic_trainings" => "academic_trainings#update", :as => :update_academic_trainings
  delete "/academic_trainings/:id" => "academic_trainings#destroy", :as => :destroy_academic_trainings

  # Extras Courses
  get "/candidato/curriculo/ce/:extra_course_id" => "candidates#show", :as => :edit_extra_courses
  get "/extra_courses" => "extra_courses#index", :as => :extra_courses
  get "/extra_courses" => "extra_courses#index", :as => :extra_course
  post "/extra_courses" => "extra_courses#create", :as => :create_extra_courses
  patch "/extra_courses" => "extra_courses#update", :as => :update_extra_courses
  delete "/extra_courses/:id" => "extra_courses#destroy", :as => :destroy_extra_courses

  # Extras Courses
  get "/candidato/curriculo/lg/:language_id" => "candidates#show", :as => :edit_languages
  get "/language" => "languages#index", :as => :languages
  get "/language" => "languages#index", :as => :language
  post "/language" => "languages#create", :as => :create_languages
  patch "/language" => "languages#update", :as => :update_languages
  delete "/language/:id" => "languages#destroy", :as => :destroy_languages

  # Professional Aŕeas
  get "/candidato/curriculo/pa/:professional_experience_id" => "candidates#show", :as => :edit_professional_experiences
  get "/professional_experience" => "professional_experiences#index", :as => :professional_experiences
  get "/professional_experience" => "professional_experiences#index", :as => :professional_experience
  post "/professional_experience" => "professional_experiences#create", :as => :create_professional_experiences
  patch "/professional_experience" => "professional_experiences#update", :as => :update_professional_experiences
  delete "/professional_experience/:id" => "professional_experiences#destroy", :as => :destroy_professional_experiences

  # pagamentos
  get "/cart/checkout/:id" => "cart#checkout", :as => :cart_checkout
  get "/pedido/efetuado" => "cart#sucess"
  post "/cart/notifications" => "cart#confirm"

  # Route Root
  root 'home#index'

end
