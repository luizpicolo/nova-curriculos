class Schooling < ActiveRecord::Base
  validates :name, presence: true
  has_many :academic_trainings
end
