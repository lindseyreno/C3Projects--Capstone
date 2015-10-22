class Category < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
