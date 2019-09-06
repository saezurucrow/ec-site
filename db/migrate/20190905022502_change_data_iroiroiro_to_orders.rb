class ChangeDataIroiroiroToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :integer, :string
    add_column :orders, :customer_id, :integer
  end
end
