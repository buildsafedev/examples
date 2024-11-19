FROM ttl.sh/ruby-base:dev AS build

WORKDIR /src

COPY . .

RUN apk add --no-cache build-base libxml2-dev libxslt-dev tzdata.

FROM ttl.sh/ruby-base:runtime AS final

WORKDIR /src

COPY Gemfile Gemfile.lock /src/

COPY . /src

EXPOSE 9898

CMD ["ruby", "main.rb"]