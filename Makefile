AUTHOR=belooussov
NAME=minecraft
VERSION=1.12.2
MINECRAFTPORT=25565

build:
	docker build --no-cache=true -t $(AUTHOR)/$(NAME):$(VERSION) .

stop:
	docker stop -t 0 minecraft

clean:
	docker rm -f minecraft

cleanrestart: clean start

data:
	docker volume create data-minecraft

start:
	docker run -d --name=minecraft -h minecraft -m 8G -e MINECRAFT_VERSION=$(VERSION) --mount=type=volume,source=data-minecraft,destination=/data -p $(MINECRAFTPORT):$(MINECRAFTPORT) $(AUTHOR)/$(NAME):$(VERSION)

bash:
	docker exec -ti minecraft /bin/bash

run: start
