require 'faker'

FactoryBot.define do
  factory :album do
    name { Faker::Name.name }
  end
end
