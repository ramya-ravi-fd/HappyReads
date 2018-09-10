# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  review_id  :integer
#  user_id    :integer
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
