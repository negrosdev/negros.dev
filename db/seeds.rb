category = FactoryBot.create(:category)
content = FactoryBot.create(:content, :with_resources, category:)

4.times do
  FactoryBot.create(:content, category: FactoryBot.create(:category))
end

