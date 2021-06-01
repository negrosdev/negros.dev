FactoryBot.define do
  factory :content do
    title             { Faker::Name.name }
    slug              { Faker::Internet.slug }
    description       { Faker::Lorem.paragraph }
    level             { Faker::Number.within(range: 1..5) }
    content           { Faker::Lorem.paragraph }
    author
    tag
  end
end
