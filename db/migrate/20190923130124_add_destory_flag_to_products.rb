class AddDestoryFlagToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :destory_flag, :boolean
  end
end
