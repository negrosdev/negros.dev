FROM ruby:2.7.2

WORKDIR /app


RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq 
RUN apt-get install -y \ 
    build-essential\
    nodejs\
    yarn

ADD Gemfile* ./
RUN bundle install --without test

COPY . .

RUN yarn install --check-files

RUN bundle exec rake secret

ENV port 3000

ENV RAILS_ENV production

CMD rails server -b 0.0.0.0 -p ${port}