FactoryBot.define do
  factory :content do
    title                 { Faker::Name.name }
    description           { Faker::Lorem.paragraph }
    author
    tag
  end
end
