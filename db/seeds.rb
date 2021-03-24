author = Author.create(name: 'Marcus Pereira', email: 'student@negros.dev')
category = Category.create(name: 'golang', slug: 'golang')
source_code = SourceCode.create(name: '283283-f', url: 'https://s.negros.dev/283283-f.zip')
Course.create(title: 'Design Pattern - Factory Com Golang', 
              slug: 'design-pattern-factory-com-golang',
              description: 'factory usango a linguagem go',
              level: 4,
              author: author,
              source_code: source_code,
              category: category
            )