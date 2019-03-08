From tomcat:8.0

Add ./webapp/target/*.war/user/local/tomcat/webapps/

Expose 8080

CMD ["catalina.sh", "run"]