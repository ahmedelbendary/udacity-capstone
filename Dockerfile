FROM debian:buster-slim


Test hadolint checks
RUN apt-get  -y update \
    && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3008
RUN apt update && apt-get  install nginx  -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR  /opt

COPY index.html /var/www/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

