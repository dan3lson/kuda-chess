class Move < ActiveRecord::Base
  belongs_to :game

  validates :white, presence: true
  validates :black, presence: true
  validates :game, presence: true
end
