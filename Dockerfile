FROM ubuntu:20.04

# Install.
RUN \
  apt-get clean && \
  apt-get -y update && \
  apt-get install apache2 -y && \
  apt-get install apache2-utils -y && \
  apt-get autoremove &&
  # useradd -ms /bin/bash builder

# Copy final project files
COPY /home/yaroslav_botsman/fp_klavdievo /var/www/html

# Apache ports
EXPOSE 80
EXPOSE 443
# EXPOSE 8004

# Start non-daemonized webserver
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
