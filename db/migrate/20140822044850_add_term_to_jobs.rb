class AddTermToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :term, :boolean, null: false, default: false
  end
end
