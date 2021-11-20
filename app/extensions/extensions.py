from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

db = SQLAlchemy()
migrate = Migrate()
login_manager = LoginManager()
login_manager.login_view = "auth.login"


def init_app(app):
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
