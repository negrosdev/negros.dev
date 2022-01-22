from enum import Flag, auto

from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from libgravatar import Gravatar

from app.extensions.extensions import db, login_manager


class ERole(Flag):
    USER = auto()
    AUTHOR = auto()
    STAFF = auto()
    ADMIN = auto()


@login_manager.user_loader
def get_current_user(user_id):
    return User.query.get(user_id)


class User(db.Model, UserMixin):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(85), nullable=False)
    email = db.Column(db.String(85), nullable=False, unique=True)
    pwd_hash = db.Column(db.String(255), nullable=False)
    description = db.Column(db.String(79), nullable=False)
    role = db.Column(db.Enum(ERole), default=ERole.USER)

    contents = db.relationship("Content", backref="author", uselist=True)

    created_on = db.Column(db.DateTime, server_default=db.func.now())

    @property
    def password(self):
        return AttributeError("cannot read password")

    @password.setter
    def password(self, password):
        self.pwd_hash = generate_password_hash(password)

    def valid_password(self, password):
        return check_password_hash(self.pwd_hash, password)

    @property
    def is_admin(self):
        return self.role == ERole.ADMIN

    @property
    def image(self):
        g = Gravatar(self.email)
        return g.get_image()

    def __repr__(self):
        return f"{self.name} <{self.email}>"
