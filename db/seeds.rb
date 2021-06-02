User.create(email: 'user@negros.dev', password: '123456', role: 6)


5.times do
  author = FactoryBot.create(:author, :with_photo)
  tag = FactoryBot.create(:tag)
  FactoryBot.create(:content, tag: tag, author: author)
end