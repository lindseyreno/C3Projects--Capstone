class User < ActiveRecord::Base
  attr_accessor :activation_token
  before_create :create_activation_digest
  has_secure_password
  has_and_belongs_to_many :categories
  belongs_to :schedule

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: /\w+@\w+\.\w+/, :on => :create
  validates :password, presence: true, confirmation: true

  scope :everyday, -> { where(:schedule_id => Schedule.everyday) }
  scope :weekend, -> { where(:schedule_id => Schedule.weekend) }
  scope :week, -> { where(:schedule_id => Schedule.week) }
  scope :two_weeks, -> { where(:schedule_id => Schedule.two_weeks) }
  scope :month, -> { where(:schedule_id => Schedule.month) }

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
