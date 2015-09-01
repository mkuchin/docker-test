FROM tomcat
MAINTAINER "mkuchin@gmail.com"
RUN apt-get update && apt-get install -yq nano less
RUN echo 'export TERM=xterm' >> ~/.bashrc
ADD /app /usr/local/tomcat/webapps/app
EXPOSE 8080
