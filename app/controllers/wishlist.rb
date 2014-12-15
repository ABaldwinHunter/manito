get '/wishlists' do
  if !current_user.wishlists.empty?
    wishlist = current_user.wishlists.first
    @wishlist_items = wishlist.items
    erb :'wishlists/index'
  else
    erb :'wishlists/new'
  end

end

post '/wishlists' do
  @user = current_user
  @user.wishlists.create
  redirect '/wishlists'
end

get '/wishlists/:id' do |id| #see someone else's wishlist
  @user = User.find id
  wishlist = @user.wishlists.first
  @wishlist_items = wishlist.items
  erb :'wishlists/secret_santa_list'
end
