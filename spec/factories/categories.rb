FactoryBot.define do
  factory :category do
    name { Faker::ProgrammingLanguage.name }
    color { Faker::Color.hex_color }

    trait :with_contents do
      after(:create) { |category| create_list(:content, 3, category:) }
    end
  end
end
