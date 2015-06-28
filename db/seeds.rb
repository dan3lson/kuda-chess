puts "==============================================="
puts "Creating Users"
puts "==============================================="

10.times do
  user = User.create!(username: Faker::Internet.user_name)
  puts "Username: #{user.username}"
end

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
    user: User.find(rand(1..10))
  )
  puts "Game opponent_fname: #{game.opponent_fname}"
  puts "Game opponent_lname: #{game.opponent_lname}"
  puts "Game color: #{game.color}"
  puts "Game result: #{game.result}"
  puts "Game day: #{game.day}"
  puts "Game user: #{game.user.username}"
  puts
end
