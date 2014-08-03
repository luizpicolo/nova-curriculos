class CreateCandidateHierarchicalLevel < ActiveRecord::Migration
  def change
    create_table :candidates_hierarchical_levels do |t|
    	t.references :candidate, :hierarchical_level, index:true, null: false
  		t.timestamps
    end
  end
end
