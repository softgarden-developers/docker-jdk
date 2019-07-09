FROM centos:7
MAINTAINER Stefan Schueffler <s.schueffler@softgarden.de>

ENV JDK_VERSION=11.31+11 \
    LANG=en_US.UTF-8

# Pull Zulu OpenJDK binaries from official repository:
RUN    yum -y update \
    && rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems \
    && curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo \
    && yum -y install zulu-11-${JDK_VERSION} \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/zulu-11

