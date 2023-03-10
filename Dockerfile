FROM node:16-alpine
MAINTAINER Yaroslav Botsman

FROM alpine:latest
RUN apk add apache2
WORKDIR /var/www/localhost/htdocs/

# Transfer files into the Docker image
ADD fp_klavdievo/  .

# RUN ls -la ./

# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
