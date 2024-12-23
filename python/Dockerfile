# syntax=docker/dockerfile:1

# Stage 1: Build the application
FROM python:3.11-slim AS build

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Poetry
ENV POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s $POETRY_HOME/bin/poetry /usr/local/bin/poetry

# Prevent Python from writing pyc files and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set up working directory
WORKDIR /app

# Copy pyproject.toml and poetry.lock files for dependency installation
COPY pyproject.toml poetry.lock ./

# Install dependencies to a vendor directory
RUN poetry export -f requirements.txt | python3 -m pip install --no-cache-dir -r /dev/stdin -t vendor

# Copy the application source code
COPY . .

# Stage 2: Create the final image
FROM python:3.11-slim AS final

# Prevent Python from writing pyc files and enable unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app/vendor

# Set up working directory
WORKDIR /app

# Copy the application source code and vendor dependencies from the build stage
COPY --from=build /app /app

# Expose the application port
EXPOSE 5000

# Specify the entrypoint for the container
ENTRYPOINT ["python3", "app/app.py"]
