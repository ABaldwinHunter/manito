class User < ActiveRecord::Base
  has_secure_password

  has_many :user_events#, foreign_key: :giver_id
  has_many :events, through: :user_events

  has_many :giftees, through: :user_events, class_name: "User", source: :giftee

  has_many :wishlists

  has_many :items, through: :wishlists

end
