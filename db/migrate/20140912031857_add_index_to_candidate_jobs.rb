class AddIndexToCandidateJobs < ActiveRecord::Migration
  def change
    add_index(:candidates_jobs, [:candidate_id, :job_id], :unique => true)
  end
end
