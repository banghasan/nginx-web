# Nginx Web Server Image

This repository provides a custom, multi-platform Docker image for a pre-configured Nginx web server. The image is based on `11notes/nginx:1.28.0` and includes a default server configuration suitable for serving static websites and single-page applications.

The image is available on GitHub Container Registry: `ghcr.io/banghasan/nginx-web:latest`

## Features

- Based on the lean `11notes/nginx` image.
- Multi-platform support (linux/amd64, linux/arm64).
- Pre-configured to serve static files from `/nginx/var/html`.
- Easy to use and customize via volume mounts.

## Usage

You can use this image with Docker Compose to quickly spin up an Nginx container. Here is an example `docker-compose.yml`:

```yaml
services:
  nginx-web:
    image: "ghcr.io/banghasan/nginx-web:latest"
    container_name: nginx-web
    restart: unless-stopped
    environment:
      TZ: "Asia/Jakarta" # Adjust to your timezone
    ports:
      - "8000:80"
    volumes:
      - "/path/to/your/website:/nginx/var/html"
```

**Explanation:**

- `image`: Specifies the custom Nginx image.
- `environment`: Sets the timezone for the container.
- `ports`: Maps port 8000 on the host to port 80 in the container.
- `volumes`: Mounts your local website directory (e.g., `/path/to/your/website`) to the document root inside the container (`/nginx/var/html`). Place your `index.html` and other static files in this directory.

Simply replace `/path/to/your/website` with the actual path to your web files and run `docker-compose up -d`.
