FactoryBot.define do
  factory :content do
    name        { Faker::Lorem.sentence(word_count: 3) }
    body        { Faker::Lorem.paragraph(sentence_count: 5) }
    description { Faker::Lorem.paragraph(sentence_count: 15) }
    status      { :draft }
  end
end
