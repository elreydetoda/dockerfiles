FROM python:3-alpine
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

RUN set -eux \
	&& apk --update --no-cache add \
    --virtual build-dependencies  \
		gcc \
		libffi-dev \
		musl-dev \
		openssl-dev

RUN pip install --no-cache-dir --no-compile ansible

ENV ANSIBLE_HOST_KEY_CHECKING false

ENTRYPOINT [ "ansible" ]
