class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  has_many :user_events#, foreign_key: :giver_id
  has_many :events, through: :user_events

  has_many :giftees, through: :user_events, class_name: "User", source: :giftee

  has_many :wishlists

  has_many :items, through: :wishlists

  def send_email_invites(email_addresses, message, key)
    email_addresses.each do |email_address|
      Pony.mail(:to => email_address,
                :from => self.email,
                :subject => 'Secret Santa Invite',
                :html_body => "/#{key}",
                :body => message)
    end
  end
end
