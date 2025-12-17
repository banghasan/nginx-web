FROM ghcr.io/11notes/nginx@sha256:8792063bad7783c52b126cd951920d435cac7956ff72a55e373eb66822ecc977

COPY default.conf /nginx/etc/default.conf
COPY ping.conf /nginx/etc/ping.conf
