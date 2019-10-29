FROM centos:7
MAINTAINER Stefan Schueffler <s.schueffler@softgarden.de>

ENV JDK_VERSION=11.0.5.10 \
    LANG=en_US.UTF-8

# install openjdk-devel
RUN    yum -y update \
    && yum -y install java-11-openjdk-devel-${JDK_VERSION} \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java
