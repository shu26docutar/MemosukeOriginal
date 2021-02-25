FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    id                    { 1 }
  end
end
