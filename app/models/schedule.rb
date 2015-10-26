class Schedule < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :description, presence: true

  scope :everyday, -> { where(:name => 'Every Day') }
  scope :weekend, -> { where(:name => 'Just the Weekend') }
  scope :week, -> { where(:name => 'This Week') }
  scope :two_weeks, -> { where(:name => 'Every Two Weeks') }
  scope :month, -> { where(:name => 'This Month') }
end
