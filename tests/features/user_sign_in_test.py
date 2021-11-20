from flask import url_for
from ward import test

from tests.factories.user import UserFactory
from tests.fixtures import browser
from app.models.user import ERole


@test("admin can login", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.ADMIN)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()

    assert browser.is_text_present(user.email)
    assert browser.is_text_present("sair")


@test("admin can login and view admin page", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.ADMIN)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()

    browser.visit(url_for("admin.index"))

    assert browser.is_text_present("negros.dev")
    assert browser.is_text_present("User")
    assert browser.is_text_present("Content")


@test("user can logout", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.ADMIN)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()

    browser.find_by_text("sair").click()

    assert browser.is_text_not_present(user.email)
    assert browser.is_text_not_present("sair")


@test("user logged cannot view login page", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.ADMIN)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()

    browser.visit(url_for("auth.login"))

    assert browser.url == "http://localhost/"


@test("user cannot access admin page", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.USER)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("admin.index"))

    assert browser.status_code.code == 403
    assert browser.is_text_present(
        "você não possui acesso suficiente para acessar está página."
    )


@test("author cannot access admin page", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.AUTHOR)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("admin.index"))

    assert browser.status_code.code == 403
    assert browser.is_text_present(
        "você não possui acesso suficiente para acessar está página."
    )


@test("staff cannot access admin page", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.STAFF)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("admin.index"))

    assert browser.status_code.code == 403
    assert browser.is_text_present(
        "você não possui acesso suficiente para acessar está página."
    )


@test("user cannot access admin/user", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.USER)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("user.index_view"))

    assert browser.status_code.code == 403
    assert browser.is_text_present(
        "você não possui acesso suficiente para acessar está página."
    )


@test("user cannot access admin/content", tags=["integration", "authentication"])
def _(browser=browser):
    user = UserFactory.create(password="admin1254", role=ERole.USER)

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "admin1254")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("content.index_view"))

    assert browser.status_code.code == 403
    assert browser.is_text_present(
        "você não possui acesso suficiente para acessar está página."
    )
