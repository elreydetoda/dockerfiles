FROM docker.io/ubuntu
# https://www.reddit.com/r/Bitwarden/comments/xhir0q/comment/ioxvw2h/?utm_source=share&utm_medium=web2x&context=3
RUN set -ex && apt-get update && apt-get install -y curl libarchive-tools libsecret-1-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
RUN  set -ex && curl -fsSL 'https://vault.bitwarden.com/download/?app=cli&platform=linux' | bsdtar -xvf - && chmod +x bw
ENTRYPOINT [ "bw" ]