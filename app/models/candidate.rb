require 'carrierwave/orm/activerecord'

class Candidate < ActiveRecord::Base
  extend FriendlyId

  friendly_id :full_name, use: :slugged

  mount_uploader :image, ImageUploader

  process_in_background :image

  validates :full_name, :presence => true
  validates :is_male, :inclusion => { :in => [true, false] }
  validates :birth_date, :mobile_phone, :presence => true
  validates :user, :presence => true
  validates :message_phone, :presence => true

  delegate :name, to: :user, :allow_nil => true

  has_and_belongs_to_many :professional_areas, dependent: :destroy
  has_and_belongs_to_many :hierarchical_levels, dependent: :destroy
  has_and_belongs_to_many :jobs, dependent: :destroy, :uniq => true
  has_many :professional_experiences, dependent: :destroy
  has_many :academic_trainings, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :extra_courses, dependent: :destroy

  belongs_to :city
  belongs_to :user

  def avatar(type)
    if Rails.env == "production"
      return self.image.thumb_min.to_s.gsub! ENV['PATH_UPLOADS'], '' if type == "thumb_min"
      return self.image.thumb.to_s.gsub! ENV['PATH_UPLOADS'], '' if type == "thumb"
    else
      return self.image.thumb_min.to_s if type == "thumb_min"
      return self.image.thumb.to_s if type == "thumb"
    end
  end
end
