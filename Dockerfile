FROM tomcat
LABEL maintainer address "vamshi"
COPY **/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
EXPOSE 8080


--FROM     ubuntu
--LABEL    maintainer address "sai12"
--RUN      apt update
--RUN      apt install apache2 -y
--RUN      mkdir sai
--WORKDIR  /var/www/html
--COPY     ./index.html .
--CMD      ["apachectl", "-D","FOREGROUND"]
--EXPOSE   80
