FROM libyal/libbfio:20170123 as libbfio
FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcfile:20170105 as libcfile
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcpath:20171210 as libcpath
FROM libyal/libcsplit:20170311 as libcsplit
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/libfcache:20170111 as libfcache
FROM libyal/libfdata:20170112 as libfdata
FROM libyal/libfvalue:20170113 as libfvalue
FROM libyal/libhmac:20170117 as libhmac
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libsmraw.git
WORKDIR /usr/local/src/libsmraw
RUN git checkout 20171105
COPY --from=libbfio /usr/local/src/libbfio/libbfio/ /usr/local/src/libsmraw/libbfio/
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libsmraw/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libsmraw/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libsmraw/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libsmraw/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libsmraw/libcnotify/
COPY --from=libcpath /usr/local/src/libcpath/libcpath/ /usr/local/src/libsmraw/libcpath/
COPY --from=libcsplit /usr/local/src/libcsplit/libcsplit/ /usr/local/src/libsmraw/libcsplit/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libsmraw/libcthreads/
COPY --from=libfcache /usr/local/src/libfcache/libfcache/ /usr/local/src/libsmraw/libfcache/
COPY --from=libfdata /usr/local/src/libfdata/libfdata/ /usr/local/src/libsmraw/libfdata/
COPY --from=libfvalue /usr/local/src/libfvalue/libfvalue/ /usr/local/src/libsmraw/libfvalue/
COPY --from=libhmac /usr/local/src/libhmac/libhmac/ /usr/local/src/libsmraw/libhmac/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libsmraw/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
