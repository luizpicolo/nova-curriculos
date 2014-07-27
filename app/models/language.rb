class Language < ActiveRecord::Base
	validates :speech, presence: true

	belongs_to :candidate
end
