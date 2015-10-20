class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\w+@\w+\.\w+/, :on => :create
  validates :password, presence: true, confirmation: true
end
