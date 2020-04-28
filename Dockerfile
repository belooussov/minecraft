FROM alpine:latest

ARG MINECRAFT_VERSION=1.15.2
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl screen
RUN curl -o /root/minecraft_server.jar https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
ARG RAM=8G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/entrypoint.sh"]
