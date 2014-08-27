class AddLogAndLatToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :lg, :integer
    add_column :companies, :lt, :integer
  end
end
