FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bfisch #{n}" }
    password "password"
    password_confirmation "password"
  end

  factory :game do
    sequence(:opponent_fname) { |n| "Paul #{n}" }
    sequence(:opponent_lname) { |n| "Morphy #{n}" }
    color "white"
    result "won"
    sequence(:day) { |n| "August 6 197#{n}" }
    user
  end

  factory :move do
    white "e4"
    black "c5"
    game
  end
end
