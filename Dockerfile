ARG PLATFORM
ARG VERSION
FROM $PLATFORM as builder
ARG VERSION

RUN \
  apt update && \
  apt -y install \
    build-essential \
    autoconf \
    autotools-dev \
    libncursesw5-dev \
    wget
RUN \
  wget https://github.com/htop-dev/htop/archive/${VERSION}.tar.gz && \
  tar xzf ${VERSION}.tar.gz && \
  cd htop-${VERSION} && \
  ./autogen.sh && \
  ./configure && \
  make && \
  mkdir -p /assets/ && \
  cp htop /assets/htop-${VERSION}

FROM scratch
ARG VERSION
COPY --from=builder /assets/htop-${VERSION} /
