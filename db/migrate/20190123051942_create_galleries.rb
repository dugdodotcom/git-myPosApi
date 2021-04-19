class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.attachment :image
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
