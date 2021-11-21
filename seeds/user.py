from flask_seeder import Seeder, Faker, generator

from app.models.user import User, ERole


class UserSeeder(Seeder):
    def __init__(self, db=None):
        super().__init__(db=db)
        self.priority = 1

    def run(self):
        faker = Faker(
            cls=User,
            init={
                "name": generator.Name(),
                "email": "admin@negros.dev",
                "password": "admin123",
                "description": generator.Sequence(),
                "role": ERole.ADMIN,
            },
        )

        for user in faker.create():
            print("Adding user: %s" % user)
            self.db.session.add(user)
