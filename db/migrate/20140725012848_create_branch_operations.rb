class CreateBranchOperations < ActiveRecord::Migration
  def change
    create_table :branch_operations do |t|
      t.string :name

      t.timestamps
    end
  end
end
