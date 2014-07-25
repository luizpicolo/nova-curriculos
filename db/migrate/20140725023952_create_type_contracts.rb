class CreateTypeContracts < ActiveRecord::Migration
  def change
    create_table :type_contracts do |t|
      t.string :name

      t.timestamps
    end
  end
end
