require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::ProgrammingLanguage.name }
    slug { Faker::Internet.slug }
  end
end
