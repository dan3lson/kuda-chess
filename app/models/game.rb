class Game < ActiveRecord::Base
  belongs_to :user
  has_many :moves

  COLOR_OPTIONS = %w(white White black Black)
  RESULT_OPTIONS = %w(1-0 0-1 1/2-1/2)

  before_create :downcase_color

  validates :opponent_fname, presence: true
  validates :opponent_lname, presence: true
  validates :color, presence: true, inclusion: { in: COLOR_OPTIONS }
  validates :result, presence: true, inclusion: { in: RESULT_OPTIONS }
  validates :day, presence: true

  private
    def downcase_color
      self.color.downcase
    end
end
