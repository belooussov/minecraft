# minecraft

Minecraft server in a docker container, with persistent data volume.

Heavily inspired by [Daniel Limire](https://lemire.me/blog/2016/04/02/setting-up-a-robust-minecraft-server-on-a-raspberry-pi/)
and [overshard](https://github.com/overshard/docker-minecraft).

Dedicated to my children, Katja and Boris.

## Running it

First, create the data volume for persistent data:

```
docker volume create data-minecraft
```

Then, start the docker container:

```
docker run -d --mount=type=volume,source=data-minecraft,destination=/data \
  -p 25565:25565 belooussov/minecraft:1.12.2
```

By default the container will use 2GB of RAM,
but you can extend it (to *8G* for example):

```
docker run -d -m 8G -e RAM=8G \
  --mount=type=volume,source=data-minecraft,destination=/data \
  -p 25565:25565 belooussov/minecraft:1.12.2
```
