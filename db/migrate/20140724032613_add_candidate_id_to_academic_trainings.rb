class AddCandidateIdToAcademicTrainings < ActiveRecord::Migration
  def change
    add_column :academic_trainings, :candidate_id, :integer, index:true, null: false
  end
end
