get '/events' do
  # display a list of all events
  # @events = Event.all
  # erb :'events/index'
end

get '/events/new' do
  # return an HTML form for creating a new event
  # erb :'events/new'
end

post '/events' do
  # create a new event
  # @event = Event.create(params[:event])
  # redirect '/events'
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