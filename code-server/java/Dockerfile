FROM codercom/code-server:latest

RUN sudo apt-get update && \
        sudo apt-get install -y default-jdk-headless && \
        sudo rm -rf /var/lib/apt/lists/*

EXPOSE 8080
# This way, if someone sets $DOCKER_USER, docker-exec will still work as
# the uid will remain the same. note: only relevant if -u isn't passed to
# docker-run.
USER 1000
ENV USER=coder
WORKDIR /home/coder
ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]
