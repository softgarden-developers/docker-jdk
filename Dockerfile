FROM centos:7
MAINTAINER Stefan Schueffler <s.schueffler@softgarden.de>

ENV JDK_VERSION=11.0.5+10 \
    LANG=en_US.UTF-8

# install AdoptOpenJDK from their official repository
RUN    yum -y update \
    && echo -e "\
[AdoptOpenJDK] \n\
name=AdoptOpenJDK \n\
baseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/7/$(uname -m) \n\
enabled=1 \n\
gpgcheck=1 \n\
gpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public \n\
" > /etc/yum.repos.d/adoptopenjdk.repo \
    && yum -y install adoptopenjdk-11-openj9-${JDK_VERSION}-1 \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/adoptopenjdk-11-openj9
