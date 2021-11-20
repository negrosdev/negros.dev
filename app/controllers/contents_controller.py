import bleach
from flask import abort, flash, redirect, url_for
from flask_login import login_required, current_user

from app.forms import CommentForm
from app.models.content import Content
from app.models.comment import Comment
from app.extensions.extensions import db


class ContentsController:
    def search(self, view, request):
        name = request.args.get("content_name")
        contents = Content.query.filter(Content.name.contains(name)).all()

        if not contents:
            abort(404, "conteúdo não encontrado.")

        return view("home/index.html", contents=contents)

    def show(self, view, request, content_slug):
        form = CommentForm()

        content = Content.query.filter_by(slug=content_slug).first()

        if not content:
            abort(404, "conteúdo não encontrado.")

        return view("contents/show.html", content=content, form=form)

    @login_required
    def comment(self, view, request, content_slug):
        form = CommentForm()

        content = Content.query.filter_by(slug=content_slug).first()

        if not content:
            abort(404, "conteúdo não encontrado.")

        if form.validate_on_submit():
            approved_if_admin = True if current_user.is_admin else False

            text = bleach.clean(form.text.data, tags=bleach.ALLOWED_TAGS + ["p"])

            comment = Comment(
                text=text,
                status=approved_if_admin,
                author=current_user,
                content=content,
            )

            db.session.add(comment)
            db.session.commit()

            flash(message="comentário enviado com sucesso", category="success")

            return redirect(url_for(".show", content_slug=content_slug))

        return view("contents/show.html", content=content, form=form)
