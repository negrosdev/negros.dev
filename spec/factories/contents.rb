FactoryBot.define do
  factory :content do
    title                 { Faker::Name.name }
    description           { Faker::Lorem.paragraph }
    author
    status { :published }
    tag
  end
end
