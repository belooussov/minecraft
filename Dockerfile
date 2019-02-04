FROM alpine:latest

ARG MINECRAFT_VERSION=1.13.2
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl screen
RUN curl "https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar" -o /root/minecraft_server.jar
ARG RAM=2G
ENV RAM=$RAM
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
VOLUME ["/data"]
ENTRYPOINT ["/entrypoint.sh"]
