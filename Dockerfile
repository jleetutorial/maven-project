# we are extending everything from tomcat:8.0 image ...
FROM tomcat:8.0
MAINTAINER PrasadT@hexaware.com

# Expose 8080 port for the service
EXPOSE 8080

ENTRYPOINT /bin/bash
