FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password "azeqsd"
    name "test user"
  end
end
