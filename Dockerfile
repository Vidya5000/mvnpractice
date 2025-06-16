FROM alpine:latest

RUN  apk add openjdk17-jre 

WORKDIR /opt

ADD  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.106/bin/apache-tomcat-9.0.106.tar.gz .

RUN tar xf apache-tomcat-9.0.106.tar.gz
 
RUN rm -rf apache-tomcat-9.0.106.tar.gz

RUN mv apache-tomcat-9.0.106 tomcat9

COPY target/mvnpractice.war /opt/tomcat9/webapps

EXPOSE 8080

CMD ["/opt/tomcat11/bin/catalina.sh", "run"]
