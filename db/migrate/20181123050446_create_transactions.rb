class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :information
      t.decimal :rate, precision: 19, scale: 2
      t.decimal :tax, precision: 19, scale: 2
      t.decimal :no_discount_price, precision: 19, scale: 2
      t.decimal :discount_price, precision: 19, scale: 2
      t.decimal :price, precision: 19, scale: 2
      t.decimal :pay, precision: 19, scale: 2
      t.decimal :return, precision: 19, scale: 2
      t.decimal :refund, precision: 19, scale: 2
      t.references :user, foreign_key: true
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
