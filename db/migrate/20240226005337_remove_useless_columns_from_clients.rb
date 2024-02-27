class RemoveUselessColumnsFromClients < ActiveRecord::Migration[7.1]
  def change
    remove_column :clients, :Fecha_de_pago
    remove_column :clients, :Fecha_de_corte
  end
end
