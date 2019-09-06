class RenameAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :user_id, :customer_id
    add_column :orders, :address_id, :integer
  end
end
