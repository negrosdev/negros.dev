from enum import Flag, auto

from app.extensions.extensions import db
from slugify import slugify
from sqlalchemy import event
from .source import Source


class EStatus(Flag):
    PUBLISHED = auto()
    UNPUBLISHED = auto()
    DRAFT = auto()


Requirements = db.Table(
    "related",
    db.Column("content_id", db.Integer, db.ForeignKey("contents.id")),
    db.Column("requirement_id", db.Integer, db.ForeignKey("contents.id")),
)


class Content(db.Model):
    __tablename__ = "contents"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    slug = db.Column(db.String(120), nullable=False, unique=True)
    description = db.Column(db.Text, nullable=False)
    text = db.Column(db.Text)
    embeded = db.Column(db.Text)
    status = db.Column(db.Enum(EStatus), default=EStatus.PUBLISHED)

    author_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    requirements = db.relationship(
        "Content",
        secondary=Requirements,
        primaryjoin=Requirements.c.requirement_id == id,
        secondaryjoin=Requirements.c.content_id == id,
        backref="content",
    )
    comments = db.relationship("Comment", backref="content", uselist=True)
    sources = db.relationship("Source", backref="content", uselist=True)

    created_on = db.Column(db.DateTime, server_default=db.func.now())

    def __repr__(self):
        return self.name


@event.listens_for(Content, "before_insert")
def slug(mapper, connect, target):
    target.slug = slugify(target.name)


@event.listens_for(Content, "before_update")
def slug(mapper, connect, target):
    target.slug = slugify(target.name)
