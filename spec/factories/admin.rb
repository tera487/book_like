FactoryBot.define do
  factory :admin do
    name { "test" }
    sequence(:email) { |n| "hoge#{n}@example.com" }
    password { "password" }
  end
end
