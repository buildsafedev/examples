# syntax=docker/dockerfile:1

ARG BASE_IMAGE=holiodin01/go-base-dev@sha256:1db4455e49d70f1fe1b5564ab57227ea7b2b499ad7d23cf7a9fc0d222502a010
ARG RUNTIME_IMAGE=holiodin01/go-base-runtime@sha256:ac6c10434184f1f1bdf6a1d22427da18ccfd998e8363962aa101a86b0387de5d

# Stage 1: Build the application
FROM ${BASE_IMAGE} AS build
# FROM holiodin01/go-base-dev:v0.1.0 AS build

WORKDIR /src

# Copy the source code into the container
COPY . .
RUN mkdir -p /tmp

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o /bin/server .

# Stage 2: Create the final image
FROM ${RUNTIME_IMAGE} AS final
# FROM holiodin01/go-base-runtime:v0.1.0 AS final

WORKDIR /app

# Copy the executable from the build stage and ensure it has the correct permissions
COPY --from=build /bin/server /app/server

# Copy the static files
COPY static/index.html /app/static/index.html

# Expose the port that the application listens on
EXPOSE 8080

# Specify the entrypoint for the container
ENTRYPOINT ["/app/server"]
