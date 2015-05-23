FROM dweinstein/theos-sdks:latest

RUN apt-get install -qq --no-install-recommends \
      make \
      openssh-client \
      vim \
      wget \
      socat \
      gcc \
      g++ \
      clang \
      libclang-dev \
      uuid-dev \
      libssl-dev \
      libpng12-dev \
      libicu-dev \
      bison \
      flex \
      libsqlite3-dev \
      libtool \
      llvm-dev \
      libxml2-dev \
      automake \
      pkg-config

ADD https://github.com/waneck/linux-ios-toolchain/archive/master.tar.gz /opt/linux-ios-toolchain.tgz
ADD https://github.com/tpoechtrager/cctools-port/archive/master.tar.gz /opt/cctools-port.tgz

ENV CC clang
ENV CXX clang++

RUN tar -C /opt -zxvf /opt/linux-ios-toolchain.tgz && \
  mv /opt/linux-ios-toolchain-master /opt/linux-ios-toolchain && \
  tar -C /opt -zxvf /opt/cctools-port.tgz && \
  rm -rf /opt/linux-ios-toolchain/build/cctools && \
  mv /opt/cctools-port-master /opt/linux-ios-toolchain/build/cctools && \
  rm -f /opt/cctools-port.tgz && \
  rm -f /opt/linux-ios-toolchain.tgz && \
  cd /opt/linux-ios-toolchain && \
  echo $CC && \
  $CC -v && \
  ./configure arm-apple-darwin && \
  make -j4 && \
  make install


