FROM debian:bullseye

EXPOSE 9000

RUN apt-get update && \
    apt-get install -y php-fpm \
    php-mysqli \
    curl && \
    # Disable the default php-fpm service from starting automatically
    # This prevents it from binding to port 9000 before your script runs
    systemctl disable php7.4-fpm || true && \
    rm -rf /var/lib/apt/lists/*

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY /conf/wp-config.php /tmp/

COPY /tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh", "php-fpm7.4", "-F"]