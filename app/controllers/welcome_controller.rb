class WelcomeController < ApplicationController
  def index
    @events = Event.todays_events
  end
end
