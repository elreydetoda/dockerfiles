FROM python:3-slim
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

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
