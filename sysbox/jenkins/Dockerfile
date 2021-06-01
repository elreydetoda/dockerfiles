# based on https://www.jenkins.io/doc/book/installing/docker/#on-macos-and-linux
# and https://github.com/nestybox/dockerfiles/blob/9d74469c31c2d1fa8cc9f1cbf3ed69c41c7c5bf1/jenkins-syscont/Dockerfile
FROM jenkins/jenkins:lts-slim

RUN jenkins-plugin-cli --plugins "configuration-as-code"

USER root
RUN apt-get update && apt-get install -y apt-transport-https \
  ca-certificates curl gnupg2 \
  software-properties-common \
  && rm -rf /var/lib/apt/lists/*

# adding docker stuff
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y --no-install-recommends \
  docker-ce docker-ce-cli containerd.io \
  && rm -rf /var/lib/apt/lists/*

# installing docker-compose
RUN curl -fsSL 'https://git.io/Jmr0O' | bash -x -- \
  && rm -rf /var/lib/apt/lists/*

#
# supervisord
#
RUN apt-get update && apt-get install --no-install-recommends -y supervisor \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#
# Entrypoint
#
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
