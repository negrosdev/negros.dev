User.create(email: 'user@negros.dev', password: '123456', role: 6)

author = FactoryBot.create(:author, :with_photo)

tag = FactoryBot.create(:tag)
tag.icon.attach(io: File.open('./spec/support/assets/ruby.png'),
                     filename: 'ruby.png', content_type: 'image/png')

5.times do
  FactoryBot.create(:content, tag: tag, author: author)
end