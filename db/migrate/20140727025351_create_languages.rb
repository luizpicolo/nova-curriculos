class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :speech
      t.integer :level
      t.references :candidate, index:true, null: false

      t.timestamps
    end
  end
end
