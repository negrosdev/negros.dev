from flask import Flask
from dynaconf import FlaskDynaconf


def create_app():
    app = Flask(__name__)

    FlaskDynaconf(app, extensions_list=True, load_dotenv=True)

    return app
