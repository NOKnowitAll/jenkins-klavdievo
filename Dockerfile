FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2
WORKDIR /var/www/localhost/htdocs/

#Copy project's files to remote server
ADD fp_klavdievo/  .

RUN ls -la ./


# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
