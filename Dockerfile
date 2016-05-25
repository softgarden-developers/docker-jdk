FROM centos:7
MAINTAINER Stefan Schueffler <s.schueffler@softgarden.de>

ENV JDK_VERSION=8u92 \
    JDK_BUILD_VERSION=b14 \
    JDK_VERSION_FOLDER=1.8.0_92 \
    LANG=en_US.UTF-8

# Download Oracle Java
RUN yum update -y \
    && curl -OL "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_VERSION/jdk-$JDK_VERSION-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
    && yum install -y jdk-$JDK_VERSION-linux-x64.rpm \
    && yum clean all \
    && rm -f jdk-$JDK_VERSION-linux-x64.rpm

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/java/jdk${JDK_VERSION_FOLDER}

# Download and copy JDK8 unlimited strength policy files
RUN curl -OL "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
    && yum install -y unzip \
    && yum clean all \
    && unzip jce_policy-8.zip \
    && mv UnlimitedJCEPolicyJDK8/*.jar ${JAVA_HOME}/jre/lib/security/ \
    && rm jce_policy-8.zip \
    && rm -rf UnlimitedJCEPolicyJDK8
