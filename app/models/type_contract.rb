class TypeContract < ActiveRecord::Base
  validates :name, presence: true
end
