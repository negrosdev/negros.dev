from app.extensions.extensions import db


class Source(db.Model):
    __tablename__ = "sources"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    link = db.Column(db.String, nullable=False)

    content_id = db.Column(db.Integer, db.ForeignKey("contents.id"), nullable=False)
    created_on = db.Column(db.DateTime, server_default=db.func.now())

    def __repr__(self):
        return self.name
