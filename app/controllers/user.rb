
get '/users/signup' do
  erb :'users/signup'
end

post '/users' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}/events"
end

get '/users/:id/events' do |id|
  @user = User.find id
  @events = @user.events
  erb :'users/events'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}/events"
  else
    session[:error] = "invalid login information"
    redirect '/'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end
