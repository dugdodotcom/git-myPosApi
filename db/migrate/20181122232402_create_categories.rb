class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
  end
end
