Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(username: Faker::Internet.user_name)
Rails.logger.info "Username: #{user.username}"

Rails.logger.info "==============================================="
Rails.logger.info "Creating Games"
Rails.logger.info "==============================================="

50.times do
  game = Game.create!(
    opponent_fname: Faker::Name.first_name,
    opponent_lname: Faker::Name.last_name,
    color: %w(black white).sample,
    result: %w(won lost drew).sample,
    day: Faker::Date.between(356.days.ago, Date.today),
    user: User.first
  )
  Rails.logger.info "Game opponent_fname: #{game.opponent_fname}"
  Rails.logger.info "Game opponent_lname: #{game.opponent_lname}"
  Rails.logger.info "Game color: #{game.color}"
  Rails.logger.info "Game result: #{game.result}"
  Rails.logger.info "Game day: #{game.day}"
  Rails.logger.info "Game user: #{game.user.username}"
  Rails.logger.info
end

Rails.logger.info "==============================================="
Rails.logger.info "Creating Moves"
Rails.logger.info "==============================================="
PIECES = %w(K N B Q R P)
LETTERS = %w(a b c d e f g h)
NUMBERS = %w(1 2 3 4 5 6 7 8)
Game.all.each do |game|
  game_moves = rand(33)
  game_moves.times do
    whites_move = "#{PIECES.sample}#{LETTERS.sample}#{NUMBERS.sample}"
    blacks_move = "#{PIECES.sample}#{LETTERS.sample}#{NUMBERS.sample}"
    game.moves << Move.create!(
      white: whites_move,
      black: blacks_move,
      game: game
    )
    Rails.logger.info "Opponent \'#{game.opponent_fname} #{game.opponent_lname[0]}.\' --> "
    Rails.logger.info "white: #{whites_move} black: #{blacks_move}"
  end
end
