# == Schema Information
#
# Table name: shelves
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  shelve_nam :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ShelveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end