class CreateServicePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :service_packages do |t|
      t.string :name
      t.integer :price
      t.string :bandwidth
      t.string :clasification

      t.timestamps
    end
  end
end
