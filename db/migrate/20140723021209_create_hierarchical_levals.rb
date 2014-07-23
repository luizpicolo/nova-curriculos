class CreateHierarchicalLevals < ActiveRecord::Migration
  def change
    create_table :hierarchical_levals do |t|
      t.string :name

      t.timestamps
    end
  end
end
