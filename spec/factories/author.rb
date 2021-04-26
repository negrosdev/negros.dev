require 'faker'

FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    instagram { Faker::Twitter.screen_name }
    linkedin { Faker::Twitter.screen_name }
    twitter { Faker::Twitter.screen_name }
    youtube { Faker::Twitter.screen_name }

    trait :with_photo do
      file = Rails.root.join('spec/support/assets/marcus.jpg')
      photo { ActiveStorage::Blob.create_and_upload!(io: File.open(file, 'rb'), filename: 'marcus.jpg').signed_id }
    end
  end
end
