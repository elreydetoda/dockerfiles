FROM python:3
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

RUN set -eux \
	  && apt update \
		  gcc \
		  libffi-dev \
		  musl-dev \
		  openssl-dev \bash \
      curl \
      tar \
      openssh-client \
      sshpass \
      git \
      rsync

RUN pip install --no-cache-dir --no-compile ansible

ENV ANSIBLE_HOST_KEY_CHECKING false

ENTRYPOINT [ "ansible" ]
