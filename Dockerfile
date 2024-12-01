FROM linuxserver/qbittorrent

ENV SMA_PATH /usr/local/sma

# Install python3, ffmpeg, git, and install required python libraries
RUN \
    apk update && \
    apk add --no-cache \
    ffmpeg \
    git \
    wget \
    python3 \
    py3-pip \
    py3-virtualenv && \
    # make directory
    mkdir ${SMA_PATH} && \
    # download sickbeard mp4 automator repo
    git config --global --add safe.directory ${SMA_PATH} && \
    git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git ${SMA_PATH} && \
    # install pip, venv, and set up a virtual self contained python environment
    python3 -m virtualenv ${SMA_PATH}/venv && \
    ${SMA_PATH}/venv/bin/pip install -r ${SMA_PATH}/setup/requirements.txt && \
    ${SMA_PATH}/venv/bin/pip install -r ${SMA_PATH}/setup/requirements-qbittorrent.txt && \
    # cleanup
    apk del --purge && \
    rm -rf \
    /root/.cache \
    /tmp/*

VOLUME /usr/local/sma/config