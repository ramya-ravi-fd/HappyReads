# == Schema Information
#
# Table name: user_books
#
#  id           :bigint(8)        not null, primary key
#  book_id      :integer
#  user_id      :integer
#  notes        :string(255)
#  started_date :datetime
#  read_date    :datetime
#  rating       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class UserBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
