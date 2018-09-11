class AddNewColumnUsersPersistentToken < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :persistence_token, :string
    add_index :users,:persistence_token, unique: true
  end
end
