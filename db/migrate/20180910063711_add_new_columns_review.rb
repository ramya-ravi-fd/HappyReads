class AddNewColumnsReview < ActiveRecord::Migration[5.2]
  def change
    add_column :comments , :book_id, :integer
  end
end
