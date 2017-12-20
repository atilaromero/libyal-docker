FROM libyal/libcdata as libcdata
FROM libyal/libcerror as libcerror
FROM libyal/libcnotify as libcnotify
FROM libyal/libcthreads as libcthreads
FROM libyal/libfcache as libfcache
FROM libyal/builder:debian-sid-1.1.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libfdata.git
WORKDIR /usr/local/src/libfdata
RUN /usr/local/src/checkout.sh latest
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfdata/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfdata/libcerror/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libfdata/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfdata/libcthreads/
COPY --from=libfcache /usr/local/src/libfcache/libfcache/ /usr/local/src/libfdata/libfcache/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
