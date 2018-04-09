# TODO: use alpine:java or something like that
FROM fedora:27

ARG MINECRAFT_VERSION=1.12.2
ENV MINECRAFT_VERSION=$MINECRAFT_VERSION
# TODO: fixed the assumption that curl is installed
RUN yum -y install java-9-openjdk-headless
RUN curl "https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar" -o /root/minecraft_server.jar
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 25565
# TODO: mkdir line is useless
RUN mkdir /data
VOLUME ["/data"]
# TODO: run as user 'minecraft'
ENTRYPOINT ["/entrypoint.sh"]
