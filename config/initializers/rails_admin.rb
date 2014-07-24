RailsAdmin.config do |config|

  ################  Global configuration  ################
  config.main_app_name = ['Nova Currículos', 'Admin']
  config.default_items_per_page = 20
  
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

  ###  Candidate  ###
  config.model 'Candidate' do
    list do
      field :id
      field :user
      field :mobile_phone
    end
    edit do
      configure :user, :belongs_to_association do
        inline_add false
        inline_edit false
      end
      configure :bith_date
      configure :zip_code
      configure :street
      configure :number
      configure :complement
      configure :home_fone
      configure :mobile_phone
      configure :courses_and_events
      configure :city
      configure :is_male
      configure :image, :carrierwave
      configure :professional_areas
      configure :hierarchical_levels
      configure :professional_experiences
      configure :academic_trainings
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

  ###  User  ###
  config.model 'User' do
    list do
      field :id
      field :name
      field :email
      field :updated_at
      field :admin
    end
    edit do
      field :name
      field :email
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
