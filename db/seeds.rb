User.create(email: 'user@negros.dev', password: '123456', role: 6)

tag = FactoryBot.create(:tag, name: 'Python')
content = FactoryBot.create(:content,
                            title: "Desenvolvendo APIs com Django Restfull",
                            tag: FactoryBot.create(:tag),
                            description: "Neste conteúdo iremos abordar a criação de apis restfull usando o framework Django.",
                            tag: tag,
                            author: FactoryBot.create(:author, :with_photo))
tracks = FactoryBot.create_list(:track, 5, content: content)
content.thumbnail.attach(io: File.open('spec/support/assets/django.png'), filename: 'django.png', content_type: 'image/png')