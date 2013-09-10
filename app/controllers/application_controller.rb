class ApplicationController < ActionController::Base
  protect_from_forgery 
  helper_method :current_user, :logged_in?
  
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
  
end
