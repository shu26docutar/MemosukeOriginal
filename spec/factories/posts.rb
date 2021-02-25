FactoryBot.define do
  factory :post do
    title              { Faker::Lorem.characters(number: 10) }
    body               { Faker::Lorem.sentence }
    id                 { 1 }
    user_id            { 1 }
    association :user
  end
end
