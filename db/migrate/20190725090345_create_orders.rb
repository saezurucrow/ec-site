class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :postal_code
      t.string :address
      t.integer :price_sum
      t.string :payment
      t.string :order_status
      t.string :integer

      t.timestamps
    end
  end
end
