FROM alpine:latest

ARG MINECRAFT_VERSION=1.14
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl screen
RUN curl "https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar" -o /root/minecraft_server.jar
ARG RAM=2G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/entrypoint.sh"]
