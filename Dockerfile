FROM tomcat
MAINTAINER "mkuchin@gmail.com"
RUN apt-get update && apt-get install -yq nano less
RUN echo 'export TERM=xterm' >> ~/.bashrc
ADD server.xml conf/
# workdir is /usr/local/tomcat/
ADD app webapps/app
EXPOSE 8080
