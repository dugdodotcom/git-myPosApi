class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :rate, precision: 19, scale: 2
      t.decimal :quantity, precision: 19, scale: 2
      t.string :per
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
