class RemoveiroiroFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :customer_id, :integer
    remove_column :carts, :product_id, :integer
    remove_column :carts, :quantity, :integer
  end
end
