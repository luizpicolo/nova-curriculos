require 'carrierwave/orm/activerecord'

class Company < ActiveRecord::Base

  mount_uploader :logo, LogoUploader

  #process_in_background :logo

  validates :fancy_name, :corporate_name, :phone,
			:type_company, :cnpj, :description, 
			:city, :user, :branch_operation, :type_company ,presence: true

  belongs_to :branch_operation
  belongs_to :type_company
  belongs_to :city
  belongs_to :user

  has_many :jobs
end
