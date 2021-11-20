from app.models.content import Content


class HomeController:
    def index(self, view, request):
        contents = Content.query.order_by(Content.created_on.asc()).limit(10).all()

        return view("home/index.html", contents=contents)
