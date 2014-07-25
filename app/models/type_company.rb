class TypeCompany < ActiveRecord::Base
  validates :name, presence: true
  has_many :company
end
