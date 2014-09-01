class CreateCandidatesJobs < ActiveRecord::Migration
  def change
    create_table :candidates_jobs do |t|
      t.references :candidate, :jobs, index:true, null: false
      t.timestamps
    end
  end
end
