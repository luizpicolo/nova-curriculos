class Job < ActiveRecord::Base
  extend FriendlyId

  friendly_id :job_title, use: :slugged

  validates :job_title,
      			:company,
      			:type_contract,
      			:amount_vacancies,
      			:description,
      			:requirements,
      			:start_date,
            :term,
            :city,
      			:finish_date, presence: true

  belongs_to :type_contract
  belongs_to :company
  belongs_to :city

  has_one :invoice, dependent: :destroy
  has_one :job_premiun, dependent: :destroy

  has_and_belongs_to_many :candidates, dependent: :destroy, :uniq => true

  # GAMBIARRA QUE DEVE SER RESOLVIDA :(
  belongs_to :jobs_category
  belongs_to :job_category

  # Search Solr
  searchable do
    text :job_title, :boost => 5.0
    text :description
    time :start_date
    time :finish_date
    boolean :status
    integer :id
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
    text :slug
    text :state do
      city.state.name
    end
  end

  def candidate_to_job?(cand)
    self.candidates.where("candidate_id = ?", cand.candidate).first
  end
end
