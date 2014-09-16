require 'carrierwave/orm/activerecord'

class Company < ActiveRecord::Base
  extend FriendlyId

  friendly_id :fancy_name, use: :slugged

  mount_uploader :logo, LogoUploader

  process_in_background :logo

  validates :fancy_name, :corporate_name, :phone,
			      :type_company, :cnpj, :description, #:branch_operations,
			      :city, :user, :type_company, presence: true

  has_and_belongs_to_many :branch_operations
  belongs_to :type_company
  belongs_to :city
  belongs_to :user

  has_many :jobs, dependent: :destroy
  has_many :invoices

  def logo_marca(type)
    if Rails.env == "production"
      return self.logo.thumb_min.to_s.gsub! ENV['PATH_UPLOADS'], '' if type == "thumb_min"
      return self.logo.thumb.to_s.gsub! ENV['PATH_UPLOADS'], '' if type == "thumb"
    else
      return self.logo.thumb_min.to_s if type == "thumb_min"
      return self.logo.thumb.to_s if type == "thumb"
    end
  end

end
