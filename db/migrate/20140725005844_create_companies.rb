class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :fancy_name
      t.string :corporate_name
      t.string :phone
      t.string :street
      t.integer :number
      t.string :facebook
      t.string :website
      t.references :type_company, index:true, null: false
      t.string :cnpj
      t.references :city, index:true, null: false
      t.references :branch_operation, index: true, null: false
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
