class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|

      t.boolean :is_male, null: false
      t.date :bith_date, null: false
      
      t.integer :zip_code
      t.string :street
      t.integer :number
      t.string :complement
      t.string :home_fone
      t.string :mobile_phone
      t.text :courses_and_events

      t.references :city, index:true, null: false

      t.timestamps
    end
  end
end
