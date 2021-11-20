from flask import redirect, url_for, flash, request
from flask_login import login_user, logout_user, current_user

from app.models.user import User

from app.forms import LoginForm


class AuthController:
    before_request = ["_check_user_authenticated"]

    def login(self, view, request):
        return view("auth/login.html", form=LoginForm())

    def create(self, view, request):
        form = LoginForm()

        if form.validate_on_submit():
            user = User.query.filter_by(email=form.email.data).first()

            if not user or not user.valid_password(form.password.data):
                flash(message="e-mail ou senha inválida", category="error")
                return redirect(url_for(".login"))

            login_user(user)
            return redirect(url_for("home.index"))

        return view("auth/login.html", form=LoginForm())

    def logout(self, view, request):
        if current_user:
            logout_user()
            flash(message="obrigado por fazer parte do negros.dev", category="success")
            return redirect(url_for(".login"))

    def _check_user_authenticated(self):
        if current_user.is_authenticated and request.endpoint == "auth.login":
            return redirect(url_for("home.index"))
