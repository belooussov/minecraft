#!/bin/sh

# set the data_dir variable
data_dir=/data

# accept license if hasn't been accepted yet
if [ ! -f $data_dir/eula.txt ]
then
    echo "eula=true" > $data_dir/eula.txt
fi

# symlink jar to the one inside the container
ln -sf /root/minecraft_server.jar $data_dir/minecraft_server.jar

# launch minecraft
cd $data_dir/; java -Xmx8G -jar minecraft_server.jar nogui
