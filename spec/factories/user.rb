FactoryBot.define do
  factory :user do
    name {"test"}
    sequence(:email) { |n| "hoge#{n}@example.com" } 
    password {"password"}

  end
 end