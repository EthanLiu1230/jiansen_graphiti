FactoryBot.define do
  factory :user do
    username { "#{Faker::Name.first_name}@test.com" }
    password { Faker::Lorem.words }
  end
end
