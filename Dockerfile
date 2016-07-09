FROM tomcat
MAINTAINER "mkuchin@gmail.com"
RUN apt-get update && apt-get install -yq nano less
RUN echo 'export TERM=xterm' >> ~/.bashrc
ADD server.xml conf/

ADD . /context/

# copy master in case of master branch and HEAD in case of tag
RUN if [ -f /context/master ]; then  cat /context/master; else cat /context/HEAD; fi > version

# workdir is /usr/local/tomcat/
ADD app webapps/app
RUN cp version webapps/app/version.txt
EXPOSE 8080
