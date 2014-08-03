class City < ActiveRecord::Base
	validates :name, presence: true
	has_many :jobs
	belongs_to :state
end
