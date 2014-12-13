# get '/users' do
#   # display a list of all users
#   # @users = User.all
#   # erb :'users/index'
# end

get '/users/new' do
  # return an HTML form for creating a new user
  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  redirect "/users/#{@user.id}"
end

get '/users/:id' do |id|
  @user = User.find id
  @events = @user.events
  erb :'users/exchanges'
end

get '/users/:id/edit' do |id|
  # return an HTML form for editing a user
  # @user = User.find id
  # erb :'users/edit'
end

put '/users/:id' do |id|
  # update a specific user
  # @user = User.find id
  # @user.update(params[:user])
  redirect 'entries/#{@user.id}'
end

delete '/users/:id' do |id|
  # delete a specific user
  # @user = User.find id
  # @user.destroy
  # redirect '/users'
end
