class AcademicTraining < ActiveRecord::Base
  validates :schooling, :name_of_course, :start_date, :institution, presence: true
  belongs_to :candidate
end
