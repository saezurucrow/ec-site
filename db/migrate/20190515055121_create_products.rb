class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :artist
      t.string :jacket_id
      t.string :label
      t.string :genre
      t.string :music
      t.integer :stock

      t.timestamps
    end
  end
end
