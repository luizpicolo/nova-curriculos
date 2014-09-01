class RenameJobsIdToJobIdAndCandidatesJobs < ActiveRecord::Migration
  def change
    rename_column :candidates_jobs, :jobs_id, :job_id
  end
end
