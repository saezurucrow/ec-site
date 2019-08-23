class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name,limit: 191
      t.string :mail,null: false,limit: 191
      t.string :password_digest,null: false,limit: 191
      t.string :remember_token,limit: 191

      t.timestamps
    end
  end
end
