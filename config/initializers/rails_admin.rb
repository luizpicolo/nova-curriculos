RailsAdmin.config do |config|

  ################  Global configuration  ################
  config.main_app_name = ['Nova Currículos', 'Admin']
  config.default_items_per_page = 20
  #config.included_models = ["Company", "TypeCompany", "BranchOperation"]
  config.compact_show_view = false

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! :scope => :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  ###  Academic Training  ###
  config.model 'AcademicTraining' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :candidate
      field :schooling
    end
    edit do
      field :schooling
      field :name_of_course
      field :start_date
      field :finish_date
      field :institution
    end
    # show do
    #   field :id
    #   field :candidate
    #   field :schooling
    # end
  end

  ### Jobs Category ###
  config.model 'Schooling' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
  end

  ### Curse Extras ###
  config.model 'ExtraCourse' do
    navigation_label 'Candidatos'
  end

  ### Language ###
  config.model 'Language' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :speech
      field :candidate
    end
    edit do
      field :speech, :enum do
        enum do
          ['ingles', 'white']
        end
      end
      field :level
    end
  end


  ###  Candidate  ###
  config.model 'Candidate' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :user
      field :mobile_phone
    end
    edit do
      field :user, :belongs_to_association do
        inline_add false
        inline_edit false
      end
      field :birth_date
      field :is_male
      field :zip_code
      field :street
      field :number
      field :complement
      field :home_phone
      field :mobile_phone
      field :city
      field :image, :carrierwave
      field :languages
      field :extra_courses
      field :professional_areas
      field :hierarchical_levels
      field :professional_experiences
      field :academic_trainings
    end
    # show do
    #   field :id
    #   field :user
    #   field :link
    #   field :image
    # end
  end

  ###  Hierarchical Level  ###
  config.model 'HierarchicalLevel' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
    # show do
    #   field :id
    #   field :candidate
    #   field :schooling
    # end
  end

  ###  Professional area ###
  config.model 'ProfessionalArea' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
    # show do
    #   field :id
    #   field :candidate
    #   field :schooling
    # end
  end

  ###  Professional Experience  ###
  config.model 'ProfessionalExperience' do
    navigation_label 'Candidatos'
    list do
      field :id
      field :candidate
      field :name_company
      field :jobs_current
    end
    edit do
      field :name_company
      field :last_post
      field :start_date
      field :finish_date
      field :jobs_current
      field :attributions
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  Company  ###
  config.model 'Company' do
    navigation_label 'Empresas'
    list do
      field :id
      field :corporate_name
      field :cnpj
      field :city
      field :user
    end
    edit do
      field :user, :belongs_to_association do
        inline_add false
        inline_edit false
      end
      field :fancy_name
      field :corporate_name
      field :phone
      field :street
      field :number
      field :facebook
      field :email
      field :website
      field :type_company
      field :cnpj
      field :city
      field :branch_operation
      field :description, :wysihtml5 do
        config_options :html => false
      end
      field :logo, :carrierwave
    end
    # show do
    #   field :id
    #   field :user
    #   field :link
    #   field :image
    # end
  end

  ###  Branch Operation  ###
  config.model 'BranchOperation' do
    navigation_label 'Empresas'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  Type Company  ###
  config.model 'TypeCompany' do
    navigation_label 'Empresas'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  Citys  ###
  config.model 'City' do
    navigation_label 'Localidade'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
    end
    edit do
      field :name
      field :state
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  State  ###
  config.model 'State' do
    navigation_label 'Localidade'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
      field :iso
    end
    edit do
      field :name
      field :country
      field :iso
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  Country  ###
  config.model 'Country' do
    navigation_label 'Localidade'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
    # show do
    #   field :name
    #   field :email
    #   field :admin
    # end
  end

  ###  Jobs  ###
  config.model 'Job' do
    navigation_label 'Vagas'
    list do
      field :id
      field :job_title
      field :company
      field :jobs_category
    end
    edit do
      field :job_title
      field :company
      field :city
      field :salary_range
      field :type_contract
      field :job_category
      field :amount_vacancies
      field :time_contract
      field :description, :wysihtml5 do
        config_options :html => false
      end
      field :requirements, :wysihtml5 do
        config_options :html => false
      end
      field :period_of_work
      field :other_information, :wysihtml5 do
        config_options :html => false
      end
      field :start_date do
        date_format :default
      end
      field :finish_date do
        date_format :default
      end
      field :job_premiun
    end
  end

  ### Jobs Category ###
  config.model 'JobCategory' do
    navigation_label 'Vagas'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
  end

  ### Jobs Category ###
  config.model 'TypeContract' do
    navigation_label 'Vagas'
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
  end

  ###  User  ###
  config.model 'User' do
    navigation_label 'Usuários'
    #navigation_icon 'icon-user'
    list do
      field :id
      field :name
      field :email
      field :is_candidate
      field :updated_at
      field :admin
    end
    edit do
      field :name
      field :email
      field :is_candidate
      field :password
      field :password_confirmation
      field :admin
    end
    show do
      field :name
      field :email
      field :admin
    end
  end
end
