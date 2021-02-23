FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends jython && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y curl && \
      cd /usr/share/jython/ || exit 2 && \
      curl -o jython.jar -fsS "$(curl -fsS 'https://www.jython.org/download' | grep -oP 'https://.*jython-standalone/[\d\.]+/.*\.jar')" && \
      java --illegal-access=deny -jar ./jython.jar -m ensurepip && rm jython.jar && cd / && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "jython" ]
