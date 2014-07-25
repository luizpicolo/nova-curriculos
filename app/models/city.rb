class City < ActiveRecord::Base
	validates :name, presence: true

	belongs_to :state
end
