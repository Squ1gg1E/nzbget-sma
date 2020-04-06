FROM linuxserver/nzbget

RUN apk update && \
    apk add --no-cache \
      ffmpeg \
      py-pip \
      git && \
#Install SMA required python module dependencies
    pip install \
      requests \
      requests[security] \
      requests-cache \
      babelfish \
      tmdbsimple \
      mutagen \
      guessit \
      subliminal \
      python-dateutil \
      stevedore \
      qtfaststart && \
    pip3 install \
      requests \
      requests[security] \
      requests-cache \
      babelfish \
      tmdbsimple \
      mutagen \
      guessit \
      subliminal \
      python-dateutil \
      stevedore \
      qtfaststart && \
#Download SMA
    git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /tmp/sma && \
#Make scripts direcotry & copy NZBGetPostProcess.py to app directory
    mkdir /app/nzbget/scripts && \
    cp /tmp/sma/NZBGetPostProcess.py /app/nzbget/scripts && \
#Clean up /tmp
    rm -rf /tmp/*
