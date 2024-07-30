# syntax=docker/dockerfile:1

# Create a stage for building the application.
FROM ttl.sh/baseimage-go:dev-v1 AS build
WORKDIR /src

COPY . /src

RUN mkdir -p /tmp
# Build the application.
# source code into the container.
RUN CGO_ENABLED=0 go build -mod=vendor -o /bin/server .


FROM ttl.sh/baseimage-go:prod-v1 AS final

# Copy the executable from the "build" stage.
COPY --from=build /bin/server /bin/

# Expose the port that the application listens on.
EXPOSE 8080

# What the container should run when it is started.
ENTRYPOINT [ "/bin/server" ]
