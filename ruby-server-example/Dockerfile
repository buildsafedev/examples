# Ruby Alpine image (after using bsf dockerfile digest)
FROM ruby:3.1-alpine AS build

# Install all required dependencies for Ruby gems
RUN apk add --no-cache build-base libxml2-dev libxslt-dev tzdata

WORKDIR /src

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /src/

# Install the required gems
RUN bundle install

# Copy the rest of the application files to the container
COPY . /src

# Expose the application port
EXPOSE 9898

# Command to run the Ruby application
CMD ["ruby", "main.rb"]
