# nzbget-sma
NZBGet container including dependencies for sickbeard_mp4_automator

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=nzbget \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Americas/Chicago \
  -p 6789:6789 \
  -v <path to data>:/config \
  -v <path/to/downloads>:/downloads \
  -v <path/to/sma>:/sma \
  --restart unless-stopped \
  linuxserver/nzbget
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  nzbget:
    image: linuxserver/nzbget
    container_name: nzbget
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Americas/Chicago
    volumes:
      - <path to data>:/config
      - <path/to/downloads>:/downloads
      - <path/to/sma>:/sma
    ports:
      - 6789:6789
    restart: unless-stopped
```
NZBGet Setup
--------------
1. Configure NZBGETPOSTPROCESS
    - Access NZBGet's WebUI
        - Default `localhost:6789`
    - Go to `Settings`
    - Select `NZBGETPOSTPROCESS` option at the bottom of the left hand navigation panel and configure the options
        - `MP4_FOLDER` - set to `/sma/` - Location of the script. Use full path with trailing backslash.
        - `SHOULDCONVERT` - `True`/`False` - Convert file before passing to destination
        - `CP_CAT` - default `couchpotato` - category of downloads that will be passed to CouchPotato
        - `SONARR_CAT` - default `sonarr` - category of downloads that will be passed to Sonarr
        - `SICKBEARD_CAT` - default `sickbeard` - category of downloads that will be passed to Sickbeard
        - `SICKRAGE_CAT` - default `sickrage` - category of downloads that will be passed to Sickrage
        - `BYPASS_CAT` - default `bypass` - category of downloads that may be converted but won't be passed on further
    - Save changes
    - Reload NZBGet
4. When assigning categories in NZBGet and your chosen media manager, ensure they match the label settings specified here so that file will be passed back to the appropriate location.
    - In the relevant category set `PostScript` to NZBGetPostProcess.py to ensure SMA is called.
