class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.date :paid_at
      t.integer :amount
      t.string :method
      t.text :notes
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
