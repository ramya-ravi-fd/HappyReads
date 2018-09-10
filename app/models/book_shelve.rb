# == Schema Information
#
# Table name: book_shelves
#
#  id         :bigint(8)        not null, primary key
#  shelve_id  :integer
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookShelve < ApplicationRecord
  belongs_to :shelve
  belongs_to :user
  belongs_to :book
end
