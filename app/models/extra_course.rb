class ExtraCourse < ActiveRecord::Base
	validates :name, presence: true

	belongs_to :candidate
end
