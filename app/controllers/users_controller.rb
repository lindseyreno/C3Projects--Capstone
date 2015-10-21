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
      UserMailer.account_activation(@user).deliver_now
      redirect_to root_path
    else
      flash.now[:errors] = ERRORS[:unsuccessful_signup]
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
