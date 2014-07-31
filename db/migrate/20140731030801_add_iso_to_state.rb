class AddIsoToState < ActiveRecord::Migration
  def change
    add_column :states, :iso, :string, :limit => 5
  end
end
