FROM python:2
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

# from https://github.com/pypa/pipenv/blob/7745e51a63cbd17c7ba9ef9f75ec974f8b5543d1/Dockerfile#L7
ENV PYTHONDONTWRITEBYTECODE 1
RUN pip install -U pip && pip install pipenv
ENTRYPOINT [ "pipenv" ]
