# based on https://www.jenkins.io/doc/book/installing/docker/#on-macos-and-linux
FROM jenkins/jenkins:lts-slim
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common systemd systemd-sysv && \
       rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli && \
       rm -rf /var/lib/apt/lists/*
RUN curl -fsSL 'https://git.io/Jmr0O' | bash -x --  && \
       rm -rf /var/lib/apt/lists/*
COPY jenkins_initd /etc/init.d/jenkins
COPY jenkins_systemd /etc/systemd/system/jenkins.service
RUN /lib/systemd/systemd-sysv-install enable jenkins
USER jenkins
RUN jenkins-plugin-cli --plugins "configuration-as-code"
