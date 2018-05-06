AUTHOR=belooussov
NAME=minecraft
MINECRAFT_VERSION=1.12.2
MINECRAFTPORT=25565

build:
	docker build --no-cache=true --build-arg=MINECRAFT_VERSION=$(MINECRAFT_VERSION) -t $(AUTHOR)/$(NAME):$(MINECRAFT_VERSION) .

stop:
	docker stop -t 0 minecraft

clean:
	docker rm -f minecraft

cleanrestart: clean start

data:
	docker volume create data-minecraft

start:
	docker run -d --name=minecraft -h minecraft -m 8G -e RAM=8G --mount=type=volume,source=data-minecraft,destination=/data -p $(MINECRAFTPORT):$(MINECRAFTPORT) $(AUTHOR)/$(NAME):$(MINECRAFT_VERSION)

sh:
	docker exec -ti minecraft /bin/sh

attach:
	docker exec -ti minecraft screen -r

run: start

service:
	docker service create --name minecraft --hostname minecraft --limit-memory 8589934592 --env RAM=8G --mode global --mount=type=volume,source=data-minecraft,destination=/data --restart-condition on-failure -p 25565:25565 belooussov/minecraft:1.12.2
