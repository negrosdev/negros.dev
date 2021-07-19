require 'faker'

FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    linkedin { Faker::Internet.username }
    github { Faker::Internet.username }
    twitter { Faker::Twitter.screen_name }
    instagram { Faker::Internet.username }
    facebook { Faker::Internet.username }

    trait :with_photo do
      file = Rails.root.join('spec/support/assets/marcus.jpg')
      photo { ActiveStorage::Blob.create_and_upload!(io: File.open(file, 'rb'), filename: 'marcus.jpg').signed_id }
    end
  end
end
