FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2

ADD --chown=www-data:www-data ./fp_klavdievo/ /var/www/html/

# Add group write access


# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
