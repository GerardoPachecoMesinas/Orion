class AddColumnsToInvoices < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :service_package_name, :string
    add_column :invoices, :service_package_cost, :integer
    add_column :invoices, :additional_concept, :string
    add_column :invoices, :aditional_amount, :integer, null: :false, default: 0
    add_column :invoices, :total_bill, :integer
    add_column :invoices, :payment_status, :string
  end
end
