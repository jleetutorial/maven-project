FROM tomcat:8.0-alpine
COPY webapp/target/webapp.war  /usr/local/tomcat/webapps
