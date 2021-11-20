import factory
from faker import Faker
from datetime import datetime

from app.extensions.extensions import db
from app.models.content import Content, EStatus
from .user import UserFactory

faker = Faker()


class ContentFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = Content
        sqlalchemy_session = db.session
        sqlalchemy_session_persistence = "commit"

    description = faker.sentence(nb_words=10)
    status = EStatus.PUBLISHED
    text = faker.sentence(nb_words=10)
    author = factory.SubFactory(UserFactory)
    created_on = datetime.utcnow()

    @factory.lazy_attribute
    def name(self):
        return faker.name()

    @factory.lazy_attribute
    def slug(self):
        return self.name
