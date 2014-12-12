class UserEvent < ActiveRecord::Base
  belongs_to :user#giver, class_name: "User"
  belongs_to :giftee, class_name: "User"
  belongs_to :event
end
