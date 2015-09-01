FROM tomcat
MAINTAINER "mkuchin@gmail.com"
RUN apt-get update
RUN apt-get install -y haveged
ADD /app /usr/local/tomcat/webapps/app
EXPOSE 8080
