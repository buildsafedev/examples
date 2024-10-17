# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

ARG APP_NAME=rust-todo
ARG BASE_IMAGE=holiodin01/rust-base-dev@sha256:440df27515e7df74bf87d402d1a6b05e89194c589074f7db478042db6fd9f14b
ARG RUNTIME_IMAGE=holiodin01/rust-base-runtime@sha256:358e62768a95e793aee2d019b314967ef22bc48cb0aef878ff98ba6e6a2bdcce
#############################
# Create a stage for building the application.

FROM ${BASE_IMAGE} AS build
# FROM holiodin01/rust-base-dev:v0.1.0 AS build
RUN mkdir -p /tmp
ARG APP_NAME
WORKDIR /app


COPY . .

# Build the application.
RUN cargo build --locked --release && \
cp ./target/release/$APP_NAME /bin/todo

################################################################################
# Create a new stage for running the application that contains the minimal
# runtime dependencies for the application. This often uses a different base
# image from the build stage where the necessary files are copied from the build
# stage.

FROM ${RUNTIME_IMAGE} AS final

# Copy the executable from the "build" stage.
COPY --from=build /bin/todo /bin/


# What the container should run when it is started.
CMD ["/bin/todo"]
