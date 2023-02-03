FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2

ADD ./fp_klavdievo/ /var/www/localhost/htdocs/

# Add group write access
RUN chmod 0755 /var/www/html/

# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
