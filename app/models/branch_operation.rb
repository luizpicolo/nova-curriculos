class BranchOperation < ActiveRecord::Base
  validates :name, presence: true
  has_many :companies
end
