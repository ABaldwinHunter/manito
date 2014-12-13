get '/items' do
  # display a list of all items
  # @items = Item.all
  # erb :'items/index'
end

get '/items/new' do
  # return an HTML form for creating a new item
  # erb :'items/new'
end

post '/items' do
  user = User.find session[:user_id]
  wishlist = user.wishlists.first
  wishlist.items.create(params[:item])
  redirect '/wishlists'
end

get '/items/:id' do |id|
  # display a specific item
  # @item = Item.find id
  # erb :'items/single'
end

get '/items/:id/edit' do |id|
  # return an HTML form for editing a item
  # @item = Item.find id
  # erb :'items/edit'
end

put '/items/:id' do |id|
  # update a specific item
  # @item = Item.find id
  # @item.update(params[:item])
  redirect 'entries/#{@item.id}'
end

delete '/items/:id' do |id|
  # delete a specific item
  @item = Item.find id
  @item.destroy
  redirect '/wishlists'
end
