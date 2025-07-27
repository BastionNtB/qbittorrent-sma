# qbittorrent-sma
Docker image based on [hotio/qbittorrent](https://hotio.dev/containers/qbittorrent/) that includes all FFMPEG and python requirements to run [sickbeard mp4 automator (SMA)](https://github.com/mdhiggins/sickbeard_mp4_automator) with qBittorrent.

## Sickbeard MP4 Automator Setup

> [!NOTE]
> The steps below assume that you have imported the image and have a running container

1. Make sure you have a volume mapped to `/usr/local/sma/config`
2. Create a new file within that volume called autoProcess.ini
3. Copy the [autoProcess.ini.sample](https://github.com/mdhiggins/sickbeard_mp4_automator/blob/master/setup/autoProcess.ini.sample) from the SMA repo into the file created in the last step
4. Set the `ffmpeg` and `ffprobe` under `[Converter]` as follows:
```ini
[Converter]
ffmpeg = ffmpeg
ffprobe = ffprobe
```
5. Setup the settings for qBittorrent under `[qBittorrent]`

## qBittorrent Setup

Follow the [steps for qBittorrent](https://github.com/mdhiggins/sickbeard_mp4_automator?tab=readme-ov-file#qbittorrent-setup) given in the SMA repo README

The path you need to define for `qBittorrentPostProcess.py` is as follows: 
```
/usr/local/sma/venv/bin/python /usr/local/sma/qBittorrentPostProcess.py "%L" "%T" "%R" "%F" "%N" "%I"
```
