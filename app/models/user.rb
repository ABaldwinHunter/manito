class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  has_many :user_events#, foreign_key: :giver_id
  has_many :events, through: :user_events

  has_many :giftees, through: :user_events, class_name: "User", source: :giftee

  has_many :wishlists

  has_many :items, through: :wishlists

  def send_email_invites(email_addresses, sender, draw_date, admin, key)
    email_addresses.each do |email_address|
      Pony.mail(:to => email_address,
                :from => sender,
                :subject => 'Secret Santa Invite',
                :html_body => "Congratulations! You have been invited to participate in Manito's Secret Santa exchange, hosted by #{admin}! You may register or login at <a href='http://localhost:9393/'>Manito Secret Santa Exchange</a>, and find your event using the secret key: #{key}. Don't forget to sign up by #{draw_date} to participate!")
    end
  end
end
