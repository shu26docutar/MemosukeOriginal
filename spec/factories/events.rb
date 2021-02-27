FactoryBot.define do
  factory :event do
    title       { Faker::Lorem.word }
    plan        { Faker::Lorem.sentence }
    comment     { Faker::Lorem.sentence}
    url         { Faker::Internet.url }
    place       { Faker::Address.city }
    start_time  { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
    id          { 1 }
    user_id     { 1 }
    association :user
  end
end
