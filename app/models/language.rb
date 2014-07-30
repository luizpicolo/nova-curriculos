class Language < ActiveRecord::Base
	validates :speech, :level, presence: true

	belongs_to :candidate
end
