FROM alpine:latest

ARG MINECRAFT_VERSION=1.12.2
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
RUN apk update
RUN apk add openjdk8 curl
RUN curl "https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar" -o /root/minecraft_server.jar
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
