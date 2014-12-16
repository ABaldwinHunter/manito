def current_user
  @user ||= User.find_by_id session[:user_id]
end

def signed_in!
  redirect '/' unless user_signed_in?
end

def user_signed_in?
  !!session[:user_id]
end

def authorize_event! event_id
  @event = Event.find event_id
end

def authorize_owner!(object, &block)
  if user_signed_in? && current_user.id == object.admin_id
    block.call!
  end
end

# def auth(type)
#     condition do
#     redirect ('/') unless send("current_#{type}")
#   	end
#  end
