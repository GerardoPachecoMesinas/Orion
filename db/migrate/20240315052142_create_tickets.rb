class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :status
      t.integer :priority_level
      t.text :description
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
