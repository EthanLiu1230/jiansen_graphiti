FactoryBot.define do
  factory :page do
    path { Faker::File.dir }
  end
end
