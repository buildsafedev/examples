ARG BASE_IMAGE=holiodin01/python-pip-base@sha256:38525c97491e20076ceee7935a0487e21d26041b234d98584f8b22e57897ce5c
FROM ${BASE_IMAGE} AS build

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

ENV PYTHONPATH=vendor

WORKDIR /app

# Copy the source code into the container.
COPY . .

# Expose the port that the application listens on.
EXPOSE 5000

# Run the application.
CMD python app/app.py
