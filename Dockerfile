FROM tomcat
MAINTAINER "mkuchin@gmail.com"
RUN apt-get update && apt-get install -yq nano less
RUN echo 'export TERM=xterm' >> ~/.bashrc
ADD server.xml conf/

# copy master in case of master branch and HEAD in case of tag
ADD .git/refs/heads ./git
ADD .git/HEAD ./git
RUN if [ -f git/master ]; then  cat git/master; else cat git/HEAD; fi > version

# workdir is /usr/local/tomcat/
ADD app webapps/app
EXPOSE 8080
