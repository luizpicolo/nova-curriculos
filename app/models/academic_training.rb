class AcademicTraining < ActiveRecord::Base
  validate :schooling, :name_of_course, :start_date, institution, presence: true
  belongs_to :candidate
end
