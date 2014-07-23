class ProfessionalExperience < ActiveRecord::Base
	validate :name_company, :las_post, :date_entrance, presence: true
	belongs_to :candidate
end
