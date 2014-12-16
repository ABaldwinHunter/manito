

post '/items', auth: :user do
  user = User.find session[:user_id]
  wishlist = user.wishlists.first
  wishlist.items.create(params[:item])
  redirect '/wishlists'
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
