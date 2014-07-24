class AddCandidateIdToProfessionalExperiences < ActiveRecord::Migration
  def change
    add_column :professional_experiences, :candidate_id, :integer
  end
end
