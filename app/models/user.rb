# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  about_me        :string(255)
#

class User < ApplicationRecord
  attr_accessor  :password, :password_confirmation ,:remember_token
  has_many :user_books,dependent: :destroy
  has_many :books ,through: :user_books,dependent: :destroy

  has_many :shelves, class_name: 'Shelve'
  has_many :book_shelves ,through: :shelves ,source: :user ,dependent: :destroy

  has_many :activities,dependent: :destroy
  has_many :reviews,source: :book,dependent: :destroy
  has_many :comments ,dependent: :destroy
  has_secure_password validations: false
  before_save :create_secure_token

  after_create :add_user_activity
  after_update :update_user_activity

   def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     BCrypt::Password.new(self.password_digest) == password
   end

   def self.find_user_oauth(oauth)
     puts oauth['info']['email']
     @user = find_or_create_by(email:oauth['info']['email'])
     @user.name = oauth['info']['name']
     @user.email = oauth['info']['email']

     @user.save
     puts @user
     return @user
   end

   private
   def create_secure_token
     self.remember_token = SecureRandom.urlsafe_base64
   end
   private
   def add_user_activity
     activity = Activity.create(user_id:self.id,activity:"Created user",book_id:nil);
     activity.save;
   end

   def update_user_activity
     activity = Activity.create(user_id:self.id,activity:"Updated user",book_id:nil);
     activity.save;
   end

end
