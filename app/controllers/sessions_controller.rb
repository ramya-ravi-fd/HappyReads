class SessionsController < ApplicationController

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end

  def create
    @user = User.find_user_oauth(request.env["omniauth.auth"])
    session[:user_id]  = @user.id
    redirect_to @user
  end

end
