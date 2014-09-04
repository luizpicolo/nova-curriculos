class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :company, index:true, null: false
      t.references :job, index:true, null: false
      t.string :price
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
