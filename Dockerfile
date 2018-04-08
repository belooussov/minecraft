# TODO: use alpine:java or something like that
FROM fedora:27

# TODO: fixed the assumption that curl is installed
RUN yum -y install java-9-openjdk-headless
COPY artifacts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# TODO: add buildarg
ENV MINECRAFT_VERSION 1.12.2
EXPOSE 25565
# TODO: mkdir line is useless
RUN mkdir /data
VOLUME ["/data"]
# TODO: run as user 'minecraft'
ENTRYPOINT ["/entrypoint.sh"]
