class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
