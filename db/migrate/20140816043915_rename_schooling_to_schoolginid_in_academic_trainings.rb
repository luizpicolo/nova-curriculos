class RenameSchoolingToSchoolginidInAcademicTrainings < ActiveRecord::Migration
  def change
    rename_column :academic_trainings, :schooling, :schooling_id
  end
end
