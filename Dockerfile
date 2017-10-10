FROM centos:7
MAINTAINER Stefan Schueffler <s.schueffler@softgarden.de>

ENV JDK_VERSION=8.23.0.3 \
    LANG=en_US.UTF-8

# Pull Zulu OpenJDK binaries from official repository:
RUN    yum -y update \
    && rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems \
    && curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo \
    && yum -y install zulu-8-${JDK_VERSION} \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/zulu-8

# Download and copy JDK8 unlimited strength policy files
RUN    curl -OL http://cdn.azul.com/zcek/bin/ZuluJCEPolicies.zip \
    && yum -y install unzip \
    && yum clean all \
    && unzip ZuluJCEPolicies.zip \
    && mv -f ZuluJCEPolicies/*.jar ${JAVA_HOME}/jre/lib/security/ \
    && rm -f ZuluJCEPolicies.zip \
    && rm -rf ZuluJCEPolicies
