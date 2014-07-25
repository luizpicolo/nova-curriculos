class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.references :country, index:true, null: false

      t.timestamps
    end
  end
end
