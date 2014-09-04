class ChangeTypeToPeriodOfWorkinJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :period_of_work, :text
  end
end
