get '/wishlists' do
  # display a list of all wishlists
  # @wishlists = Wishlist.all
  # erb :'wishlists/index'
end

get '/wishlists/new' do
  # return an HTML form for creating a new wishlist
  # erb :'wishlists/new'
end

post '/wishlists' do
  # create a new wishlist
  # @wishlist = Wishlist.create(params[:wishlist])
  # redirect '/wishlists'
end

get '/wishlists/:id' do |id|
  # display a specific wishlist
  # @wishlist = Wishlist.find id
  # erb :'wishlists/single'
end

get '/wishlists/:id/edit' do |id|
  # return an HTML form for editing a wishlist
  # @wishlist = Wishlist.find id
  # erb :'wishlists/edit'
end

put '/wishlists/:id' do |id|
  # update a specific wishlist
  # @wishlist = Wishlist.find id
  # @wishlist.update(params[:wishlist])
  redirect 'entries/#{@wishlist.id}'
end

delete '/wishlists/:id' do |id|
  # delete a specific wishlist
  # @wishlist = Wishlist.find id
  # @wishlist.destroy
  # redirect '/wishlists'
end
