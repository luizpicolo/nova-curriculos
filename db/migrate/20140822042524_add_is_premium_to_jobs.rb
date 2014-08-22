class AddIsPremiumToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :is_premium, :boolean, :default => false
  end
end
