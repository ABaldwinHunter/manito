get '/events/new' do
  erb :'events/new'
end

post '/events' do
  user = User.find(session[:user_id])
  @event = user.events.create(params[:event])
  emails_list = parse_emails( params[:event][:emails] )
  message = params[:event][:message]
  key = @event.invite_key
  user.send_email_invites(emails_list, message, key)
  redirect "/users/#{current_user.id}/events"
end
