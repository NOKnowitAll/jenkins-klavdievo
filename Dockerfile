FROM node:16-alpine

FROM alpine:latest
RUN apk add apache2

COPY /home/yaroslav_botsman/fp_klavdievo /var/www/localhost/htdocs
CMD ["sh"]


