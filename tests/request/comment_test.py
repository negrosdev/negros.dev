from flask import url_for
from tests.factories.content import ContentFactory
from tests.fixtures import test_client
from ward import test


@test("anonymous user cannot send comment", tags=["comments"])
def _(client=test_client):
    content = ContentFactory.create(name="aprenda reactjs")
    payload = dict(text="exemplo de comentário")
    resp = client.post(
        url_for("contents.comment", content_slug=content.slug),
        data=payload,
        follow_redirects=True,
    )

    assert "Acesso a plataforma" in resp.get_data(as_text=True)
