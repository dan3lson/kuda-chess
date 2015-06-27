class User < ActiveRecord::Base
  has_many :games
  has_many :moves, through: :games
  
  validates :username, presence: true, uniqueness: true
end
