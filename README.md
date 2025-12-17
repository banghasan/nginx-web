# Nginx Web Server Image

This repository provides a custom, multi-platform Docker image for a pre-configured Nginx web server. The image is based on `11notes/nginx:1.28.0` and includes a default server configuration suitable for serving static websites and single-page applications.

The image is available on GitHub Container Registry: `ghcr.io/banghasan/nginx-web`

## Features

- Based on the lean `11notes/nginx` image.
- Multi-platform support (linux/amd64, linux/arm64, linux/arm/v7).
- Pre-configured to serve static files from `/nginx/var/html`.
- Easy to use and customize via volume mounts.
- Provides two variants: a minimal image and a `full` image with more tools.


# COMPARISON
Below you find a comparison between this image and the most used or original one.

| **image** | **size on disk** | **init default as** | **distroless** | supported architectures
| ---: | ---: | :---: | :---: | :---: |
| nginx-web | 4.12MB | 1000:1000 | ✅ | amd64, arm64, armv7 |
| nginx:1.29.4-alpine | 78.24MB | 0:0 | ❌ | 386, amd64, arm64v8, armv5, armv7, mips64le, ppc64le, s390x |
| nginx | 217MB | 0:0 | ❌ | 386, amd64, arm64v8, armv5, armv7, mips64le, ppc64le, s390x |

## Variants

This image comes in two variants, available via different tags. 

#### Standard Variant
- **Tags:** `:latest`, `:[version]`
- **Base Image:** `11notes/nginx` (lite version)
- **Description:** This is the standard, minimal image suitable for most use cases.

#### Full Variant
- **Tags:** `:full-latest`, `:full-[version]`
- **Base Image:** `ghcr.io/11notes/nginx:full-1.28.0`
- **Description:** This variant includes additional tools and modules available in the `full` version of the base image, which can be useful for debugging or more complex setups.

## Usage

You can use this image with Docker Compose to quickly spin up an Nginx container.

### Standard Variant Example

Here is an example `docker-compose.yml` for the standard variant:
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

### Full Variant Example

To use the `full` variant with more built-in tools:
```yaml
services:
  nginx-web-full:
    image: "ghcr.io/banghasan/nginx-web:full-latest"
    container_name: nginx-web-full
    restart: unless-stopped
    environment:
      TZ: "Asia/Jakarta" # Adjust to your timezone
    ports:
      - "8001:80" # Using a different host port to avoid conflicts
    volumes:
      - "/path/to/your/website:/nginx/var/html"
```

**Note:** In both examples, replace `/path/to/your/website` with the actual path to your web files and run `docker-compose up -d`.
