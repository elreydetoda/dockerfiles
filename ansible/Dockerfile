FROM docker.io/python:3.9.5
LABEL maintainer="Alex (elrey741)<dockerfile-social-contact@elrey741.mozmail.com>"

RUN set -eux \
      && apt-get update \
      && apt-get install -y \
          bash \
          curl \
          tar \
          openssh-client \
          sshpass \
          git \
          rsync \
      && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --no-compile ansible

ENV ANSIBLE_HOST_KEY_CHECKING false

ENTRYPOINT [ "ansible" ]
