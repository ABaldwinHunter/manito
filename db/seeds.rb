require 'faker'

20.times {
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: "a",
              password_confirmation: "a",
              email: Faker::Internet.email)

}


User.all.each do |user|
  w = user.wishlists.create()
  10.times{w.items.create(name: Faker::Commerce.product_name, url: "www.fakelink.com/aehgioaghi")}
end

User.create(first_name: "Ashley", last_name: "Baldwin-Hunter", email: "ashley.baldwinhunter@gmail.com", password: "cat")


