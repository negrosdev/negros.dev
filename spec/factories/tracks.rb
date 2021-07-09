FactoryBot.define do
  factory :track do
    name                  { Faker::Name.name }
    track_type            { 1 }
    resource              { Faker::Lorem.paragraph }
    duration              { Faker::Number.within(range: 5..30) }
    order                 { Faker::Number.within(range: 1..10) }
    content
  end
end
