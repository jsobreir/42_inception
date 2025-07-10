FROM debian:bullseye


RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	sendmail \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*


COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY /conf/wp-config.php /tmp/

COPY /tools/script.sh .

RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]