FactoryBot.define do
  factory :memo do
    title              { Faker::Lorem.characters(number: 10) }
    content            { Faker::Lorem.sentence }
    id                 { 1 }
    user_id            { 1 }
    association :user
  end
end
