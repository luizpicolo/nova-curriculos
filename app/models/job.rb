class Job < ActiveRecord::Base
  validates :job_title,
			:company,
      		:salary_range,
			:type_contract,
			:amount_vacancies,
			:time_contract,
			:description,
			:requirements,
			:period_of_work,
			:other_information, 
			:start_date, 
			:finish_date, presence: true

  belongs_to :type_contract
  belongs_to :company
  belongs_to :job_category
end
