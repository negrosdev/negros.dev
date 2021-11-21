from splinter import Browser
from ward import fixture

from app import create_app
from app.extensions.extensions import db


def app_client():
    app = create_app()
    app.testing = True
    app_contenxt = app.test_request_context()
    app_contenxt.push()

    return app


@fixture
def test_client():
    app = app_client()

    with app.test_client() as client:
        db.create_all()
        yield client

    db.session.remove()
    db.drop_all()


@fixture
def browser():
    app = app_client()

    with app.test_client():
        db.create_all()
        yield Browser("flask", app=app)

    db.session.remove()
    db.drop_all()
