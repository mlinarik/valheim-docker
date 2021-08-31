# valheim-docker

Github: https://github.com/mlinarik/valheim-docker
DockerHub: https://hub.docker.com/repository/docker/mlinarik/valheim

This is meant to be a very quick and easy Valheim server.

Requirements: Two storage locations, one for each of the file stores that Valheim uses. Note that the dockerfile does not call out the volumes, as it is important to know where your data is--mainly for the newbies.


Example:

docker run -d --name valheim \
    -v "/LOCAL_STORE/steamcmd:/home/steam/steamcmd/valheim" \
    -v "/LOCAL_STORE/config:/home/steam/.config/unity3d/IronGate/Valheim" \
    -p 2456:2456/tcp \
    -p 2457:2457/tcp \
    -p 2458:2458/tcp \
    -p 2456:2456/udp \
    -p 2457:2457/udp \
    -p 2458:2458/udp \
    mlinarik/valheim:TAG
    
