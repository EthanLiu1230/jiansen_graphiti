FactoryBot.define do
  factory :blacklisted_token do
    token { "MyString" }
    user { nil }
    expire_at { "2021-05-18 20:27:40" }
  end
end
