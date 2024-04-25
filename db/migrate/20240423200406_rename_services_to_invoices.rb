class RenameServicesToInvoices < ActiveRecord::Migration[7.1]
  def change
    rename_table :services, :invoices
  end
end
