FactoryBot.define do
  factory :resource do
    name { Faker::Lorem.sentence(word_count: 3) }
    content

    trait :with_file do
      after(:create) do |resource|
        resource.file.attach(io: File.open('spec/support/files/source_code.rb'), filename: 'source_code.rb')
      end
    end
  end
end
