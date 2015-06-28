FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bfisch #{n}" }
  end

  factory :game do
    sequence(:opponent_fname) { |n| "Paul #{n}" }
    sequence(:opponent_lname) { |n| "Morphy #{n}" }
    color "white"
    result "won"
    sequence(:day) { |n| "August 6 197#{n}" }
    counter 33
    user
  end

  factory :move do
    white "e4"
    black "c5"
    game
  end
end
