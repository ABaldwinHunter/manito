get '/wishlists' do
  @user = User.find session[:user_id]
  wishlist = @user.wishlists.first
  @wishlist_items = wishlist.items
  erb :'wishlists/index'
end


get '/wishlists/:id' do |id|
  @user = User.find id
  wishlist = @user.wishlists.first
  @wishlist_items = wishlist.items
  erb :'wishlists/index'
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
