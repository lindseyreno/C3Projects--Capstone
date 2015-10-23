class Schedule < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
