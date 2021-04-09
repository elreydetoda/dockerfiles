# hartator/wayback-machine-downloader:latest as of 2021-04-09
FROM hartator/wayback-machine-downloader@sha256:9aace3295188e6993d5af0c3487e2167dd2f60106502e942915e2b0ea3d4ed11 AS build-image

RUN apt-get update && apt-get install -y silversearcher-ag && \
        rm -rf /var/lib/apt/lists/*

COPY build.sh build.sh

RUN bash /build.sh

FROM nginx:1.19.9 as runtime-image

COPY --from=build-image /websites/try.github.io/* /usr/share/nginx/html/
COPY --from=build-image /websites/try.github.io/levels/ /usr/share/nginx/html/levels/

COPY default.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
