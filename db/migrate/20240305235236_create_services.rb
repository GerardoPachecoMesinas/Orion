class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :disconnected_at
      t.integer :price
      t.datetime :paid_at
      t.text :notes
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
