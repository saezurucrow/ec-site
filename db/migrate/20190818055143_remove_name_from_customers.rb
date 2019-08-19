class RemoveNameFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :name, :string
  end
end
