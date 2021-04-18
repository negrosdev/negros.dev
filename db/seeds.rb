User.create(email: 'user@negros.dev', password: '123456', role: 6)

author = FactoryBot.create(:author, :with_photo)

category = Category.create(name: 'Ruby', slug: 'ruby')
category2 = Category.create(name: 'Ionic', slug: 'ionic')
category3 = Category.create(name: 'React', slug: 'react')


album = FactoryBot.create(:album)
FactoryBot.create_list(:video, 10, album: album)
FactoryBot.create_list(:course, 5, album: album, author: author)
