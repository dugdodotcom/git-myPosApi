class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.decimal :tax, precision: 4, scale: 2
      t.string :currency, limit: 3
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
