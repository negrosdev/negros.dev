require 'faker'

FactoryBot.define do
  factory :video do
    name       { Faker::Name.name }
    order      { Faker::Number.within(range: 1..100) }
    vimeo_code { Faker::Internet.uuid }
  end
end
