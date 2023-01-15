# start docker server

start:
	docker run -d -it -p 25565:25565 -e EULA=TRUE -v /root/data:/data itzg/minecraft-server
