class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user

    mail to: user.email, subject: 'Account activation'
  end

  def newsletter(user, plan)
    @user = user
    @categories = @user.categories
    @schedule = Schedule.find(@user.schedule_id).name
    @plan = plan
    mail to: user.email, subject: 'My Seattle Events Newsletter'
  end
end
