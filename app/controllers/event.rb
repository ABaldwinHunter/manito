get '/events' do
  # display a list of all events
  # @events = Event.all
  # erb :'events/index'
end

get '/events/new' do
  erb :'events/new'
end

post '/events' do
  @event = Event.create(params[:event])
  emails_list = parse_emails( params[:event][:emails] )
  user = User.find session[:user_id]
  user.send_email_invites(emails_list, params[:event][:message])
  redirect '/events'
end

get '/events/:id' do |id|
  # display a specific event
  # @event = Event.find id
  # erb :'events/single'
end

get '/events/:id/edit' do |id|
  # return an HTML form for editing a event
  # @event = Event.find id
  # erb :'events/edit'
end

put '/events/:id' do |id|
  # update a specific event
  # @event = Event.find id
  # @event.update(params[:event])
  redirect 'entries/#{@event.id}'
end

delete '/events/:id' do |id|
  # delete a specific event
  # @event = Event.find id
  # @event.destroy
  # redirect '/events'
end
