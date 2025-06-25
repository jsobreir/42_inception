FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \\
    apt-get install -y wordpress && \\
    rm -rf /var/lib/apt/lists/*

COPY /conf/wordpress.cnf /etc/wordpress/conf.d/

CMD []