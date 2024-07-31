//-------------------------------------- war --------------------------

FROM tomcat
LABEL maintainer address "vamshi"
COPY **/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
EXPOSE 8080

//---------------------------------------------- apache2 index.html --------------------------------

--FROM     ubuntu
--LABEL    maintainer address "sai12"
--RUN      apt update
--RUN      apt install apache2 -y
--RUN      mkdir sai
--WORKDIR  /var/www/html
--COPY     ./index.html .
--CMD      ["apachectl", "-D","FOREGROUND"]
--EXPOSE   80


//------------------------------------- jar ----------------------------
Dockerfile write in jar file 

FROM openjdk:latest
LABEL maintainer address "vamshi"
RUN mkdir app3
ADD **/*.jar  app3.jar
CMD ["java","-jar","./app3.jar"]
EXPOSE 8080

//--------------------------------- ear -------------------------------

FROM jboss/wildfly:latest
WORKDIR /koti
COPY **/*.ear .
CMD ["/opt/jboss/wildfly/bin/standalone.sh","-b","0.0.0.0"]
EXPOSE 8080

