FROM python:2
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

RUN set -ex && git clone https://github.com/JPaulMora/Pyrit
WORKDIR /Pyrit
RUN pip install --no-cache-dir --no-compile psycopg2 scapy
RUN set -ex && apt-get update && apt-get install -y libpcap-dev \
      && rm -rf /var/lib/apt/lists/*
RUN python setup.py install
ENTRYPOINT ["/usr/local/bin/pyrit"]

