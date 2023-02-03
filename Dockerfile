FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2

ADD fp_klavdievo/ /var/www/html/

# Add group write access
RUN \
  usermod -u 1000 www-data && \
  chown -R ubuntu:www-data /var/www && \
  find /var/www -type d -exec chmod 2750 {} \+ && \
  find /var/www -type f -exec chmod 640 {} \+ && \
  chgrp -R www-data /var/www && \
  find /var/www -type d -exec chmod g+rx {} + && \
  find /var/www -type f -exec chmod g+r {} + && \
  chown -R ubuntu /var/www/ && \
  find /var/www -type d -exec chmod u+rwx {} + && \
  find /var/www -type f -exec chmod u+rw {} + && \
  find /var/www -type d -exec chmod g+s {} + && \
  chmod -R o-rwx /var/www/

# Apache ports
EXPOSE 80
# EXPOSE 443

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
