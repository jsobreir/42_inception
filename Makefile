all:
	(cd ./srcs/ && docker compose up)

re:
	(cd ./srcs/ && docker compose down -v)
	(cd ./srcs/ && docker compose build)
	(cd ./srcs/ && docker compose up)

no-cache:
	(cd ./srcs/ && docker compose down -v)
	(cd ./srcs/ && docker compose build --no-cache)
	(cd ./srcs/ && docker compose up)

clean:
	(cd ./srcs/ && docker compose down --rmi all -v)
	(cd ./srcs/ && docker system prune -a --volumes)
	(cd ./srcs/ && docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q) --force)

compose-build:
	(cd ./srcs/ && docker compose up --build)

compose-down:
	(cd ./srcs/ && docker compose down)

compose-up:
	(cd ./srcs/ && docker compose up)

image-build-nginx:
	(cd ./srcs/requirements/nginx/ && docker build -t nginx .)

image-build-wordpress:
	(cd ./srcs/requirements/wordpress/ && docker build -t wordpress .)

image-build-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker build -t mariadb .)

image-build-nginx-nocache:
	(cd ./srcs/requirements/nginx/ && docker build -t nginx . --no-cache)

image-build-wordpress-nocache:
	(cd ./srcs/requirements/wordpress/ && docker build -t wordpress . --no-cache)

image-build-mariadb-nocache:
	(cd ./srcs/requirements/mariadb/ && docker build -t mariadb . --no-cache)

image-rm-nginx:
	(cd ./srcs/requirements/nginx/ && docker rmi nginx)

image-rm-wordpress:
	(cd ./srcs/requirements/wordpress/ && docker rmi wordpress)

image-rm-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker rmi mariadb)

image-rm:
	docker image prune

run-nginx:
	(cd ./srcs/requirements/mariadb/ && docker run --name nginx-container nginx)

run-wordpress:
	(cd ./srcs/requirements/mariadb/ && docker run --name wordpress-container wordpress)

run-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker run --name mariadb-container mariadb)

exec-nginx:
	(cd ./srcs/requirements/mariadb/ && docker exec -it nginx-container sh)

exec-wordpress:
	(cd ./srcs/requirements/mariadb/ && docker exec -it wp-php sh)

exec-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker exec -it mariadb sh)
