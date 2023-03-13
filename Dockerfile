FROM docker.softgarden.de/sgops/base:9

ENV JDK_VERSION=11 \
    LANG=en_US.UTF-8

# install openjdk-devel
RUN    yum -y install java-11-openjdk-devel \
    && yum -y install langpacks-de glibc-all-langpacks \
    && yum clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java


ARG REPOSITORY_REVISION
ARG REPOSITORY_URL
LABEL org.opencontainers.image.authors="Stefan Schueffler <s.schueffler@softgarden.de>"
LABEL org.opencontainers.image.vendor="softgarden e-recruiting GmbH"
LABEL org.opencontainers.image.source=$REPOSITORY_URL
LABEL org.opencontainers.image.revision=$REPOSITORY_REVISION
LABEL org.opencontainers.image.version=openjdk-11
