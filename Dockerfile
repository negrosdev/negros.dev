FROM ruby:3.0.0

WORKDIR /app

COPY Gemfile* .

RUN apt-get update -qq

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN wget -q -O- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

COPY . .

# install al depencies and configure database for receive seeds
RUN bundle install
RUN bundle exec rake webpacker:install

