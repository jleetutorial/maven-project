FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y apache2 apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/www/html/* 
COPY  index.html  /var/www/html/
EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
