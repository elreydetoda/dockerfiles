FROM cimg/rust:1.62-node as builder
RUN git clone --recursive --branch master https://github.com/asciinema/asciinema-player.git
WORKDIR /home/circleci/project/asciinema-player
RUN rustup target add wasm32-unknown-unknown \
        && npm install && npm run build && npm run bundle

FROM python:3-alpine
ENTRYPOINT [ "python3" ]
CMD [ "-m", "http.server" ]
EXPOSE 8000
COPY --from=builder /home/circleci/project/asciinema-player/dist /dist
COPY index.html index.html