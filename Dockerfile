FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2

COPY fp_klavdievo/ /var/www/localhost/htdocs/

# Add group write access


# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
