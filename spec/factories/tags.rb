FactoryBot.define do
  factory :tag do
    name { Faker::ProgrammingLanguage.name.downcase }
    color { :light }
  end
end
