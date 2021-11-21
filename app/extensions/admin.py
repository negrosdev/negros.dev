import os
from flask_admin import Admin, AdminIndexView
from flask_admin.contrib.sqla import ModelView
from flask_login import current_user
from flask import abort

from .extensions import db
from app.models.content import Content
from app.models.user import User
from app.models.comment import Comment
from app.models.source import Source


class AdminView(AdminIndexView):
    def is_accessible(self):
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        abort(403, "você não possui acesso suficiente para acessar está página.")


class UserAdmin(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        abort(403, "você não possui acesso suficiente para acessar está página.")


class ContentAdmin(ModelView):
    form_excluded_columns = "slug"

    def is_accessible(self):
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        abort(403, "você não possui acesso suficiente para acessar está página.")


def init_app(app):
    url = os.environ["FLASK_ADMIN_URL"]
    admin = Admin(app=app, name="negros.dev", url=url ,index_view=AdminView(url=url))

    admin.add_view(UserAdmin(User, db.session))
    admin.add_view(ContentAdmin(Content, db.session))
    admin.add_views(ModelView(Comment, db.session))
    admin.add_views(ModelView(Source, db.session))
