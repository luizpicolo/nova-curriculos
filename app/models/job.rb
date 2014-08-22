class Job < ActiveRecord::Base
  extend FriendlyId

  friendly_id :job_title, use: :slugged

  validates :job_title,
      			:company,
            :salary_range,
      			:type_contract,
      			:amount_vacancies,
      			:time_contract,
      			:description,
      			:requirements,
      			:period_of_work,
      			:start_date,
            :term,
      			:finish_date, presence: true

  belongs_to :type_contract
  belongs_to :company
  belongs_to :city
  has_one :job_premiun

  # GAMBIARRA QUE DEVE SER RESOLVIDA :(
  belongs_to :jobs_category
  belongs_to :job_category

  # Search Solr
  searchable do
    text :job_title, :boost => 5.0
    text :description
    time :created_at
    text :category do
      job_category.name
    end
    text :company_corporate_name do
      company.corporate_name
    end
    text :company_fancy_name do
      company.fancy_name
    end
    text :city do
      city.name
    end
    text :state do
      city.state.name
    end
  end
end
