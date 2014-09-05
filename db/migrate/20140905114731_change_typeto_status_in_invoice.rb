class ChangeTypetoStatusInInvoice < ActiveRecord::Migration
  def change
    change_column :invoices, :status, :string
  end
end
