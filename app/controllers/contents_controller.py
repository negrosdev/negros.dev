import bleach
from flask import abort, flash, redirect, url_for
from flask_login import login_required, current_user

from app.models.content import Content
from app.extensions.extensions import db


class ContentsController:
    def search(self, view, request):
        name = request.args.get("content_name")
        contents = Content.query.filter(Content.name.contains(name)).all()

        if not contents:
            abort(404, "conteúdo não encontrado.")

        return view("home/index.html", contents=contents)

    def show(self, view, request, content_slug):
        content = Content.query.filter_by(slug=content_slug).first()

        if not content:
            abort(404, "conteúdo não encontrado.")

        return view("contents/show.html", content=content)
