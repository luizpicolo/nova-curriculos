class AddLastsalaryToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :last_salary, :string
  end
end
