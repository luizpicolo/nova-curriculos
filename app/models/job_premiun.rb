class JobPremiun < ActiveRecord::Base
  validates :start_date, :finish_date, :jobs, presence: true
end
