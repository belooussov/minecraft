FROM alpine:latest

ARG MINECRAFT_VERSION=1.16.4
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk --no-cache add openjdk8 curl screen
RUN curl -o /root/minecraft_server.jar https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar
ARG RAM=8G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT ["/entrypoint.sh"]
