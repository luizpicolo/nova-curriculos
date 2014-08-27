class BranchOperationsCompanies < ActiveRecord::Migration
  def change
    create_table :branch_operations_companies do |t|
      t.references :branch_operation, :company, index:true, null: false
      t.timestamps
    end
  end
end
