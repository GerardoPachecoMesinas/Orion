class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :Nombre
      t.date :Fecha_de_pago
      t.date :Fecha_de_corte
      t.boolean :Activo
      t.string :Teléfono
      t.string :Localidad

      t.timestamps
    end
  end
end
