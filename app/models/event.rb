require 'pry'
class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :admin, class_name: "User"

  before_create :generate_key

  def generate_key
    # binding.pry
    self.invite_key = random
  end

  def random
    rand(1..1000) #bitly makes key
  end
end
