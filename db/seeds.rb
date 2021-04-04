User.create(email: 'user@negros.dev', password: '123456')

author = Author.create(name: 'Marcus Pereira', email: 'student@negros.dev')
author2 = Author.create(name: 'Aline Rosa', email: 'aline@yahoo.com')

category = Category.create(name: 'Ruby', slug: 'ruby')
category2 = Category.create(name: 'Ionic', slug: 'ionic')
category3 = Category.create(name: 'React', slug: 'react')


Course.create(title: 'Design Pattern - Factory Com Ruby', 
              slug: 'design-pattern-factory-com-ruby',
              description: 'factory usango a linguagem ruby',
              level: 4,
              author: author,
              category: category,
              code: 'c01uc81ja7'
            )

Course.create(title: 'Criando Componentes Com React', 
              slug: 'criando-componentes-com-reactjs',
              description: 'criando componentes com reactjs',
              level: 2,
              author: author2,
              category: category3,
              code: 'c01u31c21'
            )

Course.create(title: 'Ionic Desenvolvendo Mobile Apps ', 
              slug: 'ionic-desenvolvendo-mobile-apps',
              description: 'ionic',
              level: 4,
              author: author,
              category: category2,
              code: '9812nmc'
            )

Course.create(title: 'React.js - State', 
              slug: 'react-js-state',
              description: 'reactjs state',
              level: 5,
              author: author2,
              category: category2,
              code: '12o09adc'
            )

Course.create(title: 'Ionic Icons', 
              slug: 'ionic-icons',
              description: 'ionic icons',
              level: 3,
              author: author2,
              category: category2,
              code: '1298casd9'
            )

Course.create(title: 'Entendendo O Rails New', 
              slug: 'entendendo-o-rails-new',
              description: 'rails new',
              level: 1,
              author: author,
              category: category,
              code: '823908cn'
            )

Course.create(title: 'Ruby Agendamento', 
              slug: 'ruby-agendamento-de-tarefas',
              description: 'Trabalhando com agendamento de tarefas',
              level: 4,
              author: author,
              category: category,
              code: 'sa-d901'
            )

Course.create(title: 'Instalando Ionic', 
              slug: 'instalando-ionic',
              description: 'aprenda a instalar o ionic',
              level: 2,
              author: author2,
              category: category2,
              code: 'c01uc81ja7'
            )

Course.create(title: 'Configurando Ionic', 
              slug: 'configurando-ionic',
              description: 'configurando ionic',
              level: 4,
              author: author2,
              category: category2,
              code: 'asdi912joasc'
            )

Course.create(title: 'Instalando React Create App', 
              slug: 'instalando-react-create-app',
              description: 'instalando react create app',
              level: 1,
              author: author2,
              category: category3,
              code: 'a9s8d9a8'
            )

