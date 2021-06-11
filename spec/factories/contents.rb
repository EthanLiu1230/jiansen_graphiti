FactoryBot.define do
  factory :content do
    name { Faker::Name.name }
    title { Faker::Lorem.words }
  end
end
