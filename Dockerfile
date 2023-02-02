FROM ubuntu:20.04

# Install.
RUN \
  apt-get update && \
  apt-get install apache2 && \
  apt-get install apache2-utils && \
  № apt-get clean -y
  # useradd -ms /bin/bash builder

# Copy final project files
COPY /home/yaroslav_botsman/fp_klavdievo /var/www/html

# Apache ports
EXPOSE 80
EXPOSE 443
# EXPOSE 8004

# Start non-daemonized webserver
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
