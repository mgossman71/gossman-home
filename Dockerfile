# Static homepage served by nginx.
# The site is a single self-contained index.html, so no build step is needed.
FROM nginx:alpine

# Copy the site into nginx's default web root.
COPY index.html /usr/share/nginx/html/index.html

# A tiny custom config: sensible caching + correct content-type + gzip.
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
