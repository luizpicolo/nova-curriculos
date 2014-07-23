class HierarchicalLevel < ActiveRecord::Base
  validate :name, presence: true

  has_many :candidates
end
