class CreateHierarchicalLevels < ActiveRecord::Migration
  def change
    create_table :hierarchical_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
