# == Schema Information
#
# Table name: sessions
#
#  id         :bigint(8)        not null, primary key
#  session_id :string(255)      not null
#  data       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
