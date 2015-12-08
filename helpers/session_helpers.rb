# helper functions will go here
def authorization_check
  if session[:current_user] == nil
    redirect '/not_authorized'
  else
    return true
  end
end
