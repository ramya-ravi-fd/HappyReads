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

class Book < ApplicationRecord

  belongs_to :author
  belongs_to :genre

  has_many :book_shelves,class_name: 'BookShelve',dependent: :destroy
  has_many :shelves ,through: :book_shelves ,source: :user,class_name: 'Shelve',dependent: :destroy

  has_many :user_books,dependent: :destroy
  has_many :users ,through: :user_books,dependent: :destroy

  has_many :activities,dependent: :destroy

  has_many :user_shelves ,through: :book_shelves , source: :user,dependent: :destroy

  has_many :reviews,source: :user,dependent: :destroy
  def self.search(title)
    if title
      where('title Like?',"%#{title}%").order("id DESC")
    else
      all.order("id DESC")
    end
  end





end
