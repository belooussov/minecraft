FROM alpine:latest

ARG MINECRAFT_VERSION=1.14.4
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl screen
RUN curl "https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar" -o /root/minecraft_server.jar
ARG RAM=8G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/entrypoint.sh"]
