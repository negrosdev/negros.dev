from flask_login import LoginManager
from flask_sitemap import Sitemap
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
login_manager = LoginManager()
login_manager.login_view = "auth.login"


def development(app):
    from flask_migrate import Migrate
    from flask_seeder import FlaskSeeder

    Migrate(app, db)
    FlaskSeeder(app, db)


def production(app):
    db.init_app(app)
    login_manager.init_app(app)


def init_app(app):
    env = app.config.ENV

    if env == "development" or env == "testing":
        development(app)
    production(app)

    sitemap = Sitemap(app)

    @sitemap.register_generator
    def _():
        from app.models.content import Content

        yield "home.index", {}

        for content in Content.query.all():
            yield "contents.show", {"content_slug": content.slug}
