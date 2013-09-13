class ApplicationController < ActionController::Base
  protect_from_forgery 
  helper_method :current_user, :logged_in?, :authorized?
  
  def current_user
    if session["user_id"]
	  @current_user ||= User.find(session["user_id"])
	else
	  @current_user = nil
	end
  end
  
  def logged_in?
    if session["user_id"]
	  return true
	else
	  return false
	end
  end
  
  def authorized?
    if session["user_id"] && current_user
	  #Assumed that the first 2 users are me...Hack.
	  #I'm learning.
	  if current_user.uid.to_i < 3
	    return true
	  else
	    return false
	  end
	else
	  return false
	end
  end
end
