FROM python:2-alpine
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

RUN set -eux \
	  && apk --update --no-cache add --virtual build-dependencies  \
		  gcc \
		  musl-dev

# from https://github.com/pypa/pipenv/blob/7745e51a63cbd17c7ba9ef9f75ec974f8b5543d1/Dockerfile#L7
ENV PYTHONDONTWRITEBYTECODE 1

RUN pip install -U --no-cache-dir --no-compile pip \
      && pip install --no-cache-dir --no-compile pipenv

ENTRYPOINT [ "pipenv" ]
