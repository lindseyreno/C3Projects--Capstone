class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update(activated: true)
      user.update(activated_at: Time.zone.now)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:errors] = ERRORS[:invalid_activation]
      redirect_to root_path
    end
  end
end
