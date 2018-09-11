class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @user_session = UserSession.new
  end

  def destroy
     current_user_session.destroy
     redirect_to root_path
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      UserMailer.login_email(current_user_session.user).deliver_later(wait: 1.minute)
      redirect_to '/home'
    else
      puts 'error'
      puts @user_session.errors.full_messages
    end
  end

  private
  def user_session_params
    params.fetch(:user_session,{}).permit(:email,:password)
  end

end
