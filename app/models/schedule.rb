class Schedule < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
end
