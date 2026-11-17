FROM mysterysd/wzmlx:wzadv

RUN apt-get update && apt-get install -y --reinstall aria2 && \
    apt-get install -y qbittorrent-nox ffmpeg rclone && \
    mv /usr/bin/aria2c /usr/bin/blitzfetcher && \
    mv /usr/bin/qbittorrent-nox /usr/bin/stormtorrent && \
    mv /usr/bin/ffmpeg /usr/bin/mediaforge && \
    mv /usr/bin/rclone /usr/bin/ghostdrive && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN find bot/ -type f -name "*.py" -exec sed -i 's/quote=True,//g; s/quote=True//g; s/disable_web_page_preview=True,//g; s/disable_web_page_preview=True//g' {} +

ENTRYPOINT ["bash", "start.sh"]
