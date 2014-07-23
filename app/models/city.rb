class City < ActiveRecord::Base
	validate :name, presence: true

	has_many :candidates, dependent: :destroy
end
