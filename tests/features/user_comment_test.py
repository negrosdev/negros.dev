from app.models.user import ERole
from flask import url_for
from tests.factories.content import ContentFactory
from tests.factories.user import UserFactory
from tests.fixtures import browser
from ward import test, skip


@skip("not implement yet")
@test("user send comment and cannot view comment unapproved", tags=["comments"])
def _(browser=browser):
    user = UserFactory.create(password="user123")
    content = ContentFactory.create(name="aprenda reactjs")

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "user123")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("contents.show", content_slug=content.slug))

    browser.fill("text", "muito bom! Vai ter a versão 2?")
    browser.find_by_value("Enviar").click()

    assert browser.is_text_not_present("muito bom! Vai ter a versão 2?")


@skip("not implement yet")
@test("admin send comment and view comment approved", tags=["comments"])
def _(browser=browser):
    user = UserFactory.create(password="user123", role=ERole.ADMIN)
    content = ContentFactory.create(name="aprenda reactjs")

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "user123")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("contents.show", content_slug=content.slug))

    browser.fill("text", "muito bom! Vai ter a versão 2?")
    browser.find_by_value("Enviar").click()

    assert browser.is_text_present("muito bom! Vai ter a versão 2?")


@skip("not implement yet")
@test("ensure the security of comment", tags=["comments"])
def _(browser=browser):
    user = UserFactory.create(password="user123", role=ERole.ADMIN)
    content = ContentFactory.create(name="aprenda reactjs")

    browser.visit(url_for("auth.login"))
    browser.fill("email", user.email)
    browser.fill("password", "user123")
    browser.find_by_value("Entrar").click()
    browser.visit(url_for("contents.show", content_slug=content.slug))

    browser.fill("text", "<script>alert('hi!')</script>")
    browser.find_by_value("Enviar").click()

    assert "<p>&lt;script&gt;alert('hi!')&lt;/script&gt;</p>" in browser.html
