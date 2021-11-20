from app.extensions.extensions import db


class Comment(db.Model):
    __tablename__ = "comments"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    text = db.Column(db.Text, nullable=False)
    status = db.Column(db.Boolean, default=False)
    author_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    content_id = db.Column(db.Integer, db.ForeignKey("contents.id"), nullable=False)

    created_on = db.Column(db.DateTime, server_default=db.func.now())

    @property
    def approved(self):
        return self.status

    def __repr__(self):
        return f"Content: {self.content .name} Author: {self.author.name}<{self.author.email}>"
