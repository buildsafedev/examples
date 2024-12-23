# syntax=docker/dockerfile:1

# Define build and runtime image as arguments
ARG BUILD_IMAGE
ARG RUNTIME_IMAGE
ARG APP_NAME=rust-todo

#############################
# Stage 1: Build the application

FROM ${BUILD_IMAGE} AS build

RUN mkdir -p /tmp
ARG APP_NAME
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the application
RUN cargo build --locked --release && \
    cp ./target/release/$APP_NAME /bin/todo

################################################################################
# Stage 2: Create the final image (runtime stage)

FROM ${RUNTIME_IMAGE} AS final

# Copy the executable from the build stage
COPY --from=build /bin/todo /bin/

# Specify the command to run the application
CMD ["/bin/todo"]
