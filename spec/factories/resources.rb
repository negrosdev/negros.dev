FactoryBot.define do
  factory :resource do
    name { Faker::Lorem.sentence(word_count: 3) }
    content
  end
end
