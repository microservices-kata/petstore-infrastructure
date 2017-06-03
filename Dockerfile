FROM jenkinsci/jenkins:2.63

# Install docker
USER root
RUN curl -sSL https://get.docker.com/ | sh

# Install jenkins plugin
RUN /usr/local/bin/install-plugins.sh \
    docker-commons \
    docker-workflow \
    git \
    workflow-aggregator

# Config jenkins
ADD jenkins_home/config.xml /var/jenkins_home/config.xml

USER jenkins