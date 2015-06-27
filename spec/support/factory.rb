FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "kamehameha #{n}" }
  end

  factory :game do
    opponent_fname "Bobby"
    opponent_lname "Fischer"
    color "white"
    result "0-1"
    user
  end

  factory :move do
    counter 1
    white "e4"
    black "c5"
    game
  end
end
