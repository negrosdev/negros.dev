User.create(email: 'user@negros.dev', password: '123456', role: 6)

FactoryBot.create(:content,
                  title: "Criando Apis com Go",
                  tag: FactoryBot.create(:tag),
                  author: FactoryBot.create(:author, :with_photo))
