class TypeContract < ActiveRecord::Base
  validates :name, presence: true
  has_many :jobs
end
