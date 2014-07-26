require 'carrierwave/orm/activerecord'

class Candidate < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  #process_in_background :image
  
  validates :is_male, :inclusion => { :in => [true, false] }, presence: true
  validates :bith_date, :mobile_phone, presence: true
  validates :user, :presence => true

  delegate :name, to: :user, :allow_nil => true

  has_and_belongs_to_many :professional_areas
  has_and_belongs_to_many :hierarchical_levels
  has_many :professional_experiences, dependent: :destroy
  has_many :academic_trainings, dependent: :destroy

  belongs_to :city
  belongs_to :user
end