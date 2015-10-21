class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:errors] = ERRORS[:unactivated_account]
        redirect_to root_path
      end
    else
      flash[:errors] = ERRORS[:sign_in_error]
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:messages] = MESSAGES[:successful_sign_out]
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(username: params[:session][:username])
  end
end
