class Game < ActiveRecord::Base
  belongs_to :user
  has_many :moves

  validates :opponent_fname, presence: true
  validates :opponent_lname, presence: true
  validates :color, presence: true
  validates :result, presence: true
end
