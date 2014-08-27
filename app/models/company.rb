require 'carrierwave/orm/activerecord'

class Company < ActiveRecord::Base

  mount_uploader :logo, LogoUploader

  #process_in_background :logo

  validates :fancy_name, :corporate_name, :phone,
			      :type_company, :cnpj, :description, #:branch_operations,
			      :city, :user, :type_company, presence: true

  has_and_belongs_to_many :branch_operations
  belongs_to :type_company
  belongs_to :city
  belongs_to :user

  has_many :jobs

  def logo_marca
    if Rails.env == "production"
      self.logo.thumb_min.to_s.gsub! ENV['PATH_UPLOADS'], ''
    else
      self.logo.thumb_min.to_s
    end
  end

end
