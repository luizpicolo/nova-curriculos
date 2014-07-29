class CreateExtraCourses < ActiveRecord::Migration
  def change
    create_table :extra_courses do |t|
      t.string :name
      t.string :local
      t.text :description

      t.references :candidate, index:true, null: false

      t.timestamps
    end
  end
end
