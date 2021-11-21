from flask_seeder import Seeder, Faker, generator
from faker import Faker as F

from app.models.content import Content
from app.models.user import User


class ContentSeeder(Seeder):
  def __init__(self, db=None):
    super().__init__(db=db)
    self.priority = 2

  def run(self):
    faker = Faker(
      cls=Content,
      init={
        "name": generator.Name(),
        "text": F().paragraph(nb_sentences=12),
        "description": F().paragraph(nb_sentences=1),
        "author_id": User.query.first().id,
        "embeded": """
<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/184374359?h=71fdbf5881&title=0&byline=0&portrait=0" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>        
        """
      }
    )

    for content in faker.create(5):
        print("Adding content: %s" % content)
        self.db.session.add(content)
