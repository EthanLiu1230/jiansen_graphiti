FactoryBot.define do
  factory :user do
    first_name = Faker::Name.first_name
    name { first_name }
    email { "#{first_name}@test.com" }
    password { Faker::Lorem.word }
  end
end
