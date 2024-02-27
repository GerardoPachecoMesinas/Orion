class ChangeClientsColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :clients, :Nombre, :name
    rename_column :clients, :Activo, :active
    rename_column :clients, :Teléfono, :phone
    rename_column :clients, :Localidad, :location
  end
end
