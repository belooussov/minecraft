AUTHOR=belooussov
NAME=minecraft
MINECRAFT_VERSION=1.16.4
MINECRAFTPORT=25565
MAXIMUM_MEMORY=8G
ARCH=`uname -m`

build:
	docker build --no-cache=true --build-arg=MINECRAFT_VERSION=$(MINECRAFT_VERSION) -t $(AUTHOR)/$(NAME):$(MINECRAFT_VERSION).$(ARCH) .

stop:
	docker stop -t 0 minecraft

clean:
	docker rm -f minecraft

cleanrestart: clean start

data:
	docker volume create data-minecraft

start:
	docker run -d -m ${MAXIMUM_MEMORY} -e RAM=${MAXIMUM_MEMORY} --mount=type=volume,source=data-minecraft,destination=/data -p $(MINECRAFTPORT):$(MINECRAFTPORT) $(AUTHOR)/$(NAME):$(MINECRAFT_VERSION).$(ARCH)

sh:
	docker exec -ti minecraft /bin/sh

attach:
	docker exec -ti minecraft screen -r

run: start

service:
	docker service create \
	--name minecraft \
	--hostname minecraft \
	--limit-memory 8589934592 \
	--env RAM=$(MAXIMUM_MEMORY) \
	--mode global \
	--mount=type=volume,source=data-minecraft,destination=/data \
	--restart-condition on-failure \
	-p 25565:25565 \
	belooussov/minecraft:$(MINECRAFT_VERSION).$(ARCH)

pull:
	docker pull belooussov/minecraft:$(MINECRAFT_VERSION).$(ARCH)

push:
	docker push belooussov/minecraft:$(MINECRAFT_VERSION).$(ARCH)

backup:
	tar czvf ~/backup.minecraft.data.volume.tgz /var/lib/docker/volumes/data-minecraft
