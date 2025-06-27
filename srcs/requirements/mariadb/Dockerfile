FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY /tools/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

# EXPOSE 3306


COPY /tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]