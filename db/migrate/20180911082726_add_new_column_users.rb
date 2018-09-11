class AddNewColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :crypted_password ,:string
    add_column :users , :password_salt, :string
  end
end
