FROM jenkins/jenkins
MAINTAINER wovvan
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

RUN curl -fsSL get.docker.com -o get-docker.sh
RUN chmod +x get-docker.sh
RUN ./get-docker.sh

USER jenkins
# Set Defaults
#ENV JAVA_OPTS="-Xmx4096m"
#ENV JENKINS_OPTS=" --handlerCountStartup=100 --handlerCountMax=300 --prefix=/jenkins --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
ENV JENKINS_OPTS=" --prefix=/jenkins "
