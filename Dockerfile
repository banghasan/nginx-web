ARG NGINX_VERSION=1.28.0
# Menggunakan base image yang ditentukan
FROM ghcr.io/11notes/nginx:${NGINX_VERSION}

# Menyalin file konfigurasi nginx kustom
COPY default.conf /nginx/etc/default.conf
COPY ping.conf /nginx/etc/ping.conf
