# == Schema Information
#
# Table name: authors
#
#  id          :bigint(8)        not null, primary key
#  author_name :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
