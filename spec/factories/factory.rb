FactoryBot.define do
  
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end

  factory :category do
    name { Faker::Name.name }
    slug { Faker::Internet.slug }
  end
  
  factory :source_code do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  factory :album do
    name { Faker::Name.name }
  end

  factory :video do
    name { Faker::Name.name }
    order { Faker::Number.digit }
    video_id { Faker::Number.number(digits: 10) }
    album
  end

  factory :course do
    title { Faker::Name.name }
    slug { Faker::Internet.slug }
    description { Faker::Lorem.paragraph }
    level { Faker::Number.within(range: 1..5)  }
    album
    user
    category
    source_code
  end
end