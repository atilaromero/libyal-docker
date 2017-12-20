FROM libyal/libcerror as libcerror
FROM libyal/libcthreads as libcthreads
FROM libyal/builder:debian-sid-1.1.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcdata.git
WORKDIR /usr/local/src/libcdata
RUN /usr/local/src/checkout.sh latest
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcdata/libcerror/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libcdata/libcthreads/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
