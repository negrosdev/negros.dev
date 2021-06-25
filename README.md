![GitHub top language](https://img.shields.io/github/languages/top/negrosdev/negros.dev) ![GitHub](https://img.shields.io/github/license/negrosdev/negros.dev) ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/negrosdev/negros.dev/Negros.dev%20Application%20CI/main) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/negrosdev/negros.dev)

💕 Este é o repositório oficial do negros.dev. 💕

Nosso objetivo é quebrar a barreira de ensino e mostrar para as empresas que as pessoas negras devem ser julgadas pelas suas qualificações técnicas e não pela tonalidade de sua pele.

## Open Source e Free Software

Nosso intuito não é dificultar o aprendizado das pessoas, por isso, queremos deixar claro que o **negros.dev** é uma iniciativa `free software` e `open source`. O que significa que você pode:

- Baixar e estudar o código fonte
- Apresentar o código fonte para seus friends
- Utilizar o código fonte para criar seu próprio site
- Utilizar o negros.dev dentro de sua casa ou empresa

**Apesar de ser um repositório `free software`, não admitimos que os conteúdos sejam vendidos e caso isso seja identificado; poderemos tomar medidas judiciais.**


### Requisito

Antes de tentar instalar o projeto localmente, é necessário que você tenha algumas ferramentas instaladas em seu computador:

- [Ruby](https://www.ruby-lang.org/en/)
- [Bundler](https://bundler.io/)
- [Yarn](https://yarnpkg.com/) 



### Clonando Repositório

Para usar o **negros.dev** localmente, é necessário clonar o repositório antes e para `clonar o repositório` é necessário ter o [Git](https://git-scm.com/) instalado em seu computador. Com o Git instalado, execute em seu terminal:


```shell
$ git clone git@github.com:negrosdev/negros.dev.git
```

### Configuração

Com o repositório baixado, é necessário acessar e instalar as dependências contidas no `Gemfile`. Precisamos configurar todas as `migrações` no `banco de dados`, compilar todos os `assets` da nossa aplicação. Pensando nisso, seria podemos executar um único comando:



```ruby
$ bin/setup
```

**Atenção: O comando acima, requer o [Yarn](https://yarnpkg.com/) instalado.** 


É necessário configurar uma variável de ambiente chamada `RAILS_ADMIN_ROUTE` antes de tentar rodar o projeto, com o terminal aberto; no mesmo lugar que o projeto será rodado, crie a variável:


```shell
$ export RAILS_ADMIN_ROUTE=admin
```

### Rodando 

Para rodar o servidor localmente execute o comando:

```shell
$ bundle exec rails server
```

### Testes

Para rodar os teste você pode executar o comando:

```shell
$ bundle exec rspec
```

### Prints

![Website](https://github.com/negrosdev/negros.dev/blob/main/app/assets/images/website.png)