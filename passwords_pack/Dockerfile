FROM python:2-slim
LABEL maintainer="Alex (elrey741) <dockerfile-social-contact@elrey741.33mail.com>"

# pre-reqs
RUN set -eux \
	&& apt-get update && apt-get install -y git \
  && git clone https://github.com/iphelix/PACK pack \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /pack

CMD [ "-c", "import os; print(' '.join(os.listdir('.')))" ]

ENTRYPOINT [ "python" ]
