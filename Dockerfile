FROM centos:latest
LABEL maintainer="reynoldsm88@gmail.com"

USER root

RUN yum upgrade -y

RUN yum install -y java-1.8.0-openjdk && \
    yum install -y net-tools && \
    yum install -y which && \
    yum install -y python3 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    yum clean all && \
    rm -r -f /var/cache/yum && \
    mkdir -p /opt/app/{bin,conf,data,pkg,tmp}

ENV JAVA_HOME /usr
ENV GLOBAL_JAVA_OPTS "-Dfile.encoding=UTF-8"

ENTRYPOINT /bin/bash
