from flask import Blueprint, abort, render_template, request, redirect, url_for, flash

from flask_login import login_user, logout_user, current_user, login_required

from app.forms import CommentForm, LoginForm
from app.extensions.extensions import db
from app.models.content import Content
from app.models.user import User
from app.models.comment import Comment


page = Blueprint("page", __name__)


@page.before_request
def check_user_logged():
    if current_user.is_authenticated:
        if request.endpoint == "page.login":
            return redirect(url_for("page.home"))


@page.get("/")
def home():
    contents = Content.query.order_by(Content.created_on.asc()).limit(10).all()

    return render_template("home/index.html", contents=contents)


@page.get("/plataforma/entrar")
def login():
    form = LoginForm()
    return render_template("auth/login.html", form=form)


@page.get("/plataforma/sair")
def logout():
    if current_user:
        logout_user()
        flash(message="obrigado por fazer parte do negros.dev", category="success")
        return redirect(url_for(".login"))


@page.post("/auth/receive")
def auth():
    form = LoginForm()

    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()

        if not user or not user.valid_password(form.password.data):
            flash(message="email ou senha inválido", category="error")
            return redirect(url_for(".login"))

        login_user(user)
        return redirect(url_for(".home"))


@page.get("/busca/conteudo")
def find_content():
    name = request.args.get("content_name")
    contents = Content.query.filter(Content.name.contains(name)).all()

    if not contents:
        abort(404, "conteúdo não encontrado.")

    return render_template("home/index.html", contents=contents)


@page.route("/conteudo/<content_slug>/")
@page.route("/conteudo/<content_slug>/<track_slug>")
def content(content_slug, track_slug=None):
    form = CommentForm()

    content = Content.query.filter_by(slug=content_slug).outerjoin(Track)

    if not content.first():
        abort(404, "conteúdo não encontrado.")

    track = None
    if track_slug:
        track = content.filter(Track.slug == track_slug).with_entities(Track).one()

    return render_template(
        "contents/show.html", content=content.first(), track=track, form=form
    )


@page.post("/conteudo/<content_slug>/<track_slug>/comentar")
@login_required
def create_comment(content_slug, track_slug):
    form = CommentForm()

    track = Track.query.filter_by(slug=track_slug).first()

    if not track:
        abort(404, "o conteúdo não existe!")

    if form.validate_on_submit():
        status = True if current_user.is_admin else False
        comment = Comment(
            text=form.text.data, author=current_user, track=track, status=status
        )

        db.session.add(comment)
        db.session.commit()

        flash(message="comentário enviado com sucesso", category="success")
        return redirect(
            url_for("page.content", content_slug=content_slug, track_slug=track_slug)
        )
