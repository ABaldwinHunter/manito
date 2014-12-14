

post '/items' do
  user = User.find session[:user_id]
  wishlist = user.wishlists.first
  wishlist.items.create(params[:item])
  redirect '/wishlists'
end


get '/items/:id/edit' do |id|
  # return an HTML form for editing a item
  # @item = Item.find id
  # erb :'items/edit'
end

put '/items/:id' do |id|
  redirect 'entries/#{@item.id}'
end

delete '/items/:id' do |id|
  # delete a specific item
  @item = Item.find id
  @item.destroy
  redirect '/wishlists'
end
