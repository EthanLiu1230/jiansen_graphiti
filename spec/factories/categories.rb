FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    parent { nil }
  end
end
