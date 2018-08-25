FROM alpine:latest

ARG MINECRAFT_VERSION=1.13.0
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl screen
RUN curl "https://launcher.mojang.com/mc/game/1.13.1/server/fe123682e9cb30031eae351764f653500b7396c9/server.jar" -o /root/minecraft_server.jar
ARG RAM=2G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
# TODO: mkdir line is useless
RUN mkdir /data
VOLUME ["/data"]
# TODO: run as user 'minecraft'
ENTRYPOINT ["/entrypoint.sh"]
