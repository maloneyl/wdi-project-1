class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue # what if current_user is still logged in when removing themself?
      @current_user = nil
    end
  end

  def logged_in?
    !!current_user
  end

end
