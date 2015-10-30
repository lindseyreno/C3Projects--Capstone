class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :title, presence: true, uniqueness: { scope: [:date, :location] }
  validates :location, presence: true
  validates :date, presence: true

  scope :todays_events, -> { where(:date => Date.today) }
  scope :today_plus2, -> { where(:date => Date.today + 2.days) }
  scope :today_plus3, -> { where(:date => Date.today + 3.days) }
  scope :today_plus4, -> { where(:date => Date.today + 4.days) }
  scope :today_plus5, -> { where(:date => Date.today + 5.days) }
  scope :today_plus6, -> { where(:date => Date.today + 6.days) }

  # Events for the day after the email is sent
  scope :everyday, -> { where(:date => Date.today + 1.day) }

  # Events for the friday, saturday, and sunday after the wednesday the email is sent
  scope :weekend, -> { where(:date => (Date.today + 2.days)..(Date.today + 2.days) + 2.days) }

  # Events for the week after the email is sent
  scope :week, -> { where(:date => Date.today..Date.today + 1.week) }

  # Events for the two weeks after the email is sent
  scope :two_weeks, -> { where(:date => Date.today..Date.today + 2.weeks) }

  # Events for the month the email is sent, it is sent on the 1st of the month
  scope :month, -> { where(:date => Date.today...Date.today.next_month.beginning_of_month) }
end
