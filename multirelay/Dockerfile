FROM python:2 as builder
ARG VERSION=v3.0.1.0
RUN pip install --user pycrypto
RUN git clone --branch ${VERSION} https://github.com/lgandx/Responder.git

FROM python:2-slim
COPY --from=builder /root/.local /root/.local
COPY --from=builder /Responder /Responder
WORKDIR /Responder/tools/
CMD ['-h']
ENTRYPOINT ["python", "MultiRelay.py"]