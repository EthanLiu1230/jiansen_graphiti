FactoryBot.define do
  factory :user do
    name = Faker::Name.name
    name { name }
    email { "#{name}@#{Faker::Lorem.word}.com" }
    password { Faker::Lorem.word }
    role { 'admin' }
  end
end
