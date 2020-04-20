# frozen_string_literal: true

class AddNamesToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name, :string
  end
end
