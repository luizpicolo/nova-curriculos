class JobPremiun < ActiveRecord::Base
  validates :start_date, :finish_date, :job_id, presence: true
  belongs_to :job

  def validate_date
    if self.start_date <= Time.now && self.finish_date >= Time.now
      true
    else
      false
    end
  end
end
