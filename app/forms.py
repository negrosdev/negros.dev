from flask_wtf import FlaskForm
from wtforms.fields import PasswordField, SubmitField, TextAreaField
from wtforms.fields.simple import StringField
from wtforms.validators import DataRequired, Email, Length


class LoginForm(FlaskForm):
    email = StringField("E-mail", validators=[DataRequired(), Email()])
    password = PasswordField("Senha", validators=[DataRequired()])
    submit = SubmitField("Entrar")
