FactoryBot.define do
  factory :user do
    username { "#{Faker::Lorem.word}@test.com" }
    password { Faker::Lorem.word }
  end
end
