class UsersController < ApplicationController

  before_action :authenticate
  skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.create(user_params)
    if(@user.save)
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.fetch(:user,{}).permit(:name,:email,:password,:password_confirmation)
  end
end
