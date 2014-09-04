class JobPremiun < ActiveRecord::Base
  validates :start_date, :finish_date, :job, presence: true
  belongs_to :job

  def validate_date
    if self.start_date <= Time.now.strftime("%Y-%m-%d").to_date && self.finish_date >= Time.now.strftime("%Y-%m-%d").to_date
      true
    else
      false
    end
  end
end
