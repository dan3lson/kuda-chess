class User < ActiveRecord::Base
  #before_save { self.email = email.downcase }

  has_many :games
  has_many :moves, through: :games


  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 33 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email,
  #   presence: true,
  #   length: { maximum: 255 },
  #   format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
