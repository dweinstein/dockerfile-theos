FROM debian:jessie

ENV THEOS /opt/theos

RUN apt-get update
RUN apt-get install -qq -y --no-install-recommends \
      git \
      perl \
      curl \
      build-essential

ADD https://github.com/DHowett/theos/archive/master.tar.gz /opt/theos.tar.gz
RUN tar -C /opt -zxvf /opt/theos.tar.gz && \
      mv -v /opt/theos-master/ /opt/theos && \
      rm -f /opt/theos.tar.gz

RUN cd /opt && \
      git clone git://git.saurik.com/ldid.git && \
      cd ldid && \
      git submodule update --init && \
      ./make.sh && \
      cp -f ./ldid ${THEOS}/bin/ldid

#ENV THEOS_DEVICE_IP 127.0.0.1
#ENV THEOS_DEVICE_PORT 22


RUN apt-get purge -y man build-essential && \
      apt-get autoremove -y && \
      rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR ${THEOS}

