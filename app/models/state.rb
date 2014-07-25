class State < ActiveRecord::Base
  validates :name, presence: true
  has_many :citys
  belongs_to :country
end
