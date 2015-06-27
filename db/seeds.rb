puts "==============================================="
puts "Creating Users"
puts "==============================================="

10.times do
  User.create(username: Faker::Internet.user_name)
end

User.all.each do |user|
  puts "Username: " << user.username
end

puts "==============================================="
puts "Creating Games"
puts "==============================================="

50.times do
  Game.create(
    opponent_fname: Faker::Name.first_name,
    opponent_lname: Faker::Name.last_name,
    color: ["black", "white"].sample,
    result: ["1-0", "0-1", "1/2-1/2"].sample,
    day: Faker::Date.between(200000.days.ago, Date.today),
    user_id: User.all.sample.id
  )
end

Game.all.each do |game|
  puts "Game opponent_fname: " << game.opponent_fname
  puts "Game opponent_lname: " << game.opponent_lname
  puts "Game color: " << game.color
  puts "Game result: " << game.result
  puts "Game day: " << game.day.to_s
  puts "Game user id: " << game.user_id.to_s
  puts
end
