get '/events/new' do
  erb :'events/new'
end

post '/events' do
  user = User.find(session[:user_id])
  @event = Event.new(params[:event])
  p params
  @event.admin_id = current_user.id
  @event.save
  user.events << @event
  user.save
  emails_list = parse_emails( params[:event][:emails] )
  message = params[:event][:message]
  key = @event.invite_key
  current_user.send_email_invites(emails_list, message, key)
  redirect "/users/#{current_user.id}/events"

end


get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'events/single'
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :'events/edit'
end

put '/events/:id' do
  @event = Event.find(params[:id])
  @event.update(params[:event])
  redirect("/events/#{@event.id}")
end
