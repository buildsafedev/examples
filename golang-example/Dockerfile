FROM ttl.sh/buildsafedev/go-base-dev@sha256:6829c6b65889c428c906fe9ec6676771de4d28b9c7807ed882bea12876b97900 AS build

WORKDIR /src

# Copy the source code into the container
COPY . .
RUN mkdir -p /tmp

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/server .

# Stage 2: Create the final image
FROM ttl.sh/buildsafedev/go-base-runtime@sha256:102163ae5fe7696f29bfc3ee9e5ba15f2639ac0edf3219a5fc04dae8098a050f AS final

WORKDIR /app

# Copy the executable from the build stage and ensure it has the correct permissions
COPY --from=build /bin/server /app/server

# Copy the static files
COPY static/index.html /app/static/index.html

# Expose the port that the application listens on
EXPOSE 8080

# Specify the entrypoint for the container
ENTRYPOINT ["/app/server"]
