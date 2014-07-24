class CreateCandidateHierarchicalLevel < ActiveRecord::Migration
  def change
    create_table :candidates_hierarchical_levels do |t|
    	t.references :candidate, :hierarchical_level
  		t.timestamps
    end
  end
end
