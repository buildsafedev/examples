# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM rust:1.72.1-slim AS build

# Set working directory
WORKDIR /app

# Install necessary build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the source code and dependencies files into the container
COPY Cargo.toml Cargo.lock ./
COPY src ./src

# Ensure the output folder exists
RUN mkdir -p output-folder

# Build the application
RUN cargo build --locked --release && \
    cp ./target/release/rust-todo /bin/todo

# Stage 2: Create the runtime image
FROM debian:bullseye-slim AS runtime

# Set working directory
WORKDIR /app

# Install required runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl-dev \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the built executable from the build stage
COPY --from=build /bin/todo /bin/

# Optionally copy static files or other resources
COPY output-folder ./output-folder

# Command to run the application
CMD ["/bin/todo"]
