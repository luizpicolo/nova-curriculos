class CreateProfessionalAreas < ActiveRecord::Migration
  def change
    create_table :professional_areas do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
