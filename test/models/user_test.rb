# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  name              :string(255)
#  email             :string(255)
#  password_digest   :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  about_me          :string(255)
#  persistence_token :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
