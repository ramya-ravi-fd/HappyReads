# == Schema Information
#
# Table name: activities
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  book_id    :integer
#  activity   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
