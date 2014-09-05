class AddPaymentMethodToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :payment_method, :string
  end
end
