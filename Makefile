all: 
	docker-compose -f srcs/docker-compose.yml up --build

start:
	docker-compose -f srcs/docker-compose.yml up

stop:
	docker-compose -f srcs/docker-compose.yml stop

restart: stop start

build:
	docker-compose -f srcs/docker-compose.yml build

clean: stop
	docker system prune -af
	@echo "\n"
	docker image prune -af
	@echo "\n"
	docker volume prune -f
	@echo "\n"
	docker network prune -f
	@echo "\n"
	docker volume rm srcs_db srcs_wordpress

re: stop clean build start

status:
	docker ps
	@echo "\n"
	docker images
	@echo "\n"
	docker volume ls
	@echo "\n"
	docker network ls

.PHONY: all start stop restart build clean re status

