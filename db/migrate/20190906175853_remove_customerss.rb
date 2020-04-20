# frozen_string_literal: true

class RemoveCustomerss < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :address_id, :integer
  end
end
