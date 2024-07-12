# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

################################################################################
# Create a stage for building the application.
FROM ttl.sh/go-base:dev-5h@sha256:74bc47b1f9efc4c2d0ea20cf092c7b2d0d2b5a71713c1cb7addb24e173f10993 AS build
WORKDIR /src

COPY . /src

RUN mkdir -p /tmp
# Build the application.
# source code into the container.
RUN CGO_ENABLED=0 go build -o /bin/server .

################################################################################
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the build stage where the necessary files are copied from the build
# stage.
#
FROM ttl.sh/go-base:5h@sha256:c5343ac7f8bc74420ed919f00711f9a0c3f94f841938ad43838b938432a1f433 AS final


# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001

# Copy the executable from the "build" stage.
COPY --from=build /bin/server /bin/

# Expose the port that the application listens on.
EXPOSE 8080

# What the container should run when it is started.
ENTRYPOINT [ "/bin/server" ]
