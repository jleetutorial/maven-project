FROM ubuntu:latest
MAINTAINER DevopsEasyLearning
RUN apt-get update
RUN apt-get -y install httpd
RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/
EXPOSE 80
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
