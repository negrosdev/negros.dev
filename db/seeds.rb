User.create(email: 'user@negros.dev', password: '123456', role: 6)

author = FactoryBot.create(:author, :with_photo)

category = Category.create(name: 'Ruby', slug: 'ruby')

category.icon.attach(io: File.open('./spec/support/assets/ruby.png'),
                     filename: 'ruby.png', content_type: 'image/png')

course = FactoryBot.create(:course, author: author, category: category)
course.thumbnail.attach(io: File.open('spec/support/assets/django.jpg'),
                        filename: 'django.jpg', content_type: 'image/jpg')
