FROM libyal/libcdata as libcdata
FROM libyal/libcerror as libcerror
FROM libyal/libcfile as libcfile
FROM libyal/libclocale as libclocale
FROM libyal/libcnotify as libcnotify
FROM libyal/libcpath as libcpath
FROM libyal/libcsplit as libcsplit
FROM libyal/libcthreads as libcthreads
FROM libyal/libuna as libuna
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libbfio.git
WORKDIR /usr/local/src/libbfio
RUN /usr/local/src/checkout.sh latest
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libbfio/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libbfio/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libbfio/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libbfio/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libbfio/libcnotify/
COPY --from=libcpath /usr/local/src/libcpath/libcpath/ /usr/local/src/libbfio/libcpath/
COPY --from=libcsplit /usr/local/src/libcsplit/libcsplit/ /usr/local/src/libbfio/libcsplit/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libbfio/libcthreads/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libbfio/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
