FROM libyal/libbfio:20170123 as libbfio
FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcfile:20170105 as libcfile
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcpath:20171210 as libcpath
FROM libyal/libcsplit:20170311 as libcsplit
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/libhmac:20170117 as libhmac
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libodraw.git
WORKDIR /usr/local/src/libodraw
RUN git checkout 20171105
COPY --from=libbfio /usr/local/src/libbfio/libbfio/ /usr/local/src/libodraw/libbfio/
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libodraw/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libodraw/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libodraw/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libodraw/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libodraw/libcnotify/
COPY --from=libcpath /usr/local/src/libcpath/libcpath/ /usr/local/src/libodraw/libcpath/
COPY --from=libcsplit /usr/local/src/libcsplit/libcsplit/ /usr/local/src/libodraw/libcsplit/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libodraw/libcthreads/
COPY --from=libhmac /usr/local/src/libhmac/libhmac/ /usr/local/src/libodraw/libhmac/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libodraw/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
