class AddSalaryNegotiableToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :salary_negotiable, :boolean
  end
end
