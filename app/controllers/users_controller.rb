class UsersController < ApplicationController
  before_action :require_sign_in, only: [:edit, :edit_preferences, :update_preferences]
  before_action :set_user, only: [:edit, :edit_preferences, :update_preferences]

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
      flash.now[:errors] = ERRORS[:unsuccessful_sign_up]
      render :new
    end
  end

  def edit; end

  def update
    # TODO: make this so you update one part at a time if the user is signed in
  end

  def edit_preferences
    @categories = Category.all
    @schedules = Schedule.all
  end

  def update_preferences
    @user.update_attribute(:schedule_id, params[:schedule_id])
      if params[:user] == nil
        @user.categories = []
      else
        updated_categories = []
        params[:user][:category_ids].each do |category_id|
          updated_categories << Category.find(category_id)
          @user.categories = updated_categories
        end
      end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
