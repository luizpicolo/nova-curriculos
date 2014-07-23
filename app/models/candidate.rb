class Candidate < ActiveRecord::Base
  
  validates :is_male, :inclusion => { :in => [true, false] }, presence: true
  validates :bith_date, :mobile_phone, presence: true

  has_one :user

  has_many :professional_areas
  has_many :hierarchical_levels
  has_many :professional_experiences, dependent: :destroy
  has_many :academic_trainings

  belongs_to :city
end
