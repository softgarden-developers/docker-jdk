FROM docker.softgarden.de/sgops/base:8

ENV JDK_VERSION=11.0.14.0.9 \
    LANG=en_US.UTF-8

# install openjdk-devel
RUN    yum -y update \
    && yum -y install java-11-openjdk-devel-${JDK_VERSION} \
    && yum -y install langpacks-de glibc-all-langpacks \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java


ARG REVISION
LABEL org.opencontainers.image.authors="Stefan Schueffler <s.schueffler@softgarden.de>"
LABEL org.opencontainers.image.vendor="softgarden e-recruiting GmbH"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.version=openjdk-11.0.14
