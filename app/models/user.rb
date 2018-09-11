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

class User < ApplicationRecord

  attr_accessor   :remember_token
  attr_readonly :password, :password_confirmation

  has_many :user_books,dependent: :destroy
  has_many :books ,through: :user_books,dependent: :destroy

  has_many :shelves, class_name: 'Shelve'
  has_many :book_shelves ,through: :shelves ,source: :user ,dependent: :destroy

  has_many :activities,dependent: :destroy
  has_many :reviews,source: :book,dependent: :destroy
  has_many :comments ,dependent: :destroy

  acts_as_authentic do |c|
    c.validate_password_field = false
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  after_create :add_user_activity
  after_update :update_user_activity

   def self.find_user_oauth(oauth)
     puts oauth['info']['email']
     @user = find_or_create_by(email:oauth['info']['email'])
     @user.name = oauth['info']['name']
     @user.email = oauth['info']['email']
     @user.save
     return @user
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

   def validate_password_field?(pass,cry_pass)
     puts 'hello in 2'
     return true
   end


end
