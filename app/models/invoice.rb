class Invoice < ActiveRecord::Base
  validates :company, :job, presence: true

  belongs_to :company
  belongs_to :job
end
