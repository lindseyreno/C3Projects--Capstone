class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :title, presence: true, uniqueness: { scope: [:date, :location] }
  validates :location, presence: true
  validates :date, presence: true

  scope :todays_events, -> { where(:date => Date.current) }
end
