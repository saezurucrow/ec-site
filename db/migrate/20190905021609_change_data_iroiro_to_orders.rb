class ChangeDataIroiroToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :order_status, :integer
    change_column :orders, :payment, :integer
    change_column :orders, :postal_code, :string
  end
end
