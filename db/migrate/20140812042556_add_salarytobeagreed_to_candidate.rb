class AddSalarytobeagreedToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :salary_to_be_agreed, :boolean, :default => false
  end
end
