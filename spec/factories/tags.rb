FactoryBot.define do
  factory :tag do
    name { Faker::ProgrammingLanguage.name }
  end
end
