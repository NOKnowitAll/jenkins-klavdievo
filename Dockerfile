FROM ubuntu 
RUN apt update 
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt clean
COPY /home/yaroslav_botsman/fp_klavdievo /var/www/html
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]
