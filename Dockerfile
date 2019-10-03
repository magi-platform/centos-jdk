FROM centos:latest
LABEL maintainer="reynoldsm88@gmail.com"

USER root

RUN yum upgrade -y

RUN yum install -y java-1.8.0-openjdk && \
    yum install -y net-tools && \
    yum install -y which && \
    yum clean all && \
    rm -r -f /var/cache/yum

ENV _JAVA_OPTIONS=-Dfile.encoding=UTF-8
ENV JAVA_HOME /usr

CMD /bin/bash