import factory
from faker import Faker

from app.extensions.extensions import db
from app.models.user import ERole, User

faker = Faker()


class UserFactory(factory.alchemy.SQLAlchemyModelFactory):
    class Meta:
        model = User
        sqlalchemy_session = db.session
        sqlalchemy_session_persistence = "commit"

    name = faker.name()
    password = "test"
    description = faker.sentence(nb_words=6)
    role = ERole.USER

    @factory.lazy_attribute
    def email(self):
        return faker.free_email()
