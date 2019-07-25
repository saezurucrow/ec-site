class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :jacket_id
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.integer :stock
      t.integer :product_status

      t.timestamps
    end
  end
end
