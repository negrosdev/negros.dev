from flask import url_for
from ward import test
from flask_babel import format_datetime

from app.models.source import Source
from __test__.factories.content import ContentFactory
from __test__.fixtures import browser


@test("and click to open the content")
def _(browser=browser):
    content = ContentFactory.create(name="Introdução ao Flask")

    browser.visit(url_for("home.index"))
    browser.find_by_text(content.name).first.click()

    assert browser.url == f"/conteudo/{content.slug}"
    assert browser.status_code.is_success()
    assert browser.is_text_present(content.name)


@test("and view content details")
def _(browser=browser):
    content = ContentFactory.create(name="Introdução ao Flask")

    browser.visit(url_for("contents.show", content_slug=content.slug))

    assert browser.is_text_present(content.name)
    assert browser.is_text_present(content.description)
    assert browser.is_text_present(content.text)
    assert browser.is_text_present(content.author.name)


@test("and view sources", tags=["content", "source"])
def _(browser=browser):
    s = Source(name="Apostila de flask", link="https://negros.dev/apostila-flask.pdf")
    s2 = Source(name="Apostila de flask", link="https://negros.dev/apostila-flask.pdf")

    content = ContentFactory.create(name="Introdução ao Flask", sources=[s, s2])

    browser.visit(url_for("contents.show", content_slug=content.slug))

    assert browser.is_text_present(s.name)
    assert browser.is_text_present(s2.name)


@test("and view content author info")
def _(browser=browser):
    content = ContentFactory.create(name="Introdução ao Flask")

    browser.visit(url_for("contents.show", content_slug=content.slug))

    assert browser.is_text_present(content.author.name)
    assert browser.is_text_present(content.author.description)


@test("view metadata")
def _(browser=browser):
    content = ContentFactory.create(name="Introdução ao Flask")

    browser.visit(url_for("contents.show", content_slug=content.slug))
    timestamp = format_datetime(content.updated_on, "medium")
    assert browser.is_text_present(
        f"O conteúdo apresentado foi atualizado em {timestamp} e poderá ser modificado a qualquer momento sem aviso prévio."
    )
