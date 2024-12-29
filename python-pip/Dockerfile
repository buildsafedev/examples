FROM ttl.sh/buildsafedev/python-pip-final-amd64:v1@sha256:10f74bb1f33eb7eeb295d5273d63f7c27d64c3f60b543d184d4ff3412338f413

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