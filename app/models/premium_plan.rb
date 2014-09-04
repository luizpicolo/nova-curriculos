class PremiumPlan < ActiveRecord::Base
  validates :price, :description, presence: true
end
