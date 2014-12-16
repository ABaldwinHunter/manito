get '/wishlists', auth: :user do
  if !current_user.wishlists.empty?
    wishlist = current_user.wishlists.first
    @wishlist_items = wishlist.items
    erb :'wishlists/index'
  else
    erb :'wishlists/new'
  end
end

post '/wishlists', auth: :user do
  @user = current_user
  @user.wishlists.create
  redirect '/wishlists'
end

get '/wishlists/:id', auth: :user do |id| #see someone else's wishlist
  @user = User.find id
  if @user.wishlists.empty?
    erb :'wishlists/secret_santa_no_wishlist'
  else
    wishlist = @user.wishlists.first
    @wishlist_items = wishlist.items
    erb :'wishlists/secret_santa_list'
  end
end
