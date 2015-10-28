class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = User.new
    end
    @categories = Category.all
    @events = Event.todays_events
  end
end
