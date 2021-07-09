User.create(email: 'user@negros.dev', password: '123456', role: 6)

tag = FactoryBot.create(:tag, name: 'Python')

author = FactoryBot.create(:author, name: 'Marcus Pereira')
author.photo.attach(io: File.open('spec/support/assets/marcus.jpg'), filename: 'marcus.jpg', content_type: 'image/png')


posts = FactoryBot.create_list(:post, 5, author: author)
posts.each do | post |
  post.image.attach(io: File.open('spec/support/assets/django.png'), filename: 'django.png', content_type: 'image/png')
end

content = FactoryBot.create(:content,
                            title: "Desenvolvendo APIs com Django Restfull",
                            tag: tag,
                            description: "Neste conteúdo iremos abordar a criação de apis restfull usando o framework Django.",
                            author: author)
tracks = FactoryBot.create_list(:track, 5, content: content)
content.thumbnail.attach(io: File.open('spec/support/assets/django.png'), filename: 'django.png', content_type: 'image/png')