//-------------------------------------- war --------------------------

FROM tomcat
LABEL maintainer address "vamshi"
COPY **/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
EXPOSE 8080
//------------------------------------------------------------------------------------------
a. Use ubuntu as the base image.
b. Install apache2 and configure it to work on 6400 port.

FROM ubuntu
RUN apt-get update && apt-get install -y apache2
RUN sed -e 's/80/6400/g' /etc/apache2/ports.conf > tmp_ports.config
RUN mv tmp_ports.config /etc/apache2/ports.conf
EXPOSE 6400
CMD ["apache2ctl", "-D", "FOREGROUND", "-k", "start"]


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

//-----------------------------------jar----------------------------


FROM openjdk:8u151-jdk-alpine3.7

EXPOSE 8070

ENV APP_HOME /usr/src/app

COPY target/shopping-cart-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

ENTRYPOINT exec java -jar app.jar
//--------------------------------- ear -------------------------------

FROM jboss/wildfly:latest
WORKDIR /koti
COPY **/*.ear .
CMD ["/opt/jboss/wildfly/bin/standalone.sh","-b","0.0.0.0"]
EXPOSE 8080

