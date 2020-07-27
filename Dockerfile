FROM debian:buster-slim

RUN apt-get  -y update 

RUN apt-get  install nginx -y

WORKDIR  /opt

COPY index.html /var/www/html


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

