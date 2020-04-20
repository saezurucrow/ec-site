# frozen_string_literal: true

class CreateOrderShows < ActiveRecord::Migration[5.2]
  def change
    create_table :order_shows do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
