FactoryBot.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
    roles     { :student }

    trait :confirmed do
      after(:create, &:confirm)
    end
  end
end
