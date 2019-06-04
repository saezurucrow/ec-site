class RenamePostIdColumnToMusics < ActiveRecord::Migration[5.2]
  def change

  	rename_column :musics, :post_id, :product_id
  end
end
