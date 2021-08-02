#!/bin/bash

FILEV=/home/steam/steamcmd/valheim/start_server.sh
if [ -f "$FILEV" ]; then
    cp /home/steam/steamcmd/valheim/start_server.sh /tmp/start_server.sh
    echo "LOG: Copied "
fi

echo "LOG: Copy Done"

cd /home/steam/steamcmd

echo "LOG: Start App_Update "

./steamcmd.sh +login anonymous +force_install_dir valheim +app_update 896660 validate +quit

echo "LOG: Done"

FILET=/tmp/start_server.sh
if [ -f "$FILET" ]; then
    mv /tmp/start_server.sh /home/steam/steamcmd/valheim/start_server.sh
    echo "LOG: Moved " $FILET
fi

echo "LOG: Move Done"

echo "Start Server"

cd /home/steam/steamcmd/valheim

./start_server.sh
