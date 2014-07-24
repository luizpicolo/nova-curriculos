class ProfessionalExperience < ActiveRecord::Base
	validates :name_company, :last_post, :start_date, presence: true
	belongs_to :candidate
end
