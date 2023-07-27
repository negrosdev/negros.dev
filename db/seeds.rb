6.times do
  FactoryBot.create(:content, category: FactoryBot.create(:category))
end
