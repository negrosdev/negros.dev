from datetime import datetime

from flask import url_for
from ward import test

from __test__.factories.content import ContentFactory
from __test__.fixtures import browser


@test("with successfully")
def _(browser=browser):
    browser.visit(url_for("home.index"))

    assert browser.url == "/"
    assert browser.status_code.is_success()
    assert browser.is_text_present("Conteúdos em vídeos")


@test("and view the content list", tags=["index"])
def _(browser=browser):
    content = ContentFactory.create(name="Testando aplicações flask")

    browser.visit(url_for("home.index"))

    assert browser.is_text_present(content.name)


@test("and view ordered contents list")
def _(browser=browser):
    content1 = ContentFactory.create(
        created_on=datetime.strptime("08/10/21 08:00", "%d/%m/%y %H:%M")
    )
    content2 = ContentFactory.create(
        created_on=datetime.strptime("10/10/21 21:23", "%d/%m/%y %H:%M")
    )
    content3 = ContentFactory.create(
        created_on=datetime.strptime("11/10/21 10:35", "%d/%m/%y %H:%M")
    )
    content4 = ContentFactory.create(
        created_on=datetime.strptime("08/10/21 11:11", "%d/%m/%y %H:%M")
    )

    browser.visit(url_for("home.index"))

    assert content1.name in str(
        browser.find_by_css("#contents > ol > li:nth-child(1)").first.text
    )
    assert content4.name in str(
        browser.find_by_css("#contents > ol > li:nth-child(2)").first.text
    )
    assert content2.name in str(
        browser.find_by_css("#contents > ol > li:nth-child(3)").first.text
    )
    assert content3.name in str(
        browser.find_by_css("#contents > ol > li:nth-child(4)").first.text
    )
