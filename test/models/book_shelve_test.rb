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

require 'test_helper'

class BookShelveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
