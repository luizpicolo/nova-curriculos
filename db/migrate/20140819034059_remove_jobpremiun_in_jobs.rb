class RemoveJobpremiunInJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :job_premiun
  end
end
