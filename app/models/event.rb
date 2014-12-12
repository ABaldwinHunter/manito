class Event < ActiveRecord::Base
  # belongs_to :admin, class_name: "User", source: :user
  has_many :user_events
  has_many :users, through: :user_events
end
