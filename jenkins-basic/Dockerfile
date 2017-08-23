FROM jenkins/jenkins:2.75

# Install docker
USER root
RUN curl -sSL https://get.docker.com/ | sh

# Install maven
ENV MAVEN_VERSION 3.5.0
RUN curl -fsSLo m.tgz http://apache.fayea.com/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xvzf m.tgz && \
    mv apache-maven-${MAVEN_VERSION} /var/maven && \
    rm m.tgz
ENV PATH /var/maven/bin:$PATH

# Install jenkins plugin
RUN /usr/local/bin/install-plugins.sh \
  git \
  workflow-aggregator

# Set entry script and disable login
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
