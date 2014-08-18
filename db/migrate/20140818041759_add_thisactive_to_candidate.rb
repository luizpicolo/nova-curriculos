class AddThisactiveToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :this_active, :boolean, null: false, :default => false
  end
end
