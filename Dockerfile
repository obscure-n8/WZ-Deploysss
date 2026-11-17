FROM mysterysd/wzmlx:wzadv

RUN apt-get update && apt-get install -y aria2 qbittorrent-nox ffmpeg rclone && \
    mv /usr/bin/aria2c /usr/bin/blitzfetcher && \
    mv /usr/bin/qbittorrent-nox /usr/bin/stormtorrent && \
    mv /usr/bin/ffmpeg /usr/bin/mediaforge && \
    mv /usr/bin/rclone /usr/bin/ghostdrive && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["bash", "start.sh"]
