class Event < ActiveRecord::Base
  # belongs_to :admin, class_name: "User", source: :user
  has_many :user_events
  has_many :users, through: :user_events

  before_save :generate_key

  def generate_key
    self.invite_key = random
  end

  def random
    rand(1..1000) #bitly makes key
  end
end
