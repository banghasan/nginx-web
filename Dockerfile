# Menggunakan base image yang ditentukan
FROM ghcr.io/11notes/nginx:1.28.0

# Menyalin file konfigurasi nginx kustom
COPY default.conf /nginx/etc/default.conf
