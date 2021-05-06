FROM ubuntu:latest

RUN apt-get update && \
      apt-get install -y systemd systemd-sysv && \
      rm -rf /var/lib/apt/lists/*
      
ENTRYPOINT [ "/sbin/init" ]
