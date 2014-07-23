class ProfessionalArea < ActiveRecord::Base
	validate :name, presence: true
	has_many :candidates
end
