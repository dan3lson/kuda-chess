class Game < ActiveRecord::Base
  belongs_to :user
  has_many :moves

  validates :opponent_fname, presence: true
  validates :opponent_lname, presence: true
  validates :color, presence: true
  validates :result, presence: true
end


# Failures:
#
#   1) Game#initialization returns player color string
#      Failure/Error: expect(game.result).to be("0-1")
#
#        expected #<String:70298524243760> => "0-1"
#             got #<String:70298523655600> => "0-1"
#
#        Compared using equal?, which compares object identity,
#        but expected and actual are not the same object. Use
#        `expect(actual).to eq(expected)` if you don't care about
#        object identity in this example.
#      # ./spec/models/game_spec.rb:29:in `block (3 levels) in <top (required)>'
