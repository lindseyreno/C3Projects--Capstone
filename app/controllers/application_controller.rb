class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :signed_in

  MESSAGES = {
    successful_signout: "You have signed out."
  }

  ERRORS = {
    sign_in_error: "There was a problem signing in. Please try again.",
    sign_in_required: "You must be signed in to view this page.",
    account_exists: "You already have an account.", # maybe change this to ask if this is the user signed in? if not, allow them to sign out
    unsuccessful_sign_up: "There was a problem with your sign up info. Please try again.",
    unsuccessful_save: "Could not save. Please check the information and try again."
  }

  def require_sign_in
    unless session[:user_id]
      redirect_to root_path, flash: { errors: ERRORS[:sign_in_required] }
    end
  end

  def signed_in
    @user = User.find(session[:user_id]) unless session[:user_id].nil?
    flash[:error] = ERRORS[:sign_in_required]
  end
end
