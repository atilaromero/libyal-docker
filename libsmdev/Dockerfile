FROM libyal/libcdata as libcdata
FROM libyal/libcerror as libcerror
FROM libyal/libcfile as libcfile
FROM libyal/libclocale as libclocale
FROM libyal/libcnotify as libcnotify
FROM libyal/libcthreads as libcthreads
FROM libyal/libuna as libuna
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libsmdev.git
WORKDIR /usr/local/src/libsmdev
RUN /usr/local/src/checkout.sh latest
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libsmdev/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libsmdev/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libsmdev/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libsmdev/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libsmdev/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libsmdev/libcthreads/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libsmdev/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
