class ExtraCourse < ActiveRecord::Base
	validates :name, :local, :description, presence: true

	belongs_to :candidate
end
