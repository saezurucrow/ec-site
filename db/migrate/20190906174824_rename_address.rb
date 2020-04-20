# frozen_string_literal: true

class RenameAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :name, :string
  end
end
