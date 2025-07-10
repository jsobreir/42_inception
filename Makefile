all:
	(docker compose -f ./srcs/docker-compose.yml up)

re:
	(docker compose -f ./srcs/docker-compose.yml down -v)
	(docker compose -f ./srcs/docker-compose.yml build)
	(docker compose -f ./srcs/docker-compose.yml up)

no-cache:
	(docker compose -f ./srcs/docker-compose.yml down -v)
	(docker compose -f ./srcs/docker-compose.yml build --no-cache)
	(docker compose -f ./srcs/docker-compose.yml up)

clean:
	(docker compose -f ./srcs/docker-compose.yml down --rmi all -v)
	(docker system prune -a --volumes)
	(docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q) --force)

compose-build:
	(docker compose -f ./srcs/docker-compose.yml up --build)

compose-down:
	(docker compose -f ./srcs/docker-compose.yml down)

compose-up:
	(docker compose -f ./srcs/docker-compose.yml up)

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
	(cd ./srcs/requirements/mariadb/ && docker run --name wp-php wordpress)

run-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker run --name mariadb-container mariadb)

exec-nginx:
	(cd ./srcs/requirements/mariadb/ && docker exec -it nginx-container sh)

exec-wordpress:
	(cd ./srcs/requirements/mariadb/ && docker exec -it wp-php sh)

exec-mariadb:
	(cd ./srcs/requirements/mariadb/ && docker exec -it mariadb sh)
