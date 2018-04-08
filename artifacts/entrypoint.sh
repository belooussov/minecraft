#!/bin/bash

# set the data_dir variable
data_dir=/data

# download the jar if doesn't exist
if [ ! -f $data_dir/minecraft_server.jar ]
then
    curl -s "https://s3.amazonaws.com/Minecraft.Download/versions/$MINECRAFT_VERSION/minecraft_server.$MINECRAFT_VERSION.jar" -o $data_dir/minecraft_server.jar
fi

# accept license if hasn't been accepted yet
if [ ! -f $data_dir/eula.txt ]
then
    echo "eula=true" > $data_dir/eula.txt
fi

# launch minecraft
cd $data_dir/; java -Xmx8G -jar minecraft_server.jar nogui
