puts "==============================================="
puts "Creating Users"
puts "==============================================="

user = User.create!(username: Faker::Internet.user_name)
puts "Username: #{user.username}"
# 10.times do
#   user = User.create!(username: Faker::Internet.user_name)
#   puts "Username: #{user.username}"
# end

puts "==============================================="
puts "Creating Games"
puts "==============================================="

50.times do
  game = Game.create!(
    opponent_fname: Faker::Name.first_name,
    opponent_lname: Faker::Name.last_name,
    color: %w(black white).sample,
    result: %w(won lost drew).sample,
    day: Faker::Date.between(356.days.ago, Date.today),
    # user: User.find(rand(1..10))
    user: User.first
  )
  puts "Game opponent_fname: #{game.opponent_fname}"
  puts "Game opponent_lname: #{game.opponent_lname}"
  puts "Game color: #{game.color}"
  puts "Game result: #{game.result}"
  puts "Game day: #{game.day}"
  puts "Game user: #{game.user.username}"
  puts
end

puts "==============================================="
puts "Creating Moves"
puts "==============================================="
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
    print "Opponent \'#{game.opponent_fname} #{game.opponent_lname[0]}.\' --> "
    puts "white: #{whites_move} black: #{blacks_move}"
  end
end
