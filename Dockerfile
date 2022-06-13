FROM centos:latest
LABEL maintainer="reynoldsm88@gmail.com"

USER root

ENV JAVA_HOME /usr
ENV GLOBAL_JAVA_OPTS "-Dfile.encoding=UTF-8"

RUN mkdir -p /opt/app/{bin,conf,data,pkg,tmp} && \
    cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum upgrade -y

RUN yum install -y make gcc openssl-devel bzip2-devel libffi libffi-devel net-tools which && \
    yum install -y java-1.8.0-openjdk

# Install python 3.7 from source...
RUN curl -o Python-3.7.3.tgz https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz && \
    tar -xf Python-3.7.3.tgz && \
    cd Python-3.7.3 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    cd ..

RUN rm -rf Python-3* && \
    ln -s /usr/local/bin/python3.7 /usr/local/bin/python && \
    ln -s /usr/local/bin/python3.7 /usr/local/bin/python3 && \
    yum install -y python3-pip && \
    yum clean all && \
    rm -r -f /var/cache/yum

ENTRYPOINT /bin/bash
