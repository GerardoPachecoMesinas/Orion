class AddServicePackageRefToInvoices < ActiveRecord::Migration[7.1]
  def change
    default_service_package_id = ServicePackage.create(name: 'Sin Definir').id
    add_reference :invoices, :service_package, foreign_key: true, null: false, default: default_service_package_id

    # set default back to nil
    change_column_default :invoices, :service_package_id, nil
  end
end
