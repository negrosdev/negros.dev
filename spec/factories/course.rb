require 'faker'

FactoryBot.define do
  factory :course do
    title { Faker::Name.name }
    slug { Faker::Internet.slug }
    description { Faker::Lorem.paragraph }
    level { Faker::Number.within(range: 1..5) }
    vimeo_ref { '372322938' }
    author
    category
  end
end
