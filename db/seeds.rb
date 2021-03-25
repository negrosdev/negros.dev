author = Author.create(name: 'Marcus Pereira', email: 'student@negros.dev')
category = Category.create(name: 'Ruby', slug: 'ruby')
source_code = SourceCode.create(name: '283283-f', url: 'https://s.negros.dev/283283-f.zip')
Course.create(title: 'Design Pattern - Factory Com Ruby', 
              slug: 'design-pattern-factory-com-ruby',
              description: 'factory usango a linguagem ruby',
              level: 4,
              author: author,
              source_code: source_code,
              category: category,
              code: 'c01uc81ja7'
            )