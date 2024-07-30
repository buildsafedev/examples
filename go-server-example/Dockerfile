# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM ttl.sh/baseimage-go:dev-v1 AS build

WORKDIR /src

# Copy the source code into the container
COPY . .
RUN mkdir -p /tmp

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o /bin/server .

# Stage 2: Create the final image
FROM ttl.sh/baseimage-go:prod-v1 AS final

WORKDIR /app

# Copy the executable from the build stage and ensure it has the correct permissions
COPY --from=build /bin/server /app/server

# Copy the static files
COPY static/index.html /app/static/index.html

# Expose the port that the application listens on
EXPOSE 8080

# Specify the entrypoint for the container
ENTRYPOINT ["/app/server"]
