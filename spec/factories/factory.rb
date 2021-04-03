require 'faker'

FactoryBot.define do
  
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end

  factory :author do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    instagram { Faker::Twitter.user }
    twitter { Faker::Internet.url }
    youtube { Faker::Internet.url }
  end

  factory :category do
    name { Faker::ProgrammingLanguage.name }
    slug { Faker::Internet.slug }
  end
  
  factory :source_code do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  factory :course do
    title { Faker::Name.name }
    slug { Faker::Internet.slug }
    description { Faker::Lorem.paragraph }
    level { Faker::Number.within(range: 1..5)  }
    code {  Faker::Number.hexadecimal(digits: 3)  }
    author
    category
    source_code
  end
end