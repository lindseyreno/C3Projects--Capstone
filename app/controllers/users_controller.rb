class UsersController < ApplicationController
  def new
    if session[:user_id].nil?
      @user = User.new
      render :new
    else
      flash[:errors] = ERRORS[:account_exists]
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      flash.now[:errors] = ERRORS[:unsuccessful_signup]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
