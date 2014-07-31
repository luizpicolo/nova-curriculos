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
			:finish_date, presence: true

  belongs_to :type_contract
  belongs_to :company

  # GAMBIARRA QUE DEVE SER RESOLVIDA
  belongs_to :jobs_category
  belongs_to :job_category
  belongs_to :category, class_name: "JobCategory", foreign_key: "id"
end
