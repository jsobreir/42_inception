FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY /conf/mariadb.conf /etc/mysql/conf.d/

EXPOSE 3306

RUN chmod +x /tools/server.sh

CMD ["server.sh"]