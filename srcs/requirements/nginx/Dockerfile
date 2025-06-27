FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*


COPY /conf/default /etc/nginx/sites-available/.

EXPOSE 443


CMD	["nginx", "-g", "daemon off;"]