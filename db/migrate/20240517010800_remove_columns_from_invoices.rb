class RemoveColumnsFromInvoices < ActiveRecord::Migration[7.1]
  def change
    remove_column :invoices, :name, :string
    remove_column :invoices, :price, :integer
    remove_column :invoices, :paid_at, :datetime
  end
end
