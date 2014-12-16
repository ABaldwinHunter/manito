require 'faker'

hailey = User.create(first_name: 'Hailey',
              last_name: 'Ryu',
              password: "a",
              password_confirmation: "a",
              email: 'hangyeolryu@gmail.com')
event1 = Event.create(title: "DBC Christmas Party",
              location: "DBC NY",
              draw_date: "12/15/14",
              exchange_date: "12/19/14",
              description: "FUN FUN FUN",
              max_price: 20,
              admin_id: 1,
  )
hailey.events << event1
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


