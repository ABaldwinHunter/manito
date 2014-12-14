get '/wishlists' do
  @user = User.find session[:user_id]
  wishlist = @user.wishlists.first
  @wishlist_items = wishlist.items
  erb :'wishlists/index'
end

# get '/wishlists/new' do
#   @user = current_user
#   erb :'wishlists/index'
# end

post '/wishlists' do
  @user = current_user
  @user.wishlists.create
  redirect '/wishlists'
end

get '/wishlists/:id' do |id| #see someone else's wishlist
  @user = User.find id
  wishlist = @user.wishlists.first
  @wishlist_items = wishlist.items
  erb :'wishlists/index'
end
