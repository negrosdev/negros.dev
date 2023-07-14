## Configuração do projeto

O primeiro passo para configurar as **variáveis de ambiente** é alterar o arquivo `example.env` para `.env`. Cada variável de ambiente representa um
serviço da aplicação que está comentada em português.


## Executando o projeto

Você pode executar o projeto utilizando o Docker. Primeiro acesse o diretório do projeto utilizando o terminal do sistema e depois execute o comando:

```shell
docker compose run --service-ports --rm web bash
```
Após acessar o container, rode o comando `bin/setup` para instalar as gems, criar banco de dados e rodar as migrations. E então, você poderá rodar o comando `rails server -b 0.0.0.0` para conseguir acessar o sistema através da URL.

http://localhost:3000

Lembre-se que se você quiser iniciar o sistema já com alguns dados criados, será necessário rodar as seeds antes de iniciar o servidor.

```shell
rails db:seed
```
