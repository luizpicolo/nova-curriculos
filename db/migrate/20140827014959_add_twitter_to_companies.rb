class AddTwitterToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :twitter, :string
  end
end
