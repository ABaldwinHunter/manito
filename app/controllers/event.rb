require 'pry'
get '/events/new' do
  erb :'events/new'
end

post '/events' do
  user = User.find(session[:user_id])
  @event = Event.new(params[:event])
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

post '/events/search' do
  @event = Event.find_by(invite_key: params[:event][:invite_key])
  redirect("/events/#{@event.id}")
end

get '/events/:id/leave' do
  userevent = UserEvent.find_by(user_id: current_user.id, event_id: params[:id])
  userevent.destroy
  redirect("/users/#{current_user.id}/events")
end

get '/events/:id/join' do #how do we make sure s
  @event = Event.find(params[:id])
  @event.users << current_user
  redirect("/users/#{current_user.id}/events")
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

get '/events/:id/assign' do
  @event = Event.find(params[:id])
  participants = @event.users.map{|u|u.id}
  participants.each_with_index do |userid, index|
    userevent = UserEvent.find_by(user_id: userid, event_id: params[:id])
    userevent.giftee_id = participants[index-1]
    userevent.save
  end
  redirect("/events/#{@event.id}")
end



