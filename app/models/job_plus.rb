class JobPlus < ActiveRecord::Base
  validates :job, :start_date, :finish_date, presence: true

  belongs_to :job
end
