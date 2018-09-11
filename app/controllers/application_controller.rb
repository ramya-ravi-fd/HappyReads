class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 helper_method :current_user,:current_user_session

 def authenticate
   redirect_to :signin unless user_signed_in?
 end

 def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
 end

 def user_signed_in?
   !!current_user
 end

 def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end

end
