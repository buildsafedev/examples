# syntax=docker/dockerfile:1

ARG BASE_IMAGE=holiodin01/go-base-dev:v0.1.0
ARG RUNTIME_IMAGE=holiodin01/go-base-runtime:v0.1.0

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
