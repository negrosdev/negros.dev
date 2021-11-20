from mvc_flask import Router


Router.get("/", "home#index")

Router.get("/conteudo/buscar", "contents#search")
Router.get("/conteudo/<content_slug>", "contents#show")
Router.post("/conteudo/<content_slug>/comentar", "contents#comment")

Router.get("/auth/login", "auth#login")
Router.get("/auth/logout", "auth#logout")
Router.post("/auth/create", "auth#create")
