class CreateTransitems < ActiveRecord::Migration[5.2]
  def change
    create_table :transitems do |t|
      t.references :transaction, foreign_key: true
      t.references :item, foreign_key: true
      t.string :name
      t.integer :quantity
      t.decimal :actual_rate, precision: 19, scale: 2
      t.decimal :rate, precision: 19, scale: 2
      t.decimal :discount, precision: 2, scale: 2
      t.decimal :tax, precision: 19, scale: 2
      t.decimal :no_discount_price, precision: 19, scale: 2
      t.decimal :discount_price, precision: 19, scale: 2
      t.decimal :price, precision: 19, scale: 2
      t.decimal :price_with_tax, precision: 19, scale: 2
      t.string :per
      t.references :user, foreign_key: true
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
