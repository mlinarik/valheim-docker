FROM ubuntu:latest
ARG PUID=1000
ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "/steamcmd"
RUN set -x \
        && dpkg --add-architecture i386 \
        && apt-get update \
        && apt-get install -y --no-install-recommends --no-install-suggests \
                lib32stdc++6 \
                libgcc1 \
                wget \
                # ca-certificates=20200601~deb10u2 \
                libsdl2-2.0-0:i386 \
                curl \
                locales \
        && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
        && dpkg-reconfigure --frontend=noninteractive locales 

RUN useradd -u "${PUID}" -m "${USER}"
RUN mkdir /app
WORKDIR app
RUN wget --no-check-certificate "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -P ${STEAMCMDDIR}
RUN tar zxvf ${STEAMCMDDIR}/steamcmd_linux.tar.gz
RUN apt-get remove --purge -y \
    wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    mkdir data
COPY config.sh .
RUN chmod +x config.sh
RUN ln -s /usr/games/steamcmd steamcmd
#USER ${USER}
CMD "./config.sh"
