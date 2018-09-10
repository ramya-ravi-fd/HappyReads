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

class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  after_create :add_user_activity;
  after_update :update_user_activity;


  private
  def add_user_activity
    activity = Activity.create(user_id:self.user_id,activity:"Created user book",book_id:self.book_id);
    activity.save;
  end

  def update_user_activity
    activity = Activity.create(user_id:self.user_id,activity:"Updated user book",book_id:self.book_id);
    activity.save;
  end
end
