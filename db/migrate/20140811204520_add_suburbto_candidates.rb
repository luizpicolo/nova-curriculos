class AddSuburbtoCandidates < ActiveRecord::Migration
  def change
  	add_column :candidates, :suburb, :string
  end
end
