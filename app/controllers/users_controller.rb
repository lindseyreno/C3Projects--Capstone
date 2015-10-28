class UsersController < ApplicationController
  before_action :require_sign_in, only: [:edit, :update, :edit_preferences, :update_preferences]
  before_action :set_user, only: [:edit, :update, :edit_preferences, :update_preferences]

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      redirect_to root_path
    else
      flash.now[:errors] = ERRORS[:unsuccessful_sign_up]
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:messages] = MESSAGES[:successful_save]
      redirect_to root_path
    else
      flash[:messages] = MESSAGES[:unsuccessful_save]
      render :edit
    end
    # TODO: make this so you update one part at a time if the user is signed in
  end

  def edit_preferences
    @categories = Category.all
    @schedules = Schedule.all
  end

  def update_preferences
    if @user.update_attribute(:schedule_id, params[:schedule_id])
      if params[:user].nil?
        @user.categories = []
      else
        updated_categories = []
        params[:user][:category_ids].each do |category_id|
          updated_categories << Category.find(category_id)
          @user.categories = updated_categories
        end
      end
      flash[:messages] = MESSAGES[:successful_save]
      redirect_to root_path
    else
      flash[:messages] = MESSAGES[:unsuccessful_save]
      render :edit_preferences
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
