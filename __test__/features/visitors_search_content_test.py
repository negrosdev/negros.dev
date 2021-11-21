from flask import url_for
from ward import test

from __test__.factories.content import ContentFactory
from __test__.fixtures import browser


@test("and search content", tags=["integration", "search"])
def _(browser=browser):
    contents = ContentFactory.create_batch(10)

    content_found = contents[5]

    browser.visit(url_for("home.index"))
    browser.find_by_name("content_name").fill(content_found.name)
    browser.find_by_value("BUSCAR").click()

    assert browser.is_text_present(content_found.name)
