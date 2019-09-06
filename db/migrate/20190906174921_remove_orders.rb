class RemoveOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :postal_code, :string
    remove_column :orders, :address, :string
    remove_column :customers, :postal_code, :string
    remove_column :customers, :tel, :string
    remove_column :customers, :address, :string
  end
end
