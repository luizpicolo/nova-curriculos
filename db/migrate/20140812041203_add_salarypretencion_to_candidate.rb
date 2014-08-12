class AddSalarypretencionToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :salary_pretension, :string
  end
end
