from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_sitemap import Sitemap
from flask_seeder import FlaskSeeder

db = SQLAlchemy()
migrate = Migrate()
seeder = FlaskSeeder()
sitemap = Sitemap()

login_manager = LoginManager()
login_manager.login_view = "auth.login"


def init_app(app):
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    seeder.init_app(app, db)
    sitemap.init_app(app)

    @sitemap.register_generator
    def urls():
        from app.models.content import Content

        yield "home.index", {}

        for content in Content.query.all():
            yield "contents.show", {"content_slug": content.slug}
