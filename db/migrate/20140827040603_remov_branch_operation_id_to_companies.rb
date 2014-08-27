class RemovBranchOperationIdToCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :branch_operation_id
  end
end
