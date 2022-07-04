FROM ubuntu:18.04

RUN apt-get update && apt-get install wget unzip -y

WORKDIR /mnt/docker

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.zip && unzip apache-tomcat-9.0.63.zip && apt-get install default-jdk -y

RUN cd apache-tomcat-9.0.63 && chmod -R 755 bin

ADD /mnt/gameoflife.war /mnt/docker/apache-tomcat-9.0.63/webapps/

EXPOSE 8080

CMD ["apache-tomcat-9.0.63/bin/catalina.sh", "run"]
