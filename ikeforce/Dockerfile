FROM elrey741/python2-pipenv:latest
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

# pre-reqs
RUN apt-get update && apt-get install -y git && \
  git clone https://github.com/elreydetoda/ikeforce.git ikeforce

WORKDIR /ikeforce

RUN pipenv --bare install --deploy --skip-lock --system

ENTRYPOINT [ "./ikeforce.py" ]
