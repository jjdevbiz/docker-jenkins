FROM debian:jessie

ENV VER 1.626

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    rm -rf /var/lib/apt/lists/*
ADD http://mirrors.jenkins-ci.org/war/${VER}/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]
