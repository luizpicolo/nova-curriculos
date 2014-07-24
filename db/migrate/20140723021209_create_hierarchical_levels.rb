class CreateHierarchicalLevels < ActiveRecord::Migration
  def change
    create_table :hierarchical_levels do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
