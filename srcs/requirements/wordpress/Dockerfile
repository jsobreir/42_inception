FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y php-fpm \
    php-mysqli \
    curl && \
    rm -rf /var/lib/apt/lists/*

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY /conf/wp-config.php /tmp/

COPY /tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]