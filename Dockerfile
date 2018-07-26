FROM openjdk:8-jdk-alpine

MAINTAINER Archer lin <linsfg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV OPENOFFICEVERSION 4.1.5
ENV OPENOFFICEPACKAGE Apache_OpenOffice_4.1.5_Linux_x86-64_install-deb_en-US.tar.gz
ENV uid 1000
ENV gid 1000

RUN useradd -m openoffice

RUN wget -q http://downloads.sourceforge.net/project/openofficeorg.mirror/$OPENOFFICEVERSION/binaries/en-US/$OPENOFFICEPACKAGE -O /tmp/$OPENOFFICEPACKAGE; \
    mkdir /tmp/OpenOffice; \
    tar -xzf /tmp/$OPENOFFICEPACKAGE -C /tmp/OpenOffice; \
    dpkg -i /tmp/OpenOffice/en-US/DEBS/*.deb; \
    dpkg -i /tmp/OpenOffice/en-US/DEBS/desktop-integration/*.deb; \
    rm -rf /tmp/$OPENOFFICEPACKAGE; \
    rm -rf /tmp/OpenOffice

COPY start-openoffice.sh /tmp/

ENTRYPOINT ["/tmp/start-openoffice.sh"]
