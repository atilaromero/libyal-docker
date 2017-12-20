FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcerror.git
WORKDIR /usr/local/src/libcerror
RUN /usr/local/src/checkout.sh latest
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
