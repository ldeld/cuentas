FactoryBot.define do
  factory :debt do
    association :payer, factory: :user
    association :receiver, factory: :user
    amount 10
    description "MyText"
  end
end
