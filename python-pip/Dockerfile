# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM debian:bullseye-slim AS build

# Install Python and pip dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Prevent Python from writing pyc files and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set up working directory
WORKDIR /app

# Copy dependency file(s) and install them into the vendor directory
COPY requirements.txt .
RUN mkdir -p vendor && \
    python3 -m pip install --no-cache-dir -r requirements.txt -t vendor

# Copy the application source code
COPY . .

# Stage 2: Create the final image
FROM debian:bullseye-slim AS final

# Install Python runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Prevent Python from writing pyc files and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=vendor

# Set up working directory
WORKDIR /app

# Copy the application source code and vendor dependencies from the build stage
COPY --from=build /app /app

# Expose the application port
EXPOSE 5000

# Specify the entrypoint for the container
ENTRYPOINT ["python3", "app/app.py"]
