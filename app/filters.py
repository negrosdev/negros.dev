import markdown2
from flask import Flask
from markupsafe import Markup


def to_html(text):
    return (
        Markup(markdown2.markdown(text, extras=["fenced-code-blocks"])) if text else ""
    )


def init_app(app: Flask):
    app.jinja_env.filters["to_html"] = to_html
