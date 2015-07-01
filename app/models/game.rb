class Game < ActiveRecord::Base
  belongs_to :user
  has_many :moves, dependent: :destroy

  COLOR_OPTIONS = %w(white White black Black)
  RESULT_OPTIONS = %w(won Won lost Lost drew Drew)

  before_create :downcase_color, :downcase_result

  validates :opponent_fname, presence: true
  validates :opponent_lname, presence: true
  validates :color, presence: true, inclusion: { in: COLOR_OPTIONS }
  validates :result, presence: true, inclusion: { in: RESULT_OPTIONS }
  validates :day, presence: true

  def has_moves?
    self.moves.any?
  end

  def next_move_number
    "#{self.moves.count + 1}."
  end

  def display_better_date
    new_date = self.day.to_s.split("-")
    new_date.rotate.join("/")
  end

  private
    def downcase_color
      self.color.downcase
    end
    def downcase_result
      self.result.downcase
    end
end
