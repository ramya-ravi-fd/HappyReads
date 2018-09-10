# == Schema Information
#
# Table name: books
#
#  id              :bigint(8)        not null, primary key
#  title           :string(255)
#  author_id       :integer
#  synopsis        :string(255)
#  description     :string(255)
#  number_of_pages :integer
#  published_date  :datetime
#  isbn            :string(255)
#  genre_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image_url       :string(255)
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
