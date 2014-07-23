class AddCandiateAndHierarchicalLevel < ActiveRecord::Migration
  def change
  	t.references :candidate, :hierarchical_level
  	t.timestamps
  end
end
