class Event < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates_presence_of :title, :location, :date
  validates :title, uniqueness: { scope: [:date, :location] }
end
